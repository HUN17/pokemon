package com.sistautodb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PokemonDAO {

	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@211.238.142.235:1521:ORCL";
	//private static DataDAO dao;
	/**
	 * 쿼리문 템플릿
	  	try{
				getConnection();
				String sql = "INSERT QUERY";
				ps = conn.prepareStatement(sql);
				ps.setString(parameterIndex, x);
				ResultSet rs = ps.executeQuery();
				rs.next();
				//TODO
				ps.close();
		
			}catch(Exception ex){
				System.out.println(ex.getMessage());
				ex.printStackTrace();
			}finally{
				disConnection();
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
	 */
	public PokemonDAO(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
	}
	public void disConnection(){
		try{
			if(ps != null){
				ps.close();
			}
			if(conn != null){
				conn.close();
			}
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
	public void update(PokemonVO vo){
		try{
			getConnection();
			String sql = "INSERT INTO p_table"
					+ "(no, name, type1, type2, rev1, rev2, rev3, rev4, rev5, rev6, s_type1, s_type2, l_type1, l_type2, cp, att, def, hp, gps1, gps2) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
			
			//System.out.println("SQL: " + sql);
			ps = conn.prepareStatement(sql);
//no, name, rev1, rev2, rev3, type1, type2, s_type1, s_type2, l_type1, l_type2		
			ps.setString(1, vo.getNo());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getType1());
			ps.setString(4, vo.getType2());
			ps.setString(5, vo.getRev1());
			ps.setString(6, vo.getRev2());
			ps.setString(7, vo.getRev3());
			ps.setString(8, vo.getRev4());
			ps.setString(9, vo.getRev5());
			ps.setString(10, vo.getRev6());
			ps.setString(11, vo.getS_type1());
			ps.setString(12, vo.getS_type2());
			ps.setString(13, vo.getL_type1());
			ps.setString(14, vo.getL_type2());
			ps.setString(15, vo.getCp());
			ps.setString(16, vo.getAtt());
			ps.setString(17, vo.getDef());
			ps.setString(18, vo.getHp());
			ps.setString(19, vo.getGps1());
			ps.setString(20, vo.getGps2());
			
			ps.executeUpdate();
			//TODO
			ps.close();
	
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}finally{
			disConnection();
		}
	
	}
}
