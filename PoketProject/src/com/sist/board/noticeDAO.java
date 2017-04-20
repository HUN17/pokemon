package com.sist.board;
import java.sql.*;
import java.util.*;

public class noticeDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@211.238.142.235:1521:ORCL";
	private static noticeDAO dao;
	
	public noticeDAO(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	public static noticeDAO newInstance(){
		if(dao==null)
			dao=new noticeDAO();
		return dao;
	}
	
	
	public void disConnection(){
		try{
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}

	public void getConnection(){
		try{
			conn=DriverManager.getConnection(URL, "scott", "tiger");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	public List<noticeVO> nboardListData(int page){
		ArrayList<noticeVO> list=new ArrayList<>();
		
		try{
			getConnection();
			String sql="SELECT no,subject,name,Exp,regdate,hit,group_tab "
					+"FROM nBoard "
					+"ORDER BY group_id DESC,group_step ASC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			int i=0;
			int j=0;
			int pagecnt=(page*10)-10;
			/*
			 * 		13 	=> 0~9,		10~12
			 * 		1page		2page 		3page
			 * 		  0			  10		  20		
			 * 		  9			  19		  29
			 */
			while(rs.next()){
				if(i<10 && j>=pagecnt){
					noticeVO vo=new noticeVO();
					vo.setNo(rs.getInt(1));
					vo.setSubject(rs.getString(2));
					vo.setName(rs.getString(3));
					vo.setExp(rs.getInt(4));
					vo.setRegdate(rs.getDate(5));
					vo.setHit(rs.getInt(6));
					vo.setGroup_tab(rs.getInt(7));
					list.add(vo);
					i++;
				}
				j++;
			}		
		}catch(Exception ex){
			System.out.println("boardListData():"+ex.getMessage());
		}finally{
			disConnection();
		}
		
		
		return list;
	}
	
	public int boardTotalPage(){
		int total=0;
		try{
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/10) FROM nBoard";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
			
		}catch(Exception ex){
			System.out.println("boardTotalPage()"+ex.getMessage());
		}finally{
			disConnection();
		}
		
		return total;
	}
	
	public int boardRowCount(){
		int total=0;
		try{
			getConnection();
			String sql="SELECT COUNT(*) FROM nBoard";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();	
			
		}catch(Exception ex){
			System.out.println("boardRowCount()"+ex.getMessage());
		}finally{
			disConnection();
		}
		
		return total;
	}
	
	public int boardFindCount(String fs,String ss){
		int count=0;
		try{
			getConnection();
			String sql="SELECT COUNT(*) "
					+"FROM nBoard "
					+"WHERE "+fs+" LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, ss);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}finally{
			disConnection();
		}
		return count;
	}
	
	public List<noticeVO> nboardFindData(String fs, String ss){
		List<noticeVO> list=new ArrayList<>();
		
		try{
			getConnection();
			String sql="SELECT no,subject,name,Exp,regdate,hit,group_tab "
					+"FROM nBoard "
					+"WHERE "+fs+" LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, ss);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				noticeVO vo=new noticeVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setExp(rs.getInt(4));
				vo.setRegdate(rs.getDate(5));
				vo.setHit(rs.getInt(6));
				vo.setGroup_tab(rs.getInt(7));
				list.add(vo);
			}
			rs.close();
			
		}catch(Exception ex){
			System.out.println("boardFindData():"+ex.getMessage());
		}finally{
			disConnection();
		}
		return list;
	}
	
	public noticeVO boardContent(int no,int type){
		noticeVO vo=new noticeVO();
		
		try{
			getConnection();
			String sql="";
			if(type==1){
				sql="UPDATE nBoard SET "
						+"hit=hit+1 "
						+"WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
				ps.close();
			}
			
			sql="SELECT no,name,id,Exp,subject,content,regdate,hit "
					+"FROM nBoard "
					+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setId(rs.getString(3));
			vo.setExp(rs.getInt(4));
			vo.setSubject(rs.getString(5));
			vo.setContent(rs.getString(6));
			vo.setRegdate(rs.getDate(7));
			vo.setHit(rs.getInt(8));
			rs.close();		
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}finally{
			disConnection();
		}
			
		return vo;
	}
	//SEQUENCE INSERT,UPDATE,SELECT
	public void boardReply(int pno,noticeVO vo){
		try{
			getConnection();
			String sql="SELECT group_id,group_step,group_tab "
					+"FROM nBoard "
					+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int gi=rs.getInt(1);
			int gs=rs.getInt(2);
			int gt=rs.getInt(3);
			rs.close();
			ps.close();

			sql="UPDATE nBoard SET "
					+"group_step=group_step+1 "
					+"WHERE group_id=? AND group_step>?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gi);
			ps.setInt(2, gs);
			ps.executeUpdate();
			ps.close();
			

			sql="INSERT INTO nBoard(no,name,id,Exp,subject,content,pwd,group_id,group_step,group_tab,root) "
					+"VALUES(nt_board_no.nextval,?,?,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getId());
			ps.setInt(3, vo.getExp());
			ps.setString(4, vo.getSubject());
			ps.setString(5, vo.getContent());
			ps.setString(6, vo.getPwd());
			ps.setInt(7, gi);
			ps.setInt(8, gs+1);
			ps.setInt(9, gt+1);
			ps.setInt(10, pno);
			ps.executeUpdate();
			ps.close();
			//depth=depth+1
			sql="UPDATE nBoard SET "
					+"depth=depth+1 "
					+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ps.executeUpdate();
			
		}catch(Exception ex){
			System.out.println("boardReply():"+ex.getMessage());
		}finally{
			disConnection();
		}
	}
	
	public void boardInsert(noticeVO vo){
		try{
			getConnection();
			String sql="INSERT INTO nBoard(no,name,id,Exp,subject,content,pwd,group_id) "
					+"VALUES(nt_board_no.nextval,?,?,?,?,?,?,"
					+"(SELECT NVL(MAX(group_id)+1,1) FROM nBoard))";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getId());
			ps.setInt(3, vo.getExp());
			ps.setString(4, vo.getSubject());
			ps.setString(5, vo.getContent());
			ps.setString(6, vo.getPwd());
			
			ps.executeUpdate();
			
		}catch(Exception ex){
			System.out.println("boardInsert():"+ex.getMessage());
		}finally{
			disConnection();
		}
	}
	

	public boolean boardUpdate(noticeVO vo){
		boolean bCheck = false;
		
		try {
			getConnection();

			String sql= "SELECT pwd FROM nBoard "
					+"WHERE no=?";
			ps =conn.prepareStatement(sql);
			ps.setInt(1,vo.getNo());
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd = rs.getString(1);
			rs.close();
			ps.close();

			if(db_pwd.equals(vo.getPwd())){
				bCheck = true;
				sql ="UPDATE nBoard SET "
						+"name=?, "
						
						+"subject=?,content=? "
						+"WHERE no=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getId());
				ps.setInt(3, vo.getExp());
				ps.setString(4, vo.getSubject());
				ps.setString(5, vo.getContent());
				ps.setInt(6, vo.getNo());
				ps.executeUpdate();
			} else {
				bCheck = false;
			}
			
		} catch (Exception e) {
			//System.out.println("boardUpdate():"+e.getMessage());
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return bCheck;
	}
			
	public noticeVO boardUpdateData(int no){
		noticeVO vo = new noticeVO();
		try {
			getConnection();
			String sql ="SELECT * "
					+"FROM nBoard "
					+"WHERE no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setId(rs.getString(3));
			vo.setExp(rs.getInt(4));
			vo.setSubject(rs.getString(5));
			vo.setContent(rs.getString(6));
			vo.setPwd(rs.getString(7));
			vo.setRegdate(rs.getDate(8));
			vo.setHit(rs.getInt(9));			
			rs.close();
		} catch (Exception e) {
			System.out.println("boardUpdateData()"+e.getMessage());
		} finally {
			disConnection();
		}
		return vo;
	}
	
	public boolean boardDelete(int no,String pwd){
		boolean bCheck = false;
		
		try {
			getConnection();
			String sql ="SELECT pwd FROM nBoard "
					+"WHERE no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd = rs.getString(1);
			rs.close();
			ps.close();
			
			if(db_pwd.equals(pwd)){
				bCheck = true;
				sql = "DELETE FROM nBoard "
						+"WHERE no=?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
			} else {
				bCheck = false;
			}
			
		} catch (Exception e) {
			System.out.println("boardDelete():"+e.getMessage());
		} finally {
			disConnection();
		}
		return bCheck;
	}
	
	public List<noticeVO> noticeMiniData(int page){
		ArrayList<noticeVO> list  = new ArrayList<>();
		
		try{
			getConnection();
			/*String sql="SELECT no,subject,name,hit "
					+"FROM (SELECT * FROM (SELECT * FROM POKEBOARD ORDER BY hit DESC )) "
					+"ORDER BY group_id DESC,group_step ASC";*/
			String sql="SELECT no,subject,name,id,Exp,hit "
			+" FROM nBoard WHERE group_step=0 ORDER BY hit DESC ";
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			int i=0;
			int j=0;
			int pagecnt=(page*10)-10;
			
			while(rs.next()){
				if(i<10 && j>=pagecnt){
					noticeVO vo=new noticeVO();
					vo.setNo(rs.getInt(1));
					vo.setSubject(rs.getString(2));
					vo.setName(rs.getString(3));
					vo.setId(rs.getString(4));
					vo.setExp(rs.getInt(5));
					vo.setHit(rs.getInt(6));
					list.add(vo);
					i++;
				}
				j++;
			}
			
		}catch(Exception ex){
			System.out.println("noticeMiniData()"+ex.getMessage());
		}finally{
			disConnection();
		}
		
		return list;
	}
}