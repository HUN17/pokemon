<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.board.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String exp = request.getParameter("exp");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	noticeVO vo = new noticeVO();
	vo.setExp(Integer.parseInt(exp));
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
	noticeDAO dao = noticeDAO.newInstance();
	dao.boardInsert(vo);
	response.sendRedirect("../main/main.jsp?mode=1");
%>