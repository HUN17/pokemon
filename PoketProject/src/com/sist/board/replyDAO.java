package com.sist.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class replyDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@211.238.142.235:1521:ORCL";
	private static replyDAO dao;
	
	public replyDAO(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	public static replyDAO newInstance(){
		if(dao==null)
			dao=new replyDAO();
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
	
	public List<replyVO> getList(int no){
		List<replyVO> list=new ArrayList<>();
		try{
			getConnection();
			String sql = "SELECT recontent.no, recontent.id, recontent.content, recontent.name, recontent.p_no "
					+ "FROM recontent, pokeBoard "
					+ "WHERE pokeBoard.no = ? AND recontent.p_no = ?";
//			String sql = "select no, content, name, p_no from recontent";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setInt(2, no);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				replyVO vo = new replyVO();
				vo.setNo(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setName(rs.getString(4));
				vo.setP_no(rs.getInt(5));
				list.add(vo);
			}       
			rs.close();
			ps.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			disConnection();
		}
		return list;
	}
	
	public void reInsert(replyVO vo) {
		try {
			getConnection();
			String sql = "INSERT INTO  recontent VALUES (seq_re.nextval, ?, ?, ?, sysdate, ?, ?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getContent());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getPwd());
			ps.setInt(5, vo.getP_no());
			
			ps.executeUpdate();
			ps.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally{
			disConnection();
		}
	}
	
	public replyVO findReply(int no) {
		replyVO vo = new replyVO();
		try {
			getConnection();
			String sql = "SELECT no,id,pwd FROM recontent WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			
			vo.setNo(rs.getInt(1));
			vo.setId(rs.getString(2));
			vo.setPwd(rs.getString(3));
			
			rs.close();
			ps.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally{
			disConnection();
		}
		return vo;
	}
	
	public void reDelete(int no) {
		try {
			getConnection();
			String sql = "DELETE FROM recontent WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			ps.executeUpdate();
			ps.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally{
			disConnection();
		}
	}
}
