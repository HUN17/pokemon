<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.board.*"%>
<%
	String no = request.getParameter("no");
	String pwd = request.getParameter("pwd");
	
	qnaDAO dao = qnaDAO.newInstance();
	boolean bCheck = dao.qboardDelete(Integer.parseInt(no), pwd);
	
	if(bCheck==false){
%>
	<script>
		alert("��й�ȣ��Ʋ���ϴ�.\n�ٽ� �Է����ּ���");
		history.back();
	</script>
<%
	}else{
		response.sendRedirect("../main/main.jsp?mode=4");
	}
%>