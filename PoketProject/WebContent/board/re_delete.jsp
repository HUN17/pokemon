<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="com.sist.board.replyVO"%>
<%@page import="com.sist.board.replyDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<%	
		String pwd = request.getParameter("d_pwd"); 
	  	String id = request.getParameter("d_id");
	  	String no = request.getParameter("d_no");
	  	String cno = request.getParameter("content_no");
	  	
	  	System.out.println(id);
	  	
	  	replyDAO dao = replyDAO.newInstance();
	  	replyVO vo = dao.findReply(Integer.parseInt(no));
%>
<%
	  	if(pwd.equals(vo.getPwd())) {
		  		if(id.equals(vo.getId())) {
			  		dao.reDelete(vo.getNo());
					response.sendRedirect("../main/main.jsp?mode=9&no="+cno);
			  	} else {
%>
			  		<script type="text/javascript">
	  				alert("실패하였습니다. 게시자만 삭제 가능합니다.");
	  				history.back();
	  				</script>		
<%
		  	}
	  	} else {
%>
	  			<script type="text/javascript">
	  				alert("실패하였습니다. 비밀번호를 확인하세요.");
	  				history.back();
	  			</script>		
<% } %>


	  			

</head>