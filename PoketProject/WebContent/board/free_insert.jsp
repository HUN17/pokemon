<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- BootStrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- <link rel="stylesheet" href="table.css" type="text/css"> -->

<!-- SmartEditor�� ����ϱ� ���ؼ� ���� js������ �߰� (��� Ȯ��) -->
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

</head>
<body>
	<center>
	<div style="margin-top: 15px"></div>
		<img alt="�۾���" src="../image/board_image/po.png" width="1000" >
		<p>
		<form method="post" action="../board/free_insert_ok.jsp" name="frm">
			<table class="table" style="width: 60%">
				<tr>
					<td width="20%" align="right">�̸�</td>
					<td width="80%" align="left">
						<input type="text" name="name" class="form-control" style="width: 30%" placeholder="�̸��� �Է��ϼ���">
					</td>
				</tr>
				<tr>
					<td width="20%" align="right">����</td>
					<td width="80%" align="left">
						<input type="text" name="subject" class="form-control" style="width: 40%" placeholder="������ �Է��ϼ���">
					</td>
				</tr>
				<tr>
					<td width="20%" align="right">����</td>
					<td width="80%" align="left">
						<!-- <textarea rows="10" cols="60" name="content" class="form-control" style="width: 60%" placeholder="������ �Է��ϼ���"> -->
						<textarea name="content" id="ir1" rows="15" cols="40" style="width: 600px;" placeholder="������ �Է��ϼ���" ></textarea>
						<script type="text/javascript">
								var oEditors = [];
								nhn.husky.EZCreator.createInIFrame({
								    oAppRef: oEditors,
								    elPlaceHolder: "ir1",
								    sSkinURI: "../se2/SmartEditor2Skin.html",
								    fCreator: "createSEditor2"
								});
						</script> 
						<!-- </textarea> -->
					</td>
				</tr>
				<tr>
					<td width="20%" align="right">��й�ȣ</td>
					<td width="80%" align="left">
						<input type="password" size="12" name="pwd" class="form-control" style="width: 30%" placeholder="��й�ȣ�� �Է��ϼ���">
					</td>
				</tr>
				<tr>
            		<td colspan="2" align="center">
            			<input type="submit" value="�۾���" class="btn btn-default">	
                    	<input type="button" value="���" onclick="javascript:history.back()" class="btn btn-default">	             
                	</td>
            	</tr>
			</table>
		</form>
	</center>
</body>
</html>