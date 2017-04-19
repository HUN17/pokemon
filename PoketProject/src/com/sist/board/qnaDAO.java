package com.sist.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class qnaDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@211.238.142.235:1521:ORCL";
	private static qnaDAO dao;
	
	public qnaDAO(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static qnaDAO newInstance(){
		if(dao==null)
			dao=new qnaDAO();
		return dao;
	}
	
	public void getConnection(){
		try{
			conn=DriverManager.getConnection(URL, "scott", "tiger");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	public void disConnection(){
		try{
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	public List<qnaVO> qboardListData(int page){
		ArrayList<qnaVO> list = new ArrayList<>();
		try {
			getConnection();
			String sql="SELECT no,subject,name,Exp,regdate,hit,group_tab "
					+"FROM qnaBoard "
					+"ORDER BY group_id DESC,group_step ASC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			int i=0;
			int j=0;
			int pagecnt=(page*10)-10;
			while(rs.next()){
				if(i<10 && j>=pagecnt){
					qnaVO vo=new qnaVO();
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
		} catch (Exception e) {
			System.out.println("qboardListData():"+e.getMessage());
		} finally {
			disConnection();
		}
		return list;
	}
	
	public int qboardTotalpage(){
		int total=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/10) FROM qnaBoard";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();	
		} catch (Exception e) {
			System.out.println("qboardTotalpage():"+e.getMessage());
		} finally {
			disConnection();
		}
		return total;
	}
	
	public int qboardRowCount(){
		int total=0;
		try {
			getConnection();
			String sql="SELECT COUNT(*) FROM qnaBoard";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();	
		} catch (Exception e) {
			System.out.println("qboardRowCount():"+e.getMessage());
		} finally {
			disConnection();
		}
		return total;
	}
	
	public int qboardFindCount(String fs,String ss){
		int count=0;
		try {
			getConnection();
			String sql ="SELECT COUNT(*) "
					+"FROM qnaBoard "
					+"WHERE "+fs+" LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, ss);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			System.out.println("qboardFindCount():"+e.getMessage());
		} finally {
			disConnection();
		}
		return count;
	}
	
	public List<qnaVO> qboardFindData(String fs,String ss){
		List<qnaVO> list=new ArrayList<>();
		try {
			getConnection();
			String sql="SELECT no,subject,name,Exp,regdate,hit,group_tab "
					+"FROM qnaBoard "
					+"WHERE "+fs+" LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, ss);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				qnaVO vo=new qnaVO();
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
		} catch (Exception e) {
			System.out.println("qboardFindData():"+e.getMessage());
		}
		return list;
	}
	
	public qnaVO qboardContent(int no,int type){
		qnaVO vo = new qnaVO();
		try{
			getConnection();
			String sql="";
			if(type==1){
				sql="UPDATE qnaBoard SET "
						+"hit=hit+1 "
						+"WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
				ps.close();
			}
			
			sql="SELECT no,name,id,Exp,subject,content,regdate,hit "
					+"FROM qnaBoard "
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
	
	public void qboardReply(int pno,qnaVO vo){
		try{
			getConnection();
			String sql="SELECT group_id,group_step,group_tab "
					+"FROM qnaBoard "
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

			sql="UPDATE qnaBoard SET "
					+"group_step=group_step+1 "
					+"WHERE group_id=? AND group_step>?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gi);
			ps.setInt(2, gs);
			ps.executeUpdate();
			ps.close();
			

			sql="INSERT INTO qnaBoard(no,name,id,Exp,subject,content,pwd,group_id,group_step,group_tab,root) "
					+"VALUES(q_board_no.nextval,?,?,?,?,?,?,?,?,?)";
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
			sql="UPDATE qnaBoard SET "
					+"depth=depth+1 "
					+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ps.executeUpdate();
			
		}catch(Exception ex){
			System.out.println("qboardReply():"+ex.getMessage());
		}finally{
			disConnection();
		}
	}
	
	public void qboardInsert(qnaVO vo){
		try{
			getConnection();
			String sql="INSERT INTO qnaBoard(no,name,id,Exp,subject,content,pwd,group_id) "
					+"VALUES(q_board_no.nextval,?,?,?,?,?,?,"
					+"(SELECT NVL(MAX(group_id)+1,1) FROM qnaBoard))";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getId());
			ps.setInt(3, vo.getExp());
			ps.setString(4, vo.getSubject());
			ps.setString(5, vo.getContent());
			ps.setString(6, vo.getPwd());
			
			ps.executeUpdate();
			
		}catch(Exception ex){
			System.out.println("qboardInsert():"+ex.getMessage());
		}finally{
			disConnection();
		}
	}
	
	public boolean qboardUpdate(qnaVO vo){
		boolean bCheck = false;
		
		try {
			getConnection();

			String sql= "SELECT pwd FROM qnaBoard "
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
				sql ="UPDATE qnaBoard SET "
						+"name=?, id=?, exp=?, "					
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
			System.out.println("boardUpdate():"+e.getMessage());
			System.out.println(vo.getName());
			System.out.println(vo.getSubject());
			System.out.println(vo.getContent());
			
			//e.printStackTrace();
		} finally {
			disConnection();
		}
		return bCheck;
	}
	
	
	public qnaVO qboardUpdateData(int no){
		qnaVO vo = new qnaVO();
		try {
			getConnection();
			String sql ="SELECT * "
					+"FROM qnaBoard "
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
			System.out.println("qboardUpdateData()"+e.getMessage());
		} finally {
			disConnection();
		}
		return vo;
	}
	
	public boolean qboardDelete(int no,String pwd){
		boolean bCheck = false;
		
		try {
			getConnection();
			String sql ="SELECT pwd FROM qnaBoard "
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
				sql = "DELETE FROM qnaBoard "
						+"WHERE no=?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
			} else {
				bCheck = false;
			}
			
		} catch (Exception e) {
			System.out.println("qboardDelete():"+e.getMessage());
		} finally {
			disConnection();
		}
		return bCheck;
	}
	
	public List<qnaVO> qnaMiniData(int page){
		ArrayList<qnaVO> list  = new ArrayList<>();
		
		try{
			getConnection();
			/*String sql="SELECT no,subject,name,hit "
					+"FROM (SELECT * FROM (SELECT * FROM POKEBOARD ORDER BY hit DESC )) "
					+"ORDER BY group_id DESC,group_step ASC";*/
			String sql="SELECT no,subject,name,id,Exp,hit "
			+" FROM qnaBoard WHERE group_step=0 ORDER BY hit DESC ";
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			int i=0;
			int j=0;
			int pagecnt=(page*10)-10;
			
			while(rs.next()){
				if(i<10 && j>=pagecnt){
					qnaVO vo=new qnaVO();
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
			System.out.println("qnaMiniData()"+ex.getMessage());
		}finally{
			disConnection();
		}
		
		return list;
	}
	
	public List<qnaVO> likeBoard () {
		List<qnaVO> list = new ArrayList<>();
		try{
			getConnection();
			String sql="SELECT no,subject,name,exp,regdate,hit,exp FROM qnaBoard ORDER BY b_like DESC, no ASC";
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			rs.next();
			for(int i = 0; i < 5; i++) {
				qnaVO vo=new qnaVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setExp(rs.getInt(4));
				vo.setRegdate(rs.getDate(5));
				vo.setHit(rs.getInt(6));
				vo.setExp(rs.getInt(7));
				list.add(vo);
				rs.next();
			}
			rs.close();

			
		}catch(Exception ex){
			System.out.println("freeMiniData()"+ex.getMessage());
		}finally{
			disConnection();
		}
		
		return list;
		
	}
	
}
