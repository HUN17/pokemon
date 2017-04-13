<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.sist.poket.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String no = request.getParameter("detail");
	poketmonDAO dao = poketmonDAO.newInstance();
	poketmonVO vo = dao.detailData(Integer.parseInt(no));
	
%>

<c:set var="vo" value="<%=vo %>"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">

	#main{
	background-color: red;
	width: 950px;
	height: 600px;
	}
	
	#a{
	float: left;
	margin-top: 40px;
	width: 420px;
	height: 450px
	}
	
	#image{
	background-color: yellow;
	padding: 0;
	margin: 10px 0px 10px 10px;
	width: 400px;
	height: 400px;
	}
	#t_img{
	width: 400px;
		
	}
	
	#noName{
	display:table-cell;
	background-color: pink;
	margin:  0px 0px 10px 10px;
	font-size: 40px;
	text-align: center;
	vertical-align: middle;
	width: 400px;
	height: 100px;
	}
	
	#b{
	margin-top: 30px;
	float: left;
	width: 480px;
	height: 220px;
	}
	
	#b_table{
	list-style: none;
	float: left;
	}
	
	#type{
	float: left;
	background-color: grey;
	margin: 10px 10px 0px 10px;
	width: 150px;
	height: 50px;	
	}
	
	#stype{
	float: left;
	background-color: grey;
	margin: 10px 10px 0px 10px;
	width: 150px;
	height: 50px;
	
	}
	#ltype{
	float: left;
	background-color: grey;
	margin: 10px 10px 10px 10px;
	width: 150px;
	height: 50px;
	}
	
	#b_table2{
	list-style: none;
	float: right;
	
	}
	
	#cp{
	float: right;
	background-color: grey;
	margin: 0px 20px 10px 0px;
	width: 150px;
	height: 40px;
	}
	
	#att{
	float: right;
	background-color: grey;
	margin: 0px 20px 10px 0px;
	width: 150px;
	height: 40px;
	}
	
	#def{
	float: right;
	background-color: grey;
	margin: 0px 20px 10px 0px;
	width: 150px;
	height: 40px;
	}
	
	#hp{
	float: right;
	background-color: grey;
	margin: 0px 20px 10px 0px;
	width: 150px;
	height: 40px;
	}
	
	#c{
	
	margin-right: 20px;
	float: right;
	background-color: skyblue;
	width: 480px;
	height: 300px;
	position:relative;
	
	}
	
	#test_img{

	width:140px;

	left:0; 
	right:0; 
	margin-left:auto; 
	margin-right:auto;

	}
</style>
</head>
<body>
	<center>
		<div id="main" >
			<div id="a">
				<div id="image">
				<img src="../image/poket_image/${vo.no }.png" width="90%" height="90%">
				</div>
			
				<div id="noName">
					No : ${vo.no } 이름 : ${vo.name }
				</div>
			</div>
			
			<div id="b">
			
			<ul id="b_table">
				<li>
					<div id="type">타입<br/>
						<img src="../image/book_image/${vo.type1 }.jpg" align="middle">&nbsp;
							<c:if test="${vo.type2 != '0' }">
						<img src="../image/book_image/${vo.type2 }.jpg" align="middle"><br/>
						</c:if>
					 </div>	
				</li>
				
				<li>
					<div id="stype">강한 타입<br/>
						<c:if test="${vo.s_type1 != '0' }">
							<img src="../image/book_image/${vo.s_type1}.jpg" align="middle">
						</c:if>
						<c:if test="${vo.s_type1 == '0' }">
						
						</c:if>
						<c:if test="${vo.s_type2 != '0' }">
							<img src="../image/book_image/${vo.s_type2 }.jpg" align="middle">
						</c:if>
						<c:if test="${vo.s_type2 == '0' }">
						
						</c:if>
					</div>
				</li>
				
				
				<li>
				<div id="ltype">약한 타입<br/>
				 	<img src="../image/book_image/${vo.l_type1 }.jpg" align="middle">
						<c:if test="${vo.l_type2 != '0' }">
					<img src="../image/book_image/${vo.l_type2 }.jpg" align="middle"><br/>
						</c:if>
						<c:if test="${vo.l_type2 == '0' }">
						<br/>
						</c:if>
				</div>
				
				</li>
				
				
			</ul>
			
			<ul id="b_table2">	
				<li><div id="cp">cp</div></li>
				<li><div id="att">att</div></li>
				<li><div id="def">def</div></li>
				<li><div id="hp">hp</div></li>
			</ul>	
			</div>	
			
			<div id="c">
				<div style="width:500px; height:50px;">
				<h4 style="padding: 0px; margin: 0px; font-size: 15px; text-align: center;">진화정보</h4>
			</div>
			<div style="width:165px; height:150px; float:  left;">
				<c:if test="${vo.rev1 !='0' }">
					<img src="../image/poket_image/${vo.rev1 }.png" width="150" >
				</c:if>
				<c:if test="${vo.rev1 =='0' }"></c:if>
			</div>
			<div style="width:165px; height:150px; float: left;">
				<c:if test="${vo.rev2 !='0' }">
					<img src="../image/poket_image/${vo.rev2 }.png"width="150" >
				</c:if>
				<c:if test="${vo.rev2 =='0' }"></c:if>
			</div>
			<div style="width:165px; height:150px; float: left;">
				<c:if test="${vo.rev3 !='0' }">
					<img src="../image/poket_image/${vo.rev3 }.png" width="150" >
				</c:if>
				<c:if test="${vo.rev3 =='0' }"></c:if>
			</div>	
			<!-- 	
				<br/>
				<img id="test_img" alt="" src="../poket_image/tset.png">
				<img id="test_img" alt="" src="../poket_image/tset.png">
				<img id="test_img" alt="" src="../poket_image/tset.png"> -->
			</div>
			
		</div>
		
		
	</center>
</body>
</html>