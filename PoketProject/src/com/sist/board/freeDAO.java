package com.sist.board;
import java.sql.*;
import java.util.*;

public class freeDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@211.238.142.229:1521:ORCL";
	private static freeDAO dao;
	
	//드라이버 등록
	public freeDAO(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	//싱글턴
	public static freeDAO newInstance(){
		if(dao==null)
			dao=new freeDAO();
		return dao;
	}
	
	
	//오라클 해제
	public void disConnection(){
		try{
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	//오라클 연결
	public void getConnection(){
		try{
			conn=DriverManager.getConnection(URL, "scott", "tiger");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	//리스트
	public List<freeVO> boardListData(int page){
		ArrayList<freeVO> list=new ArrayList<>();
		
		try{
			getConnection();
			String sql="SELECT no,subject,name,regdate,hit,group_tab "
					+"FROM pokeBoard "
					+"ORDER BY group_id DESC,group_step ASC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			int i=0;
			int j=0;
			int pagecnt=(page*15)-15;
			/*
			 * 		13 	=> 0~9,		10~12
			 * 		1page		2page 		3page
			 * 		  0			  10		  20		
			 * 		  9			  19		  29
			 */
			while(rs.next()){
				if(i<15 && j>=pagecnt){
					freeVO vo=new freeVO();
					vo.setNo(rs.getInt(1));
					vo.setSubject(rs.getString(2));
					vo.setName(rs.getString(3));
					vo.setRegdate(rs.getDate(4));
					vo.setHit(rs.getInt(5));
					vo.setGroup_tab(rs.getInt(6));
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
			String sql="SELECT CEIL(COUNT(*)/15) FROM pokeBoard";
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
	
	//전체 게시글 갯수
	public int boardRowCount(){
		int total=0;
		try{
			getConnection();
			String sql="SELECT COUNT(*) FROM pokeBoard";
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
					+"FROM pokeBoard "
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
	
	public List<freeVO> boardFindData(String fs, String ss){
		List<freeVO> list=new ArrayList<>();
		
		try{
			getConnection();
			String sql="SELECT no,subject,name,regdate,hit,group_tab "
					+"FROM pokeBoard "
					+"WHERE "+fs+" LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, ss);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){
				freeVO vo=new freeVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setRegdate(rs.getDate(4));
				vo.setHit(rs.getInt(5));
				vo.setGroup_tab(rs.getInt(6));
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
	
	//내용보기
	public freeVO boardContent(int no,int type){
		freeVO vo=new freeVO();
		
		try{
			getConnection();
			String sql="";
			if(type==1){
				sql="UPDATE pokeBoard SET "
						+"hit=hit+1 "
						+"WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
				ps.close();
			}
			
			sql="SELECT no,name,subject,content,regdate,hit "
					+"FROM pokeBoard "
					+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setRegdate(rs.getDate(5));
			vo.setHit(rs.getInt(6));
			rs.close();		
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}finally{
			disConnection();
		}
			
		return vo;
	}
	//SEQUENCE INSERT,UPDATE,SELECT
	public void boardReply(int pno,freeVO vo){
		try{
			getConnection();
			String sql="SELECT group_id,group_step,group_tab "
					+"FROM pokeBoard "
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
			//답변의 핵심쿼리
			sql="UPDATE pokeBoard SET "
					+"group_step=group_step+1 "
					+"WHERE group_id=? AND group_step>?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gi);
			ps.setInt(2, gs);
			ps.executeUpdate();
			ps.close();
			
			//추가
			sql="INSERT INTO pokeBoard(no,name,subject,content,pwd,group_id,group_step,group_tab,root) "
					+"VALUES(seq_pb_no.nextval,?,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.setInt(5, gi);
			ps.setInt(6, gs+1);
			ps.setInt(7, gt+1);
			ps.setInt(8, pno);
			ps.executeUpdate();
			ps.close();
			//depth=depth+1
			sql="UPDATE pokeBoard SET "
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
	
	public void boardInsert(freeVO vo){
		try{
			getConnection();
			String sql="INSERT INTO pokeBoard(no,name,subject,content,pwd,group_id) "
					+"VALUES(seq_pb_no.nextval,?,?,?,?,"
					+"(SELECT NVL(MAX(group_id)+1,1) FROM pokeBoard))";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());	
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			
			ps.executeUpdate();
			
		}catch(Exception ex){
			System.out.println("boardInsert():"+ex.getMessage());
		}finally{
			disConnection();
		}
	}
	
	//수정-게시글 내용을 불러오기
	public boolean boardUpdate(freeVO vo){
		boolean bCheck = false;
		
		try {
			getConnection();
			//패스워드 불러오기
			String sql= "SELECT pwd FROM pokeBoard "
					+"WHERE no=?";
			ps =conn.prepareStatement(sql);
			ps.setInt(1,vo.getNo());			//선택되어진 게시글의 no
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd = rs.getString(1);	//게시한 사람만 수정가능 
			rs.close();
			ps.close();
			
			//수정 쿼리문
			if(db_pwd.equals(vo.getPwd())){
				bCheck = true;
				sql ="UPDATE pokeBoard SET "
						+"name=?, "
						+"subject=?,content=? "
						+"WHERE no=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getSubject());
				ps.setString(3, vo.getContent());
				ps.setInt(4, vo.getNo());
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
			
	//수정하기-게시글 내용 불러오기
	public freeVO boardUpdateData(int no){
		freeVO vo = new freeVO();
		try {
			getConnection();
			String sql ="SELECT * "
					+"FROM pokeBoard "
					+"WHERE no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setPwd(rs.getString(5));
			vo.setRegdate(rs.getDate(6));
			vo.setHit(rs.getInt(7));			
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
			//패스워드 불러오기
			String sql ="SELECT pwd FROM pokeBoard "
					+"WHERE no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd = rs.getString(1);
			rs.close();
			ps.close();
			
			//select만 excuteQuery 나머지 excuteUpdate
			if(db_pwd.equals(pwd)){
				bCheck = true;
				sql = "DELETE FROM pokeBoard "
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
}


