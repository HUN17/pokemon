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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		alert("����Ʈ�� �����մϴ�.");
		<%
		}else{
		%>
		if(confirm("����Ʈ�� ��ȯ�Ͻðڽ��ϱ�?")){
			alert("����Ʈ�� ��ȯ�մϴ�.");
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
    <center>
	<div id="aliHeader">
               <h1>����Ʈ ��ȯ</h1>
               <h5><%=name %>���� ����Ʈ�� �������� ��ȯ�Ͻ� �� �ֽ��ϴ�.</h5>
               <h5><%=email %>���� ����Ʈ�� �������� ��ȯ�Ͻ� �� �ֽ��ϴ�.</h5>
                <h5><%=name %>���� ���� ����Ʈ�� <%=point %> �� �Դϴ�.</h5>
     </div>

     <div style="width:100%; height:1300px;">
         <hr width="1000">
         <div class="aliSection">
            <div class="aliImg">
                  <img alt="���� ����" src="../image/point_image/drink.png" width="270">
            </div>
            <div class="aliText">
                  <h3>SIST�༮�� ��õ ���� ���� ���� ����</h3>
               <br/>
               <a class="exchange" onclick="compare();"><%=a %>����Ʈ�� ��ȯ�ϱ�</a>
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
              <a class="exchange"><%=b %>����Ʈ�� ��ȯ�ϱ�</a>
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
              <a class="exchange"><%=b %>����Ʈ�� ��ȯ�ϱ�</a>
            </div>
         </div>
         <hr width="1000">
         <div class="aliSection">
            <div class="aliImg">
               <div style="width: 270px; height: 30.22px;"></div>
                  <img alt="10% ����" src="../image/point_image/voucher.png" width="270">
            </div>
            <div class="aliText">
                  <h3>SIST�༮�� ��õ ���� 10% ���� ����</h3>
               <br/>
               <a class="exchange"><%=c %>����Ʈ�� ��ȯ�ϱ�</a>
            </div>
         </div>
         <hr width="1000">
      </div>
     </center>
</body>
</html>