<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.board.*"%>
<%
	String no = request.getParameter("no");
	noticeDAO dao = noticeDAO.newInstance();
	freeVO vo=dao.boardContent(Integer.parseInt(no), 1);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- BootStrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	var i=0;
	$(function(){
		$('#delBtn').click(function(){
			if(i==0){
				$('#del').show();
				i=1;
			}else{
				$('#del').hide();
				i=0;
			}
		});
	});
</script>

</head>
<body>
	<center>
	<div style="margin-top: 15px"></div>
		<img alt="Ŀ�´�Ƽ" src="../image/board_image/po.png" width="1000">
		<p>
		<table class="table table-bordered" style="width: 60%">
			<tr>
				<td width="20%" align="center" bgcolor="#f5f5f5">��ȣ</td>
				<td width="30%" align="center"><%=vo.getNo() %></td>
				<td width="20%" align="center" bgcolor="#f5f5f5">�ۼ���</td>
				<td width="30%" align="center"><%=vo.getRegdate().toString() %></td>
			</tr>	
			<tr>
				<td width="20%" align="center" bgcolor="#f5f5f5">�̸�</td>
				<td width="30%" align="center"><%=vo.getName() %></td>
				<td width="20%" align="center" bgcolor="#f5f5f5">��ȸ��</td>
				<td width="30%" align="center"><%=vo.getHit() %></td>
			</tr>
			<tr>
				<td width="20%" bgcolor="#f5f5f5" align="center">����</td>
				<td colspan="3"><%=vo.getSubject()%></td>
			</tr>
			<tr>
				<td colspan="4" align="left" valign="top" height="200">
					<%=vo.getContent() %>
				</td>
			</tr>					
		</table>
		
		<table class="table table-bordered" style="width: 60%">
			<tr>
				<td align="right">
					<a href="reply.jsp?no=<%=no%>">
						<!-- <img alt="��۾���" src="image/reply.gif" > -->
						<!--  <input type="button" value="��۾���"  class="btn btn-default"> -->
					</a>
					<a href="main.jsp?mode=15&no=<%=no%>">
						<input type="button" value="����" id="WriteBtn" class="btn btn-default">
					</a>
					<input type="button" value="����" id="delBtn" class="btn btn-default">
					<a href="main.jsp?mode=1">
						<input type="button" value="���" class="btn btn-default">
					</a>
				</td>
					
			</tr>
			
			<tr id="del" style="display: none;">
				<td align="right">
					<form action="../board/notice_delete_ok.jsp" method="post">
						��й�ȣ : <input type="password" size="10" name="pwd">
								<input type="hidden" name="no" value="<%=no%>">
						<input type="submit" value="����">
					</form>
				</td>
			</tr>
		</table>
		</center>
</body>
</html>