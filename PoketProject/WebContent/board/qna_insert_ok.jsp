<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.board.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String exp = request.getParameter("exp");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	qnaVO vo = new qnaVO();
	vo.setExp(Integer.parseInt(exp));
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
	qnaDAO dao = qnaDAO.newInstance();
	dao.qboardInsert(vo);
	response.sendRedirect("../main/main.jsp?mode=4");
%>