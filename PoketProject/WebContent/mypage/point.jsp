<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String name = (String)session.getAttribute("name");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
	<div id="aliHeader">
               <h1>����Ʈ ��ȯ</h1>
               <h5><%=name %>���� ����Ʈ�� �������� ��ȯ�Ͻ� �� �ֽ��ϴ�.</h5>
     </div>
     <div style="width:1600px; height: 1000px">
     <div style="width: 400px; height: 300px; background-color: #BDBDBD;">
     	1%��������	
     </div>
     <div style="width: 800px; height: 300px; background-color: #FFC19E;">
     	10000����Ʈ�� ��ȯ�ϱ�	
     </div>
     </div>
</body>
</html>