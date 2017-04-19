<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.user.*"%>
    
<%
	request.setCharacterEncoding("EUC-KR");

	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String nickname=request.getParameter("nickname");
	String gender=request.getParameter("gender");
	String phone=request.getParameter("phone");
	String phone1=request.getParameter("phone1");
	String email=request.getParameter("email");
	String ban=request.getParameter("ban");
	String exp=request.getParameter("exp");
	if(exp == null)	exp = "1000";
	String point=request.getParameter("point");
	if(point == null)	point = "0";
	
	MemberVO vo=new MemberVO();
	vo.setId(id);
	vo.setPwd(pwd);
	vo.setNickname(nickname);
	vo.setGender(gender);
	vo.setPhone(phone);
	vo.setPhone1(phone1);
	vo.setEmail(email);
	vo.setBan(ban);
	vo.setExp(Integer.parseInt(exp));
	vo.setPoint(Integer.parseInt(point));
	
	//DB연동
	MemberDAO dao=MemberDAO.newInstance();
	dao.MemberInsert(vo);
	//페이지 이동
	response.sendRedirect("../main/main.jsp");
	
	//response.sendRedirect("../main/main.jsp?mode=5");
	/* response.sendRedirect("result_join.jsp"); */
	
%>