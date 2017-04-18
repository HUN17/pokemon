<%@page import="com.sist.user.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	MemberDAO dao = new MemberDAO();
	
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	String email = (String)session.getAttribute("email");
	int point = (int)session.getAttribute("point");
	int a = 10000;
	int b = 50000;
	int c = 100000;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function compare(){	
		<% 
		if (point<a){
		%>
		alert("포인트가 부족합니다.");
		<%
		}else{
		%>
		if(confirm("포인트를 교환하시겠습니까?")){
			alert("포인트를 교환합니다.");
		<%
			dao.minusPoint(a,id);
		%>	
		}else{
			history(-1);
		}
		<%
		};
		%>
};
</script>
</head>
<body>
	<div id="aliHeader">
               <h1>포인트 교환</h1>
               <h5><%=name %>님의 포인트를 쿠폰으로 교환하실 수 있습니다.</h5>
               <h5><%=email %>님의 포인트를 쿠폰으로 교환하실 수 있습니다.</h5>
                <h5><%=name %>님의 보유 포인트는 <%=point %> 점 입니다.</h5>
     </div>
      <div style="width:100%; height:1300px;">
         <hr width="1000">
         <div class="aliSection">
            <div class="aliImg">
                  <img alt="음료 쿠폰" src="../image/point_image/drink.png" width="270">
            </div>
            <div class="aliText">
                  <h3>SIST녀석들 추천 맛집 음료 무료 쿠폰</h3>
               <br/>
               <a class="exchange" onclick="compare();"><%=a %>포인트로 교환하기</a>
            </div>
         </div>
         <hr width="1000">
         <div class="aliSection">
            <div style="width: 270px; height: 10px;"></div>
            <div class="aliImg">
                  <img alt="5% 쿠폰" src="../image/point_image/voucher.png" width="270">
            </div>
            <div class="aliText">
                  <h3>SIST녀석들 추천 맛집 5% 할인 쿠폰</h3>
               <br/>
              <a class="exchange"><%=b %>포인트로 교환하기</a>
            </div>
         </div>
         <hr width="1000">
         <div class="aliSection">
            <div class="aliImg">
                  <img alt="사이드 메뉴 쿠폰" src="../image/point_image/fries.png" width="270">
            </div>
            <div class="aliText">
                  <h3>SIST녀석들 추천 맛집 사이드 메뉴 무료 쿠폰</h3>
               <br/>
              <a class="exchange"><%=b %>포인트로 교환하기</a>
            </div>
         </div>
         <hr width="1000">
         <div class="aliSection">
            <div class="aliImg">
               <div style="width: 270px; height: 30.22px;"></div>
                  <img alt="10% 쿠폰" src="../image/point_image/voucher.png" width="270">
            </div>
            <div class="aliText">
                  <h3>SIST녀석들 추천 맛집 10% 할인 쿠폰</h3>
               <br/>
               <a class="exchange"><%=c %>포인트로 교환하기</a>
            </div>
         </div>
         <hr width="1000">
      </div>
</body>
</html>