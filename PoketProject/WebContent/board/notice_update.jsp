<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.board.*"%>
<%
	String no = request.getParameter("no");			
	noticeDAO dao = noticeDAO.newInstance();
	noticeVO vo = dao.boardUpdateData(Integer.parseInt(no));
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- BootStrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
<center>
	<div style="margin-top: 15px"></div>
		<img alt="�����ϱ�" src="../image/board_image/notice.png" width="1000" >
		<p>
		<form method="post" action="../board/qna_update_ok.jsp" name="frm">
			<table class="table" style="width: 60%">
				<tr>
					<td width="20%" align="right">�̸�</td>
					<td width="80%" align="left">
						<input type="hidden" name="no" value="<%=vo.getNo()%>">
						<input type="text" size="12" name="name" value="<%=vo.getName()%>" class="form-control" style="width: 30%">
					</td>
				</tr>
				<tr>
					<td width="20%" align="right">����</td>
					<td width="80%" align="left">
						<input type="text" name="subject" value="<%=vo.getSubject()%>" class="form-control" style="width: 40%">
					</td>
				</tr>
				<tr>
					<td width="20%" align="right">����</td>
					<td width="80%" align="left">
						<textarea rows="10" cols="60" name="content" class="form-control" style="width: 60%"><%=vo.getContent()%></textarea>
					</td>
				</tr>
				<tr>
					<td width="20%" align="right">��й�ȣ</td>
					<td width="80%" align="left">
						<input type="password" size="12" name="pwd" value="<%=vo.getPwd() %>" class="form-control" style="width: 30%">
					</td>
				</tr>
				
            	<tr>
            		<td colspan="2" align="center">
            		<a href="../main/main.jsp?mode=14&no=<%=no%>">
            			<input type="submit" value="����" class="btn btn-default">	
            		</a>
                    	<input type="button" value="���" onclick="javascript:history.back()" class="btn btn-default">	                   
                </td>
            	</tr>
			</table>
		</form>
	</center>
</body>
</html>