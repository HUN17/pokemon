<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.board.*"%>

<%
	String no = request.getParameter("no");
	String pwd = request.getParameter("pwd");
	
	freeDAO dao = freeDAO.newInstance();
	boolean bCheck = dao.boardDelete(Integer.parseInt(no), pwd);
	
	if(bCheck==false){
%>
	<script>
		alert("비밀번호가틀립니다.\n다시 입력해주세요");
		history.back();
	</script>
<%
	}else{
		response.sendRedirect("../main/main.jsp?mode=1");
	}
%>