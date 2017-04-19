<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.sist.user.*" %>
<%@ page import="email.*" %>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	String email = (String)session.getAttribute("email");
	String point = request.getParameter("ppoint");
	System.out.println(point.length());
	//point = point.substring(0,point.lastIndexOf('p'));
	int ppoint = Integer.parseInt(point);
	
	System.out.println(id);
	System.out.println(ppoint);
	
	MemberVO pvo = new MemberVO();
	MemberDAO dao = new MemberDAO();
	pvo = dao.minusPoint(ppoint, id);
	
	pvo = dao.getMember(id);
	
	System.out.println(pvo.getPoint());
	
	//이메일 호출
	JavaMailAPI post = new JavaMailAPI((String)session.getAttribute("email"));
	
	response.sendRedirect("../main/main.jsp?mode=19");
%>