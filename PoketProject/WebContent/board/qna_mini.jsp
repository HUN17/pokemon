<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.board.*,java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	qnaVO vo = new qnaVO();
	qnaDAO dao = new qnaDAO();
	List<qnaVO> list = dao.qnaMiniData(1);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="<%=list %>"></c:set>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
<%-- "main.jsp?mode=9&no=<%=vo.getNo()%>" --%>
	function miniTr (test){
		location.href="main.jsp?mode=9&no="+test;
	};
</script>
</head>
<body>
	<div id="chatHeader" >
		<img class="chat_ball" alt="���Ϻ�" src="../chat/image/chat_subject.png">
		�����Խ���
		<img class="chat_ball" alt="���Ϻ�" src="../chat/image/chat_subject.png">
	</div>
	
	<table id="boardTable_mini" >
		<!-- <tr>
			<th width="20%" align="center">��ȣ</th>
			<th width="50%" align="center">����</th>
			<th width="30%" align="center">�г���</th>
			<th width="20%" align="center">��ȸ��</th>
		</tr> -->
		
		<c:forEach var="vo" items="${list }">
		
		<tr height="34" onclick="miniTr(${vo.no});">
			
			<td width="20%" align="center">
				<img alt="�α��" src="../image/board_image/mini_star.png" width="20">
			</td>
			
			<td width="50%" align="left">
			${vo.subject }
			</td>
			<td width="30%" align="center">${vo.name }</td>
			<%-- <td width="20%" align="center">${vo.hit }</td> --%>
			
		</tr>
		</c:forEach>
	</table>
</body>
</html>