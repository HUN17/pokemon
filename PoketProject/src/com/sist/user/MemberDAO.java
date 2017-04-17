package com.sist.user;

import java.util.*;

import com.sun.org.apache.regexp.internal.RE;

import java.sql.*;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps; // @211.238.142.235
	private final String URL = "jdbc:oracle:thin:@211.238.142.235:1521:ORCL";
	private static MemberDAO dao;

	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception ex) {
			System.out.println("MemberDAO()" + ex.getMessage());
		}
	}

	public static MemberDAO newInstance() {
		if (dao == null) {
			dao = new MemberDAO();
		}
		return dao;
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "scott", "tiger");
		} catch (Exception ex) {
			System.out.println("getConnection()" + ex.getMessage());
		}
	}
	
	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception ex) {
			System.out.println("disConnection()" + ex.getMessage());
		}
	}

	public int isLogin(String id, String pwd) {
		int result = 0;

		try {
			getConnection();
			String sql = "SELECT COUNT(*) FROM join_user " + "WHERE id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);

			if (count == 0) {
				result = 0;
			} else {
				sql = "SELECT pwd FROM join_user WHERE id=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();
				rs.next();
				String db_pwd = rs.getString(1);
				rs.close();

				if (db_pwd.equals(pwd)) {
					result = 2;
				} else {
					result = 1;
				}
			}
			rs.close();

		} catch (Exception ex) {
			System.out.println("isLogin()" + ex.getMessage());
		} finally {
			disConnection();
		}

		return result;
	}

	public String getLogData(String id) {
		String result = "";
		try {
			getConnection();
			String sql = "SELECT nickname FROM join_user WHERE id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			result = rs.getString(1);
			rs.close();

		} catch (Exception ex) {
			System.out.println("getLogData()" + ex.getMessage());
		} finally {
			disConnection();
		}
		return result;
	}

	public int idcheck(String id) {
		int count = 0;

		try {
			getConnection();
			String sql = "SELECT COUNT(*) FROM join_user " + "WHERE id=?";

			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();

		} catch (Exception ex) {
			System.out.println("idcheck" + ex.getMessage());
		} finally {
			disConnection();
		}
		return count;

	}

	public void MemberInsert(MemberVO vo) {
		try {
			getConnection();
			String sql = "INSERT INTO join_user VALUES(?,?,?,?,?,?,?,?,?,?,?)";

			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getNickname());
			ps.setString(4, vo.getGender());
			ps.setString(5, vo.getPhone());
			ps.setString(6, vo.getPhone1());
			ps.setString(7, vo.getEmail());
			ps.setString(8, vo.getEmail1());
			ps.setString(9, vo.getBan());
			ps.setInt(10, vo.getExp());
			ps.setInt(11, vo.getPoint());
			ps.executeUpdate();

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}

		/*
		 * public void updateMember(MemberVO member) throws
		 * SQLException{
		 * 
		 * Connection conn=null; PreparedStatement pstmt=null;
		 * 
		 * try{ StringBuffer query=new StringBuffer();
		 * 
		 * query.append("UPDATE JSP_MEMBER SET");
		 * query.append(" PASSWORD=?, MAIL=?, PHONE=?, ADDRESS=?");
		 * query.append(" WHERE ID=?");
		 * 
		 * conn=DBConnection.getConnee
		 * 
		 * }catch(Exception ex){
		 * 
		 * } }
		 */

	}
	
	public MemberVO getMember(String id) {
		MemberVO vo = new MemberVO();
		try {
			getConnection();
			String sql = "SELECT * FROM join_user WHERE id = ?";

			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			
			vo.setId(rs.getString(1));
			vo.setPwd(rs.getString(2));
			vo.setNickname(rs.getString(3));
			vo.setGender(rs.getString(4));
			vo.setPhone(rs.getString(5));
			vo.setPhone1(rs.getString(6));
			vo.setEmail(rs.getString(7));
			vo.setEmail1(rs.getString(8));
			vo.setBan(rs.getString(9));
			vo.setExp(rs.getInt(10));
			vo.setPoint(rs.getInt(11));
			rs.close();
			ps.close();
			

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		
		return vo;
	}
	
	public void updateMember(MemberVO vo) {
		getConnection();
		try{
//		String sql = "UPDATE JOIN_USER "
//				+ "SET PWD="+vo.getPwd()+","
//				+ "NICKNAME="+vo.getNickname()+","
//				+ "GENDER="+vo.getGender()+","
//				+ "PHONE="+vo.getPhone()+","
//				+ "PHONE1="+vo.getPhone1()+","
//				+ "EMAIL="+vo.getEmail()+","
//				+ "EMAIL1="+vo.getEmail1()+","
//				+ "WHERE id="+vo.getId();
//		ps=conn.prepareStatement(sql);
		
		String sql = "UPDATE JOIN_USER "
			+ "SET PWD=?,NICKNAME=?,GENDER=?,PHONE=?,PHONE1=?,EMAIL=?,EMAIL1=? "
			+ "WHERE id=?" ;
		
		System.out.println(sql);
		ps=conn.prepareStatement(sql);
	
		ps.setString(1, vo.getPwd());
		ps.setString(2, vo.getNickname());		
		ps.setString(3, vo.getGender());
		ps.setString(4, vo.getPhone());
		ps.setString(5, vo.getPhone1());
		ps.setString(6, vo.getEmail());
		ps.setString(7, vo.getEmail1());
		ps.setString(8, vo.getId());
		
		ps.executeUpdate();
		ps.close();
		
		
		} catch (Exception ex) {
			ex.printStackTrace();
//			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		
	}
	
	public void levUp(MemberVO vo, int point, int exp) {
		
		try {
			getConnection();
			System.out.println("test1");
			String sql = "UPDATE JOIN_USER SET point=?, exp=?"
					+ "WHERE id=?";
			System.out.println("test2");
			ps=conn.prepareStatement(sql);
			
			ps.setInt(1, vo.getPoint()+point);
			ps.setInt(2, vo.getExp()+exp);
			ps.setString(3, vo.getId());		

			ps.executeUpdate();
			ps.close();
			System.out.println("¼º°ø");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}

	}

}