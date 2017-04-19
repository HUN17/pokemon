<%@page import="com.sist.user.MemberVO"%>
<%@page import="com.sist.user.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberVO vo = new MemberVO();
	MemberDAO dao = new MemberDAO();
	
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	String email = (String)session.getAttribute("email");
	//int point = Integer.parseInt(request.getParameter("point"));
	int a = 10000;
	int b = 50000;
	int c = 100000;
	
	vo =  dao.getMember(id);
	int point = vo.getPoint();
	System.out.println(point);
%>
<c:set var="a" value="<%=a %>"/>
<c:set var="b" value="<%=b %>"/>
<c:set var="c" value="<%=c %>"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
/* function compare() {
	send.submit();
} */

	 /* function compare(){
		var check = confirm("포인트를 교환하시겠습니까?");
		if(check == true){
			alert("포인트를 교환합니다.");
			send.submit();
		}else{
			alert("교환을 취소합니다.");
			history(-1);
		}
}; */
$(function(){
	$('.exchange').click(function(){
		
		if(confirm('포인트를 교환 하시겠습니까?')){
			alert("포인트를 교환합니다.");
			var ppoint = $('.exchange').attr('a-value');
			
			console.log("val: " + ppoint);
			var vo = {"ppoint":ppoint}; // val 쿠폰의 가격
			$.ajax({
				type: "POST",
				url: "../mypage/point_ok.jsp",
				data: vo
				
			});
			
			location.reload(true);
		}else{
			alert("교환을 취소합니다.");
			
		}
	})
	
		$('.exchange2').click(function(){
		
		if(confirm('포인트를 교환 하시겠습니까?')){
			alert("포인트를 교환합니다.");
			var ppoint = $('.exchange2').attr('a-value');
			
			console.log("val: " + ppoint);
			var vo = {"ppoint":ppoint}; // val 쿠폰의 가격
			$.ajax({
				type: "POST",
				url: "../mypage/point_ok.jsp",
				data: vo
				
			});
			
			location.reload(true);
		}else{
			alert("교환을 취소합니다.");
			
		}
	})
	
	$('.exchange3').click(function(){
		
		if(confirm('포인트를 교환 하시겠습니까?')){
			alert("포인트를 교환합니다.");
			var ppoint = $('.exchange3').attr('a-value');
			
			console.log("val: " + ppoint);
			var vo = {"ppoint":ppoint}; // val 쿠폰의 가격
			$.ajax({
				type: "POST",
				url: "../mypage/point_ok.jsp",
				data: vo
				
			});
			
			location.reload(true);
		}else{
			alert("교환을 취소합니다.");
			
		}
	})
})
</script>
</head>
<body>
	<div id="aliHeader">
               <h1>포인트 교환</h1>
               <h5><%=name %>님의 포인트를 쿠폰으로 교환하실 수 있습니다.</h5>
               <h5><%=email %>님의 포인트를 쿠폰으로 교환하실 수 있습니다.</h5>
                <h5><%=name %>님의 보유 포인트는 <%=vo.getPoint() %> 점 입니다.</h5>
     </div>
     <form action="../mypage/point_ok.jsp" method="post">
      <div style="width:100%; height:1300px;">
         <hr width="1000">
         <div class="aliSection">
            <div class="aliImg">
                  <img alt="음료 쿠폰" src="../image/point_image/drink.png" width="270">
            </div>
            <div class="aliText">
                  <h3>SIST녀석들 추천 맛집 음료 무료 쿠폰</h3>
               <br/>
               <c:if test="${point<a }">
               	포인트가 충분하지 않습니다.
               </c:if>
               <c:if test="${point>=a }">
              	<input class="exchange" a-value="<%=a %>" name="ppoint" type="button" value="<%=a %>point로 교환하기">
              </c:if>
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
               <c:if test="${point<b }">
               	포인트가 충분하지 않습니다.
               </c:if>
               <c:if test="${point>=b }">
               <input class="exchange2" a-value="<%=b %>" name="ppoint" type="button" value="<%=b %>point로 교환하기">
              </c:if>
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
              <c:if test="${point<c }">
               	포인트가 충분하지 않습니다.
               </c:if>
               <c:if test="${point>=c }">
              	<input class="exchange3" a-value="<%=c %>" name="ppoint" type="button" value="<%=c %>point로 교환하기">
              </c:if>
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
               <c:if test="${point<c }">
               	포인트가 충분하지 않습니다.
               </c:if>
               <c:if test="${point>=c }">
              	<input class="exchange3" a-value="<%=c %>" name="ppoint" type="button" value="<%=c %>point로 교환하기">
              </c:if>
            </div>
         </div>
         <hr width="1000">
      </div>
      </form>
</body>
</html>