<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.sist.poket.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
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
</head>
<body>
	<form name="form2">
	<center>
	<div style="margin-top: 30px"></div>
	<div style="width:800px; height:350px; border:2px; margin: 0; padding: 0;">
	
		<div style="width:300px; height:350px; float: left">	 <!-- 폼1 -->
			<div style="width:300px; height:290px;vertical-align: middle">
				<img src="../image/poket_image/${vo.no }.png" width="90%" height="90%">
			</div>
			<div style="width:300px; height:50px;;">
				<h4 style="padding: 0px; margin: 0px; font-size: 15px;">No : ${vo.no } 이름 : ${vo.name }</h4>
			</div>
		</div>
		
		
		<div style="width:500px; height:350px; float: left;"> <!-- 폼2 -->
			<div style="width:500px; height:150px; vertical-align: middle;">
					타입 : 
					<img src="../image/poket_image/${vo.type1 }.png" align="middle">&nbsp;
					<c:if test="${vo.type2 != null }">
						<img src="../image/poket_image/${vo.type2 }.png" align="middle"><br/>
					</c:if>
					<c:if test="${vo.type2 == null }">
						<br/>
					</c:if>
					
					강한 상성 :&nbsp; 
					<c:if test="${vo.s_type1 != null }">
					<img src="../image/poket_image/${vo.s_type1}.png" align="middle">&nbsp;
					</c:if>
					<c:if test="${vo.s_type1 == null }">
					<br/>
					</c:if>
					<c:if test="${vo.s_type2 != null }">
						<img src="../image/poket_image/${vo.s_type2 }.png" align="middle"><br/>
					</c:if>
					<c:if test="${vo.s_type2 == null }">
						<br/>
					</c:if>
					
					약한 상성 :&nbsp; <img src="../image/poket_image/${vo.l_type1 }.png" align="middle">&nbsp;
					<c:if test="${vo.l_type2 != null }">
						<img src="../image/poket_image/${vo.l_type2 }.png" align="middle"><br/>
					</c:if>
					<c:if test="${vo.l_type2 == null }">
						<br/>
					</c:if>
			</div>
			<div style="width:500px; height:50px;">
				<h4 style="padding: 0px; margin: 0px; font-size: 15px; text-align: center;">진화정보</h4>
			</div>
			<div style="width:165px; height:150px; float:  left;">
				<c:if test="${vo.rev1 !=null }">
					<img src="../image/poket_image/${vo.rev1 }.png" width="150" >
				</c:if>
				<c:if test="${vo.rev1 ==null }"></c:if>
			</div>
			<div style="width:165px; height:150px; float: left;">
				<c:if test="${vo.rev2 !=null }">
					<img src="../image/poket_image/${vo.rev2 }.png"width="150" >
				</c:if>
				<c:if test="${vo.rev2 ==null }"></c:if>
			</div>
			<div style="width:165px; height:150px; float: left;">
				<c:if test="${vo.rev3 !=null }">
					<img src="../image/poket_image/${vo.rev3 }.png" width="150" >
				</c:if>
				<c:if test="${vo.rev3 ==null }"></c:if>
			</div>
		</div>
	</div>

	</center>
	</form>
</body>
</html>