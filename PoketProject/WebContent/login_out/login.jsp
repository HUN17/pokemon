<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">

	#join{
		text-decoration: none;
		color: gray;
	}
	#join:Hover{
		text-decoration: underline;
	}
	
	input{
		font-size: 20px;
	}
	
	.loginBtn{
		background-color: #FF3636;
		border: none;
		color: white;
		padding: 10px 20px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		-webkit-transition-duration: 0.4s;
		transition-duration: 0.4s;
		cursor: pointer;
	}
	
	.loginBtn:HOVER {
		background-color: white;
		color: black;
		border: 2px solid #FF3636;
}
</style>
</head>
<body>
	<center>
		<img alt="����� �α���" src="../image/login_out_image/login_logo.png" width="450">
		<form action="login_ok.jsp" method="post">
			<table id="table_login" width="500">
				<tr>
					<td width="450" height="100" align="center">
						<input type="text" name="id" placeholder="���̵�" style="width:450px; height:50px;">
					</td>
				</tr>
				<tr>
					<td width="450" height="40" align="center">
						<input type="password" name="pwd" placeholder="�н�����" style="width:450px; height:50px;">
					</td>
				</tr>
				<tr>
					<td align="center" height="100">
						<input id="loginBtn" type="submit" value="�α���">
					</td>
				</tr>
				<tr>
					<td align="right">
						<a href="../join/join.jsp">
							ȸ������
						</a>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>


