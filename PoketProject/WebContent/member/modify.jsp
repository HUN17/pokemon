<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.sist.user.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	MemberDAO dao = MemberDAO.newInstance();
	MemberVO vo = dao.getMember(id);
%>

<html>
<head>
<title>���� �� Ż��</title>
<link rel="stylesheet" href="resource/mdb.css">
<link rel="stylesheet" href="resource/mdb.min.css">
<!-- ������ ������ cdn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script type="text/javascript">
	/* $(function(){
	 $('#update').click(function(){
	 var url = "../member/updateForm.jsp";
	 var set = "width=700,height=500";
	 window.open(url,'',set); 
	 });
	 });  */

	/* $(function(){
	 $('#update').click(function(){
	 var url = "../member/updateForm.jsp";
	 var set = "width=500,height=400";
	 window.open(url,'',set); 
	 }); */
</script>
</head>

<body>
	<div id="aliHeader">
		<h1>���� ������</h1>
		<h5><%=name%>���� �����Դϴ�.
		</h5>
	</div>
	
	<center>
		<form name="updateform" action="../member/updateForm_ok.jsp"
			method="post" onSubmit="return checkIt()" class="form-inline">
			<p>
			<table border="0" width="600" class="table table-bordered" style="width: 55%">
				<tr height="">
					<td colspan="4" bgcolor="#cfd8dc" style="font-weight: bold;">��������
						����</td>
				</tr>

				<tr>

					<td height="" width="25%" align="left">����� ID</td>
					<td colspan="3" width="75%"><input type="text"
						value="<%=vo.getId()%>" readonly name="id" class="form-control"
						style="width: 40%"></td>
				</tr>

				<tr>
					<td height="" width="25%">��й�ȣ</td>
					<td colspan="3" width="75%"><input type="password" name="pwd"
						size="15" maxlength="12" value="<%=vo.getPwd()%>"
						class="form-control" style="width: 40%"></input></td>
				</tr>

				<tr height="">
					<td colspan="4" bgcolor="#cfd8dc" style="font-weight: bold;">��������
						����</td>
				</tr>

				<tr>
					<td height="" width="25%">�г���</td>
					<td colspan="3" width="75%"><input type="text"
						value="<%=vo.getNickname()%>" name="nickname" class="form-control"
						style="width: 40%"></td>
				</tr>


				<tr>
					<td height="" width="25%">����</td>
					<td colspan="3" width="75%"><input type="text"
						value="<%=vo.getGender()%>" name="gender" class="form-control"
						style="width: 40%"></td>
				</tr>

				<tr>
					<td height="" width="25%">��ȭ��ȣ</td>
					<td colspan="3" width="75%"><input type="text" name="phone"
						value="<%=vo.getPhone()%>" maxlength="30" class="form-control"
						style="width: 20%"> <input type="text" name="phone1"
						value="<%=vo.getPhone1()%>" maxlength="30" class="form-control"
						style="width: 20%"></td>

				</tr>

				<tr>
					<td height="" width="25%">E-Mail</td>
					<td width="75%"><input type="text" name="email"
						value="<%=vo.getEmail()%>" maxlength="30" class="form-control"
						style="width: 50%">
						<button type="submit" class="btn btn-outline-info waves-effect" style="magin: 100px">����</button>
					</td>
				</tr>
			</table>
	</center>
</body>
</html>