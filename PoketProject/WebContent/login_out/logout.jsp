<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<form action="../login_out/logout_ok.jsp" method="post">
			<table id="logout_table" width="200">
				<tr>
					<td align="right"><%=session.getAttribute("name")%>님</td>
				</tr>
				<tr>
					<td align="right">
					<a href="../join/JoinPro.jsp">
						<input type="button" value="회원 정보 수정">
					</a>
					</td>
					<td align="right">
						<input type="submit" value="로그아웃">
					</td >
				</tr>
			</table>
		</form>
</body>
</html>