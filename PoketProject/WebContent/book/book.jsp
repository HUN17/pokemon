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
			case "풀":
				list = dao.bookList2("grass");
				break;
			case "벌레":
				list = dao.bookList2("bug");
				break;
			case "악":
				list = dao.bookList2("evil");
				break;
			case "드래곤":
				list = dao.bookList2("dragon");
				break;
			case "전기":
				list = dao.bookList2("electric");
				break;
			case "페어리":
				list = dao.bookList2("fairy");
				break;
			case "격투":
				list = dao.bookList2("fight");
				break;
			case "불꽃":
				list = dao.bookList2("fire");
				break;
			case "비행":
				list = dao.bookList2("frying");
				break;
			case "고스트":
				list = dao.bookList2("ghost");
				break;
			case "땅":
				list = dao.bookList2("ground");
				break;
			case "얼음":
				list = dao.bookList2("ice");
				break;
			case "노말":
				list = dao.bookList2("normal");
				break;
			case "독":
				list = dao.bookList2("poison");
				break;
			case "에스퍼":
				list = dao.bookList2("psycho");
				break;
			case "바위":
				list = dao.bookList2("rock");
				break;
			case "강철":
				list = dao.bookList2("steel");
				break;
			case "물":
				list = dao.bookList2("water");
				break;
			}
		}
	}
	poketmonVO vo = new poketmonVO();
	int curpage = 1, totalpage = 6;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../book/book.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<script type="text/javascript">
	    function open_pop2(detail){
	        var url = '../book/detailBook.jsp?detail='+detail;
	        var set = "width=820,height=400";
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
									<option value="name">이름</option>
									<option value="no">번호</option>
									<option value="type">속성</option>
								</select>&nbsp;
									<input type="text" class="form-control" size="12" name="text" style="width:100px; float: left">&nbsp;
									<input type="submit" class="btn btn-primary" value="검색" style="width:100px; float: left">
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
						alert("검색 결과가 없습니다");
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
									<option value="name">이름</option>
									<option value="no">번호</option>
									<option value="type">속성</option>
								</select>&nbsp;
									<input type="text" class="form-control" size="12" name="text" style="width:100px; float: left">&nbsp;
									<input type="submit" class="btn btn-primary" value="검색" style="width:100px; float: left">
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
						alert("검색 결과가 없습니다");
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
									<h2 style="padding: 0px; margin: 0px; font-size: 15px;">No.${vo.no }&nbsp; ${vo.name }</h2>
									<img class="bookTypeImg" alt="속성1" src="../image/book_image/${vo.type1 }">
									<c:if test="${vo.type2 != null }">
										<img class="bookTypeImg" alt="속성2" src="../image/book_image/${vo.type2 }">
									</c:if>
									<c:if test="${vo.type2 == null }"></c:if>
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