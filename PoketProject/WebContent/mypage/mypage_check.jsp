<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = (String)session.getAttribute("id");
%>

<div style="height:100px;"></div>

<c:if test="${id==null }">
	<jsp:include page="../member/login.jsp"></jsp:include>
</c:if>
<c:if test="${id!=null }">
	<jsp:include page="../member/modify.jsp"></jsp:include>
</c:if>