<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.board.*" import="com.sist.user.*,java.util.*"%>
<%
		String id = request.getParameter("id");
		String no = request.getParameter("no");
		String like = request.getParameter("like");
		freeDAO dao = freeDAO.newInstance();
		MemberDAO dao2 = MemberDAO.newInstance();
		dao.likeup(Integer.parseInt(no));
		MemberVO vo2 = dao2.getMember(id);
		dao2.levUp(vo2, 100,20);
%>