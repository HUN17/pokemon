<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- <script type="text/javascript">
	$(function(){
		$('#notice').click(function(){
			location.href="main.jsp?mode=1";
		});
		$('#book').click(function(){
			location.href="main.jsp?mode=2";
		});
		$('#board').click(function(){
			location.href="main.jsp?mode=5";
		});
		$('#site').click(function(){
			location.href="main.jsp?mode=6";
		});
		$('#mypage').click(function(){
			location.href="main.jsp?mode=7";
		});
	});
</script> -->
<!-- <script type="text/javascript">
	$(function(){
		$(window).scroll(function(){
			if($(this).scrollTop() > 187){
				$("#nav").css({position:"fixed",top:"0px"});
			}else{
				$("#nav").css({position:"relative",top:"187px"});
			}
		});
	});
</script> -->
</head>
<body>
	<%-- <center>
		<div style=" width:1920; height: 150px; background-image: url('../image/main_image/main_top3.png');">
			<table border="0">
				<tr>
					<td width="400" height="100">
						<a href="main.jsp">
							<img src="../image/main_image/main_logo.png" width="65%">
						</a>
					</td>
					<td width="110" height="100"></td>
					<td width="110" height="100"></td>
					<td width="600" height="100" align="center" valign="bottom">
						<table border="0" width="600" height="100">
							<tr>
								<td align="center" valign="middle">
									<span id="notice">공지사항</span>
									<span id="book">도감</span>
									<span id="free">게시판</span>
									<span id="site">제휴사이트</span>
									<span id="mypage">마이페이지</span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</center> --%>
	<div id="nav">	
		<a href="main.jsp">
			<img src="../image/main_image/main_logo.png" width="250px">
		</a>
<!-- 		<div class="menu" id="notice">공지사항</div>
		<div class="menu" id="book">도감</div>
		<div class="menu" id="board">게시판</div>
			<div class="dropdown">
				<a href="#">공략게시판</a>
				<a href="#">질문게시판</a>
				<a href="#">자유게시판</a>
			</div>
		<div class="menu" id="site">제휴사이트</div>
		<div class="menu" id="mypage">마이페이지</div> -->
		<ul class="headerMenu">
			<li class="menu" id="notice"><a href="main.jsp?mode=1">공지사항</a></li>
			<li class="menu" id="book"><a href="main.jsp?mode=2">도감</a></li>
			<li class="menu" id="board"><a href="#">게시판</a>
				<div class="dropdown">
				<a href="main.jsp?mode=5">공략게시판</a>
				<a href="main.jsp?mode=5">질문게시판</a>
				<a href="main.jsp?mode=5">자유게시판</a>
				</div>	
			</li>
			
		<li class="menu" id="site"><a href="main.jsp?mode=6">제휴사이트</a></li>
		<li class="menu" id="mypage"><a href="main.jsp?mode=7">마이페이지</a></li>
		</ul>
		</div>
</body>
</html>