<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.user.*"%>
<%
	String id = (String)session.getAttribute("id");
	MemberDAO dao=MemberDAO.newInstance();  
	MemberVO vo = dao.getMember(id);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- BootStrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- <link rel="stylesheet" href="table.css" type="text/css"> -->

<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
<center>
	<div style="margin-top: 15px"></div>
		<img alt="글쓰기" src="../image/board_image/po.png" width="1000" >
		<p>
		<form method="post" action="../board/tip_insert_ok.jsp" name="frm">
			<table class="table" style="width: 60%">
				<tr>
					<td width="20%" align="right">이름</td>
					<td width="80%" align="left">
						<input type="hidden" name="exp" value="<%=vo.getExp() %>">
						<input type="text" name="name" class="form-control" style="width: 30%" readonly value="<%=vo.getNickname() %>">
					</td>
				</tr>
				<tr>
					<td width="20%" align="right">제목</td>
					<td width="80%" align="left">
						<input type="text" name="subject" class="form-control" style="width: 40%" placeholder="제목을 입력하세요">
					</td>
				</tr>
				<tr>
					<td width="20%" align="right">내용</td>
					<td width="80%" align="left">
						<textarea rows="10" cols="60" name="content" class="form-control" style="width: 60%" placeholder="내용을 입력하세요">
					
						</textarea>
					</td>
				</tr>
				<tr>
					<td width="20%" align="right">비밀번호</td>
					<td width="80%" align="left">
						<input type="password" size="12" name="pwd" class="form-control" style="width: 30%" placeholder="비밀번호를 입력하세요">
					</td>
				</tr>
				<tr>
            		<td colspan="2" align="center">
            			<input type="submit" value="글쓰기" class="btn btn-default">	
                    	<input type="button" value="취소" onclick="javascript:history.back()" class="btn btn-default">	             
                	</td>
            	</tr>
			</table>
		</form>
	</center>
</body>
</html>