<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.user.*"%>

<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	System.out.println(id);
	String pwd=request.getParameter("pwd");
	String nickname=request.getParameter("nickname");
	String gender=request.getParameter("gender");
	System.out.print(gender);
	String phone=request.getParameter("phone");
	String phone1=request.getParameter("phone1");
	String email=request.getParameter("email");
	
	MemberVO vo=new MemberVO();
	vo.setId(id);
	vo.setPwd(pwd);
	vo.setNickname(nickname);
	vo.setGender(gender);
	vo.setPhone(phone);
	vo.setPhone1(phone1);
	vo.setEmail(email);
	
	MemberDAO dao=MemberDAO.newInstance();
	dao.updateMember(vo);
	
	response.sendRedirect("../main/main.jsp");
%>