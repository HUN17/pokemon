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
<script type="text/javascript">
function postsend() {
	send.submit();
}
</script>
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
		<ul class="headerMenu">
			<li class="menu" id="notice"><a href="main.jsp?mode=1">공지사항</a></li>
			<li class="menu" id="book"><a href="main.jsp?mode=2">도감</a></li>
			<li class="menu" id="board"><a href="#">게시판</a>
				<div class="dropdown">
				<a href="main.jsp?mode=3">공략게시판</a>
				<a href="main.jsp?mode=4">질문게시판</a>
				<a href="main.jsp?mode=5">자유게시판</a>
				</div>	
			</li>
			
		<li class="menu" id="site"><a href="main.jsp?mode=6">제휴사이트</a></li>
		<li class="menu" id="mypage"><a href="#">마이페이지</a>
			<c:if test="${id !=null }">
			<div class="dropdown">
				<a href="main.jsp?mode=18">수정</a>
				<form name="send" action="../login_out/logout_ok.jsp" method="post">
				<!-- <a href="main.jsp?mode=4">로그아웃</a> -->
				<a style="color:black;" onclick="postsend();">로그아웃</a>
				</form>
				<a href="main.jsp?mode=19">포인트 교환</a>
			</div>
			</c:if>
			<c:if test="${id ==null }">
			<div class="dropdown">
				<a href="main.jsp?mode=7">로그인</a>
			</div>	
			</c:if>
			
		</li>
		</ul>
		</div>
</body>
</html>