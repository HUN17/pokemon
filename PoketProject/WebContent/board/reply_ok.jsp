<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.board.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String content = request.getParameter("content");
	String name = request.getParameter("name");
	String no = request.getParameter("c_no");
	String pwd = request.getParameter("c_pwd");
	String id = request.getParameter("c_id");
	
	replyVO vo = new replyVO();
	vo.setContent(content);
	vo.setName(name);  
	vo.setP_no(Integer.parseInt(no));
	vo.setPwd(pwd);
	vo.setId(id);
	replyDAO dao = replyDAO.newInstance();
	dao.reInsert(vo);

	response.sendRedirect("../main/main.jsp?mode=9&no="+no);
%>