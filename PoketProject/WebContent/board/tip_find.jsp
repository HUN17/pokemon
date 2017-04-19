<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.board.*, java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>       
<%
	request.setCharacterEncoding("EUC-KR");
	String fs=request.getParameter("fs");
	String ss=request.getParameter("ss");
	
	tipDAO dao=tipDAO.newInstance();
	List<tipVO> list=null;
	int count=dao.tboardFindCount(fs, ss);
			
	if(count!=0){
		 list=dao.tboardFindData(fs, ss);
	}
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
		<img alt="게시판 검색" src="../image/board_image/tpo.png" width="1000" height="40">
		<p>
		<table class="table" style="width: 70%" >
			<tr>
				<td align="right">
					검색한 내용 : <%=count %>개
				</td>
			</tr>
		</table>
				<table class="table table-hover" style="width: 70%" >
				<tr bgcolor="" height="27">
					<th width="10%">번호</th>
					<th width="45%">제목</th>
					<th width="15%">이름</th>
					<th width="20%">작성일</th>
					<th width="10%">조회수</th>
				</tr>
				<%
					int i=0;
					String color = "white";
					for(tipVO vo:list){
						if(i%2==0) color="white";
						else color = "ivory";
				%>
						<tr height="27" id="dataTr">
							<td width="10%" align="center"><%=vo.getNo() %></td>
							<td width="45%" align="left">
								<a href="content.jsp?no=<%=vo.getNo()%>"><%=vo.getSubject() %></a>
								<%
									SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
									String today = sdf.format(new Date());
									String dbday = vo.getRegdate().toString();
									//2017-03-10
									if(today.equals(dbday)){
								%>
										<sup><img alt="뉴" src="../image/board_image/ico_new.png"></sup>
								<%										
									}
								%>
							</td>
							<td width="15%" align="center"><%=vo.getName() %></td>
							<td width="20%" align="center"><%=vo.getRegdate().toString() %></td>
							<td width="10%" align="center"><%=vo.getHit()%></td>
						</tr>
				<%	
					i++;
					}
				%>
			</table>	
			<table border="0" width="600" id="abc">
				<tr>
					<td align="right">
						<a href="main.jsp?mode=3">목록</a>
					</td>
				</tr>
			</table>	
	</center>
</body>
</html>