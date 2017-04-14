<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="com.sist.poket.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("EUC-KR");
	poketmonDAO dao = poketmonDAO.newInstance();
	String text = request.getParameter("text");
	String select = request.getParameter("select");
	ArrayList<poketmonVO> list = null;
 	if(text == null) {
		list = dao.bookList();
	} else { 
		if(select.equals("name"))
			list = dao.bookList(text);
		else if(select.equals("no"))
			list = dao.bookList(Integer.parseInt(text));
		else if(select.equals("type")) {
			switch(text) {
			case "Ǯ":
				list = dao.bookList2("grass");
				break;
			case "����":
				list = dao.bookList2("bug");
				break;
			case "��":
				list = dao.bookList2("evil");
				break;
			case "�巡��":
				list = dao.bookList2("dragon");
				break;
			case "����":
				list = dao.bookList2("electric");
				break;
			case "��":
				list = dao.bookList2("fairy");
				break;
			case "����":
				list = dao.bookList2("fight");
				break;
			case "�Ҳ�":
				list = dao.bookList2("fire");
				break;
			case "����":
				list = dao.bookList2("frying");
				break;
			case "��Ʈ":
				list = dao.bookList2("ghost");
				break;
			case "��":
				list = dao.bookList2("ground");
				break;
			case "����":
				list = dao.bookList2("ice");
				break;
			case "�븻":
				list = dao.bookList2("normal");
				break;
			case "��":
				list = dao.bookList2("poison");
				break;
			case "������":
				list = dao.bookList2("psycho");
				break;
			case "����":
				list = dao.bookList2("rock");
				break;
			case "��ö":
				list = dao.bookList2("steel");
				break;
			case "��":
				list = dao.bookList2("water");
				break;
			}
		}
	}
	poketmonVO vo = new poketmonVO();
	int curpage = 1, totalpage = 6;
%>
<c:set var="vo" value="<%=list %>"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<script type="text/javascript">
	    function open_pop2(detail){
	        var url = '../book/detailBook1.jsp?detail='+detail;
	        var set = "width=1000,height=650";
	        window.open(url,'popupView',set); 
	    }
</script>
</head>
 <body>
		<%-- <center>
			 <div class="bookLogowrap">
				<form name="logo" action="../main/main.jsp?mode=2" method="post">
				<div class="bookLogo">
					<table width="500" height="100">
						<tr>
 							<td align="center" valign="middle">
								<input type="image" src="../image/book_image/book_logo.png">
							</td> 
						</tr>
					</table>
				</div>
				</form>
				<form name="select" action="../main/main.jsp?mode=2" method="post">
					<div class="bookSearch">
						<table width="780" height="100">
							<tr>
								<td width="30%"></td>
								<td width="50%" align="right" valign="bottom" style="padding: 15px">
									<select name="select" class="form-control"  style="width:100px; float: left">
									<option value="name">�̸�</option>
									<option value="no">��ȣ</option>
									<option value="type">�Ӽ�</option>
								</select>&nbsp;
									<input type="text" class="form-control" size="12" name="text" style="width:100px; float: left">&nbsp;
									<input type="submit" class="btn btn-primary" value="�˻�" style="width:100px; float: left">
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
			
			<div class="bookListWrap">
				<c:set var="list" value="<%=list %>"></c:set>
				<script type="text/javascript">
					<%
						if(list.size() <= 0) {
					%>
						alert("�˻� ����� �����ϴ�");
					<% } %>
				</script>
				<c:set var="num" value="0"></c:set>
	
				<div class="bookList">
					<ul style="padding: 2px;  margin: 20 auto;">
						<li style="list-style: none;">
							<c:forEach var="vo" items="${list}" >
							<div style="width: 150px; height: 150px; float: left; margin: 3px;" onclick="open_pop2(${vo.no})">
								<div>
									<img src="../image/poket_image/${vo.no }.png">
								</div>
								<div>
									<h4 style="padding: 0px; margin: 0px; font-size: 15px;">No.${vo.no }&nbsp; ${vo.name }</h4>
								</div>
							</div>
							<c:set var="num" value="${num+1 }"></c:set>
							<c:if test="${num%6==0 }">
							<li style="list-style: none;">
							</li>
							</c:if>
							</c:forEach>
						</li>
					</ul>
				</div>
			</div>
		</center> --%>
		<!--  -->
		<div class="bookLogowrap">
			<form name="logo" action="../main/main.jsp?mode=2" method="post">
				<div class="bookLogo">
								<input type="image" src="../image/book_image/book_logo.png">
				</div>
			</form>
			<form name="select" action="../main/main.jsp?mode=2" method="post">
					<div class="bookSearch">
						<div id="bookBtn">
									<select name="select" class="form-control"  style="width:100px; float: left">
									<option value="name">�̸�</option>
									<option value="no">��ȣ</option>
									<option value="type">�Ӽ�</option>
								</select>&nbsp;
									<input type="text" class="form-control" size="12" name="text" style="width:100px; float: left">&nbsp;
									<input type="submit" class="btn btn-primary" value="�˻�" style="width:100px; float: left">
						</div>
					</div>
				</form>
		</div>
		
		<div class="bookListWrap">
				<c:set var="list" value="<%=list %>"></c:set>
				<script type="text/javascript">
					<%
						if(list.size() <= 0) {
					%>
						alert("�˻� ����� �����ϴ�");
					<% } %>
				</script>
				<c:set var="num" value="0"></c:set>
	
				<div class="bookList">
					<ul style="padding: 2px;  margin: 20 auto;">
						<li style="list-style: none;">
							<c:forEach var="vo" items="${list}" >
							<div class="bookImg" onclick="open_pop2(${vo.no})">
								<div>
									<img class="bookPokeImg" src="../image/poket_image/${vo.no }.png">
								</div>
								<div class="poketName">
									No.${vo.no }&nbsp; ${vo.name }<br/>
									<img class="bookTypeImg" alt="�Ӽ�1" src="../image/book_image/${vo.type1 }.jpg">
									<c:if test="${vo.type2 == '0'}">
										<br/>
									</c:if>
									<c:if test="${vo.type2 != '0' }">
										<img class="bookTypeImg" alt="�Ӽ�2" src="../image/book_image/${vo.type2 }.jpg">
									</c:if>
								</div>
							</div>
							<c:set var="num" value="${num+1 }"></c:set>
							<c:if test="${num%6==0 }">
							<li style="list-style: none;">
							</li>
							</c:if>
							</c:forEach>
						</li>
					</ul>
				</div>
			</div>
</body>
</html>