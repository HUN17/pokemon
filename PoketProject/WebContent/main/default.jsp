<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.sist.poket.*, java.util.*"%>
<%@ page import="com.sist.board.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
		poketmonDAO dao = poketmonDAO.newInstance();
		ArrayList<poketmonVO> list = dao.bookList();
		poketmonVO vo = new poketmonVO();
		

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="main.css">
<!-- ����ũ�� -->
<link rel="stylesheet" href="resource/owl.carousel.min.css">
<link rel="stylesheet" href="resource/owl.theme.default.min.css">

<!-- ����ũ������Ʈ�� -->
<script src="resource/jquery.min.js"></script>
<script src="resource/owl.carousel.min.js"></script>
<script type="text/javascript">
 	$(document).ready(function(){
		$('.owl-carousel').owlCarousel({
		    loop:true,
		    margin:10,
		    nav:true,
		    responsive:{
		        0:{
		            items:1
		        },
		        600:{
		            items:3
		        },
		        1000:{
		            items:7
		        }
		    }
		})
	})
	
	function open_pop2(detail){
	        var url = '../book/detailBook.jsp?detail='+detail;
	        var set = "width=820,height=400";
	        window.open(url,'popupView',set); 
	    }
</script>

<!-- ����Ÿ������ -->
<style type="text/css">
	div {
		padding: 0px 0px 0px 0px;
	}
/* 	.main_book {
		width: 150px; 
		height: 150px; 
		float: left; 
		margin: 10px 15px 0px 20px;
	} */
	.owl-dots {
		visibility: hidden;
	}

</style>
</head>
<body>
			<!-- mid div -->
			<div style="width: 1300px; height: 1800px;">		
				
				<!-- �� div -->
				<div style="width: 1300px; height: 340px;">
					
					<!-- ���� �� div -->
					<div style="width: 610px; height: 300px; float: left; margin: 15px 10px 15px 25px; background-color: #d3d3d3;">		
					<jsp:include page="../chat/chat.jsp"></jsp:include> 
					</div>		<!-- ���� �� div -->
	
					<!-- ������ �� div -->
					<div style="width: 610px; height: 300px;  float: left; margin: 15px; background-color: #d3d3d3;">		
					
					</div>		<!-- ������ �� div -->
				
				</div>		<!-- �� div -->
				
				<!-- �߰� div -->
				<div style="width: 1300px; height: 240px;">
						
						<!-- ���ϸ� ���� div -->
 						<c:set var="list" value="<%=list %>"></c:set>
						<div class="owl-carousel owl-theme" style="width: 1200px; height: 200px;">
						    <c:forEach var="vo" items="${list}" >
						    	<div class="item" style="width: 150px" onclick="open_pop2(${vo.no})">
						    		<div>
										<img src="../image/poket_image/${vo.no }.png" width="100">
									</div>
									<div>
										<h4 style="padding: 0px; margin: 0px; font-size: 15px;">${vo.name }</h4>
									</div>
						    	</div>
						    </c:forEach>
						</div>

				</div><!-- �߰� div -->
				
				<!-- �Ʒ� div -->
				<div>
					<div style="width: 1300px; height: 800px;">
						
						<!-- �Խ���1  div -->
						<div style="width: 610px; height: 370px; float: left; margin: 15px 15px 15px 25px;								background-color: #d3d3d3;">		
						
						</div>		<!-- �Խ���1 div -->
						
						<!-- �Խ���2  div -->
						<div style="width: 610px; height: 370px; float: left; margin: 15px 15px 15px 25px;								background-color: #d3d3d3;">		
						
						</div>		<!-- �Խ���2 div -->
		
						<!-- �Խ���3 �Ʒ� div -->
						<div style="width: 610px; height: 370px;  float: left; margin: 15px 15px 15px 25px;								background-color: #d3d3d3;">		
						
						</div>		<!-- �Խ���3 �Ʒ� div -->
						
						<!-- �Խ���4 �Ʒ� div -->
						
						<div style="width: 610px; height: 370px;  float: left; margin: 15px 15px 15px 25px;								background-color: #d3d3d3;">	
							<div style="width: 520px; height: 50px; background-color: #000000; margin:0px 15px; color:white; font-weight: bold; font-size: 30px; padding: 0px 30px">�����Խ���</div>	
							<table width="580" height="300" style="margin: 10px" align="center">
								<tr>
									<td width="10%" align="center">��ȣ</td>
									<td width="70%" align="center">����</td>
									<td width="20%" align="center">�̸�</td>
								</tr>
								
								<%
									freeDAO f_dao = new freeDAO();
									List<freeVO> f_list = f_dao.boardListData(1);
									SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							        String today = sdf.format(new Date());
								%>
									<c:set var="f_list" value="<%=f_list %>"></c:set>
									<c:set var="today" value="<%=today %>"></c:set>
									<c:forEach var="f_vo" items="${f_list}" >
										<%-- <c:if test="${today == f_vo.dbday }"> --%> <%-- ���� ��¥�� DB ��¥�� ���ؼ� �����Ÿ� ��� --%>
										<tr >
											<td width="10%" align="center">${f_vo.no }</td>
											<td width="70%" align="center">${f_vo.subject }</td>
											<td width="20%" align="center">${f_vo.name }</td>
										</tr>
										<%-- </c:if> --%>
									</c:forEach>
								
								
							</table> 

						</div>		<!-- �Խ���4 �Ʒ� div -->
					</div>
				</div><!-- �Ʒ� div -->
				
				<!-- ���� ����Ʈ -->
				<div style="width:1300px; height: 170px; background-color: pink; margin: 15px 15px 15px 25px;">
					<jsp:include page="../alliance/ali_mini.jsp"></jsp:include>
				</div><!-- ���� ����Ʈ -->
				
				<!--  ���� -->
				<div style="width:1300px; background-color: yellow; margin: 15px 15px 15px 25px;">
					<img src="../image/main_image/ad_image.png" width="1300" height="200" >
				</div>

			</div>		<!-- mid div -->
			


</body>
</html>