<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.board.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String content = request.getParameter("content");
	String name = request.getParameter("name");
	String no = request.getParameter("c_no");
	
	replyVO vo = new replyVO();
	vo.setContent(content);
	vo.setName(name);
	vo.setP_no(Integer.parseInt(no));
	replyDAO dao = replyDAO.newInstance();
	dao.reInsert(vo);
	
	System.out.println(vo.getContent());
	System.out.println(vo.getName());
	System.out.println(vo.getP_no());
	
	
%>