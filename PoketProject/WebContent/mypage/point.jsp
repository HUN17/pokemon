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
               <h1>포인트 교환</h1>
               <h5><%=name %>님의 포인트를 쿠폰으로 교환하실 수 있습니다.</h5>
     </div>
     <div style="width:1600px; height: 1000px">
     <div style="width: 400px; height: 300px; background-color: #BDBDBD;">
     	1%할인쿠폰	
     </div>
     <div style="width: 800px; height: 300px; background-color: #FFC19E;">
     	10000포인트로 교환하기	
     </div>
     </div>
</body>
</html>