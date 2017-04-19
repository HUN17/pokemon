<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../member/login.css">
<script type="text/javascript">
$(function(){
	$('#join').click(function(){
		var url = "../member/join.jsp";
		var set = "width=500,height=400";
		window.open(url,'',set); 
	});
});
</script>
<style type="text/css">
	input[type="submit"]{
		background-color: #FF3636;
		width:455px;
		height:50px;
		border: none;
		color: white;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		font-weight: bold;
		-webkit-transition-duration: 0.4s;
		transition-duration: 0.4s;
		cursor: pointer;
	}
	
	input[type="submit"]:HOVER {
		background-color: white;
		color: black;
		border: 2px solid #FF3636;
}
</style>
</head>
<body>
	<center>
		<img alt="포사모 로그인" src="../image/login_out_image/login_logo.png" width="450">
		<form action="../member/login_ok.jsp" method="post">
			<table id="table_login" width="500">
				<tr>
					<td width="450" height="100" align="center">
						<input class="box" type="text" name="id" placeholder="아이디" style="width:450px; height:50px;">
					</td>
				</tr>
				<tr>
					<td width="450" height="40" align="center">
						<input class="box" type="password" name="pwd" placeholder="패스워드" style="width:450px; height:50px;">
					</td>
				</tr>
				<tr>
					<td align="center" height="100">
						<input type="submit" value="로그인">
					</td>
				</tr>
				<tr>
					<td id="join" align="right">
							회원가입
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>


