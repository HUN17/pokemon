<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.board.*"%>

<%
	String no = request.getParameter("no");
	String pwd = request.getParameter("pwd");
	
	noticeDAO dao = noticeDAO.newInstance();
	boolean bCheck = dao.boardDelete(Integer.parseInt(no), pwd);
	
	if(bCheck==false){
%>
	<script>
		alert("��й�ȣ��Ʋ���ϴ�.\n�ٽ� �Է����ּ���");
		history.back();
	</script>
<%
	}else{
		response.sendRedirect("../main/main.jsp?mode=1");
	}
%>