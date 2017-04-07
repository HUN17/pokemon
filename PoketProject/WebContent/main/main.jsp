<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@	page import="com.sist.change.JspChange" %>
<%	
	request.setCharacterEncoding("EUC-KR");
	String mode=request.getParameter("mode");
	if(mode==null)
		mode="0";
	String jsp=JspChange.change(Integer.parseInt(mode));
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title> 
</head>
<body>      
	<center>
			<!-- top div -->
			<div class="main" style="width: 1920; height:150px;">
				<jsp:include page="header.jsp"></jsp:include>
			</div><!-- top div -->     
			<div class="main" style="width: 100%; height:1800px;">
				<jsp:include page="<%=jsp %>"></jsp:include>
			</div>
			
			<!-- bottom div -->
			<div class="main" style="width: 1920; height: 150px;">		
				<jsp:include page="bottom.jsp"></jsp:include>
			</div>		<!-- bottom div -->
	</center>
</body>
</html>