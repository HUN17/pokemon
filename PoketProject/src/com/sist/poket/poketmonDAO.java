package com.sist.poket;

import java.sql.*;
import java.util.ArrayList;

public class poketmonDAO {

	private Connection conn;
	private PreparedStatement ps;
	private static poketmonDAO dao;
	private final String URL = "jdbc:oracle:thin:@211.238.142.235:1521:ORCL";

	public poketmonDAO(){
	      try{
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         
	      }catch(Exception ex){
	         System.out.println("poketmonDAO()"+ex.getMessage());
	      }
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

	public static poketmonDAO newInstance() {
		if (dao == null) {
			dao = new poketmonDAO();
		}
		return dao;
	}
	
	public ArrayList<poketmonVO> bookList() {
		ArrayList<poketmonVO> list = new ArrayList<>();
		try {
			getConnection();
			String sql = "SELECT * FROM p_table ORDER BY no ASC ";
	         
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				poketmonVO vo = new poketmonVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setType1(rs.getString(3));
				vo.setType2(rs.getString(4));
				vo.setRev1(rs.getString(5));
				vo.setRev2(rs.getString(6));
				vo.setRev3(rs.getString(7));
				vo.setRev4(rs.getString(8));
				vo.setRev5(rs.getString(9));
				vo.setRev6(rs.getString(10));
				vo.setS_type1(rs.getString(11));
				vo.setS_type2(rs.getString(12));
				vo.setL_type1(rs.getString(13));
				vo.setL_type2(rs.getString(14));
				vo.setCp(rs.getString(15));
				vo.setAtt(rs.getString(16));
				vo.setDef(rs.getString(17));
				vo.setHp(rs.getString(18));
				list.add(vo);	
			}
		} catch (Exception ex) {
			System.out.println("bookList()" + ex.getMessage());
		}finally {
			disConnection();
		}
		return list;
	}
	
	public ArrayList<poketmonVO> bookList(String name) {
		ArrayList<poketmonVO> list = new ArrayList<>();
		try {
			getConnection();
			String sql = "SELECT * FROM p_table WHERE name like '%" + name +"%' ORDER BY no ASC ";
         
	        ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				poketmonVO vo = new poketmonVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setRev1(rs.getString(3));
				vo.setRev2(rs.getString(4));
				vo.setRev3(rs.getString(5));
				vo.setType1(rs.getString(6));
				vo.setType2(rs.getString(7));
				vo.setS_type1(rs.getString(8));
				vo.setS_type2(rs.getString(9));
				vo.setL_type1(rs.getString(10));
				vo.setL_type2(rs.getString(11));
				list.add(vo);	
			}
		} catch (Exception ex) {
			System.out.println("bookList()" + ex.getMessage());
		}finally {
			disConnection();
		}
		return list;
	}
	
	public ArrayList<poketmonVO> bookList2(String type) {
		ArrayList<poketmonVO> list = new ArrayList<>();
		try {
			getConnection();
			String sql = "SELECT * FROM p_table WHERE type1 like '%" + type +"%' "
					+ "OR type2 like '%" + type +"%' "
					+ "ORDER BY no ASC ";
         
	        ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				poketmonVO vo = new poketmonVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setRev1(rs.getString(3));
				vo.setRev2(rs.getString(4));
				vo.setRev3(rs.getString(5));
				vo.setType1(rs.getString(6));
				vo.setType2(rs.getString(7));
				vo.setS_type1(rs.getString(8));
				vo.setS_type2(rs.getString(9));
				vo.setL_type1(rs.getString(10));
				vo.setL_type2(rs.getString(11));
				list.add(vo);	
			}
		} catch (Exception ex) {
			System.out.println("bookList()" + ex.getMessage());
		}finally {
			disConnection();
		}
		return list;
	}
	
	public ArrayList<poketmonVO> bookList(int no) {
		ArrayList<poketmonVO> list = new ArrayList<>();
		try {
			getConnection();
			String sql = "SELECT * FROM p_table WHERE no=" + no +" ORDER BY no ASC ";
			System.out.println(sql);
	        ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				poketmonVO vo = new poketmonVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setRev1(rs.getString(3));
				vo.setRev2(rs.getString(4));
				vo.setRev3(rs.getString(5));
				vo.setType1(rs.getString(6));
				vo.setType2(rs.getString(7));
				vo.setS_type1(rs.getString(8));
				vo.setS_type2(rs.getString(9));
				vo.setL_type1(rs.getString(10));
				vo.setL_type2(rs.getString(11));
				list.add(vo);	
			}
		} catch (Exception ex) {
			System.out.println("bookList()" + ex.getMessage());
		}finally {
			disConnection();
		}
		return list;
	}
	
	public poketmonVO detailData(int no) {
			poketmonVO vo = new poketmonVO();
		try {
			getConnection();
			String sql="SELECT no,name,rev1,rev2,rev3,type1,type2,s_type1,s_type2,l_type1,l_type2 FROM p_table WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setRev1(rs.getString(3));
			vo.setRev2(rs.getString(4));
			vo.setRev3(rs.getString(5));
			vo.setType1(rs.getString(6));
			vo.setType2(rs.getString(7));
			vo.setS_type1(rs.getString(8));
			vo.setS_type2(rs.getString(9));
			vo.setL_type1(rs.getString(10));
			vo.setL_type2(rs.getString(11));
			
			rs.close();
			
		} catch (Exception ex) {
			System.out.println("detailData()" + ex.getMessage());
		} finally {
			disConnection();
		}
		return vo;
	}
	
}
