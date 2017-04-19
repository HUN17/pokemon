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
		var check = confirm("����Ʈ�� ��ȯ�Ͻðڽ��ϱ�?");
		if(check == true){
			alert("����Ʈ�� ��ȯ�մϴ�.");
			send.submit();
		}else{
			alert("��ȯ�� ����մϴ�.");
			history(-1);
		}
}; */
$(function(){
	$('.exchange').click(function(){
		
		if(confirm('����Ʈ�� ��ȯ �Ͻðڽ��ϱ�?')){
			alert("����Ʈ�� ��ȯ�մϴ�.");
			var ppoint = $('.exchange').attr('a-value');
			
			console.log("val: " + ppoint);
			var vo = {"ppoint":ppoint}; // val ������ ����
			$.ajax({
				type: "POST",
				url: "../mypage/point_ok.jsp",
				data: vo
				
			});
			
			location.reload(true);
		}else{
			alert("��ȯ�� ����մϴ�.");
			
		}
	})
	
		$('.exchange2').click(function(){
		
		if(confirm('����Ʈ�� ��ȯ �Ͻðڽ��ϱ�?')){
			alert("����Ʈ�� ��ȯ�մϴ�.");
			var ppoint = $('.exchange2').attr('a-value');
			
			console.log("val: " + ppoint);
			var vo = {"ppoint":ppoint}; // val ������ ����
			$.ajax({
				type: "POST",
				url: "../mypage/point_ok.jsp",
				data: vo
				
			});
			
			location.reload(true);
		}else{
			alert("��ȯ�� ����մϴ�.");
			
		}
	})
	
	$('.exchange3').click(function(){
		
		if(confirm('����Ʈ�� ��ȯ �Ͻðڽ��ϱ�?')){
			alert("����Ʈ�� ��ȯ�մϴ�.");
			var ppoint = $('.exchange3').attr('a-value');
			
			console.log("val: " + ppoint);
			var vo = {"ppoint":ppoint}; // val ������ ����
			$.ajax({
				type: "POST",
				url: "../mypage/point_ok.jsp",
				data: vo
				
			});
			
			location.reload(true);
		}else{
			alert("��ȯ�� ����մϴ�.");
			
		}
	})
})
</script>
</head>
<body>
	<div id="aliHeader">
               <h1>����Ʈ ��ȯ</h1>
               <h5>����Ʈ�� �������� ��ȯ�Ͻ� �� �ֽ��ϴ�.</h5>
                <h5><font style="font-weight: bold;"><%=name %></font>���� ���� ����Ʈ�� <font style="font-weight: bold;"><%=vo.getPoint() %></font> �� �Դϴ�.</h5>
     </div>
     <form action="../mypage/point_ok.jsp" method="post">
      <div style="width:100%; height:1300px;">
         <hr width="1000">
         <div class="aliSection">
            <div class="aliImg">
                  <img alt="���� ����" src="../image/point_image/drink.png" width="270">
            </div>
            <div class="aliText">
                  <h3>SIST�༮�� ��õ ���� ���� ���� ����</h3>
               <br/>
               <c:if test="${point<a }">
               	����Ʈ�� ������� �ʽ��ϴ�.
               </c:if>
               <c:if test="${point>=a }">
              	<input class="exchange" a-value="<%=a %>" name="ppoint" type="button" value="<%=a %>point�� ��ȯ�ϱ�">
              </c:if>
            </div>
         </div>
         <hr width="1000">
         <div class="aliSection">
            <div style="width: 270px; height: 10px;"></div>
            <div class="aliImg">
                  <img alt="5% ����" src="../image/point_image/voucher.png" width="270">
            </div>
            <div class="aliText">
                  <h3>SIST�༮�� ��õ ���� 5% ���� ����</h3>
               <br/>
               <c:if test="${point<b }">
               	����Ʈ�� ������� �ʽ��ϴ�.
               </c:if>
               <c:if test="${point>=b }">
               <input class="exchange2" a-value="<%=b %>" name="ppoint" type="button" value="<%=b %>point�� ��ȯ�ϱ�">
              </c:if>
            </div>
         </div>
         <hr width="1000">
         <div class="aliSection">
            <div class="aliImg">
                  <img alt="���̵� �޴� ����" src="../image/point_image/fries.png" width="270">
            </div>
            <div class="aliText">
                  <h3>SIST�༮�� ��õ ���� ���̵� �޴� ���� ����</h3>
               <br/>
              <c:if test="${point<c }">
               	����Ʈ�� ������� �ʽ��ϴ�.
               </c:if>
               <c:if test="${point>=c }">
              	<input class="exchange3" a-value="<%=c %>" name="ppoint" type="button" value="<%=c %>point�� ��ȯ�ϱ�">
              </c:if>
            </div>
         </div>
         <hr width="1000">
         <div class="aliSection">
            <div class="aliImg">
                  <img alt="10% ����" src="../image/point_image/voucher.png" width="270">
            </div>
            <div class="aliText">
                  <h3>SIST�༮�� ��õ ���� 10% ���� ����</h3>
               <br/>
               <c:if test="${point<c }">
               	����Ʈ�� ������� �ʽ��ϴ�.
               </c:if>
               <c:if test="${point>=c }">
              	<input class="exchange3" a-value="<%=c %>" name="ppoint" type="button" value="<%=c %>point�� ��ȯ�ϱ�">
              </c:if>
            </div>
         </div>
         <hr width="1000">
      </div>
      </form>
</body>
</html>