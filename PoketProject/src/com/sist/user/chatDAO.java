package com.sist.user;

import java.util.*;
import java.sql.*;
import java.net.*;
import java.io.*;

public class chatDAO {
   
   private Connection conn;
   private PreparedStatement ps;
   private static chatDAO dao;
   private final String URL="jdbc:oracle:thin:@211.238.142.235:1521:ORCL";
   
   public chatDAO(){
      try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
         
      }catch(Exception ex){
         System.out.println("chatDAO()"+ex.getMessage());
      }
   }
   
   //연결
   public void getConnection(){
      try{
         conn=DriverManager.getConnection(URL,"scott","tiger");
         
      }catch(Exception ex){
         System.out.println("getConnection()"+ex.getMessage());
      }
   }
   
   //해제
   public void disConnection(){
      try{
         if(ps!=null) ps.close();
         if(conn!=null) conn.close();
         
      }catch(Exception ex){
         System.out.println("disConnection()"+ex.getMessage());
      }
   }
   
   //싱글턴
   public static chatDAO newInstance(){
      if(dao==null){
         dao= new chatDAO();
      }
      return dao;
   }
   
   //채팅

}