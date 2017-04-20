<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@	page import="com.sist.change.JspChange" %>
<%	
	request.setCharacterEncoding("EUC-KR");
	String mode=request.getParameter("mode");
	System.out.println(mode);
	
	if(mode==null)
		mode="0";
	String jsp=JspChange.change(Integer.parseInt(mode));
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="main.css">
<link rel="stylesheet" type="text/css" href="../alliance/ali.css">
<link rel="stylesheet" type="text/css" href="../chat/chat.css">
<link rel="stylesheet" type="text/css" href="../slide/slide.css">
<link rel="stylesheet" type="text/css" href="../book/book.css">
<link rel="stylesheet" type="text/css" href="../mypage/point.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resource/owl.carousel.min.css">
<link rel="stylesheet" href="resource/owl.theme.default.min.css">
<link rel="stylesheet" type="text/css" href="custom.css">
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
	<script type="text/javascript">
	
	</script>
</body>
</html>