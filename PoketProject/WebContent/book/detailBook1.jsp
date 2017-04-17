<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sist.poket.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%
		request.setCharacterEncoding("EUC-KR");
		String no = request.getParameter("detail");
		poketmonDAO dao = poketmonDAO.newInstance();
		/* poketmonVO vo = dao.detailData(Integer.parseInt(no)); */
		 poketmonVO vo = dao.detailData(1);  
%>
<c:set var="vo" value="<%=vo %>"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="detailBook1.css">
</head>
<body>
	<center>
		<div id="rootDiv">
				<div id="div0_0">
					<div id="div1">
						<div>
							<div id="div1_1">
								<img id="p_img" src="../image/poket_image/${vo.no }.png">
								</div>
							<div id="div1_2">
								<h2 id="title">No. ${vo.no }&nbsp;&nbsp;${vo.name }</h2>
							</div>
						</div>
					</div>
					
					<div id="div2">
						<div id="div2_z">
							<div id="div2_1a">
								타입 : <img class="t_img" src="../image/book_image/${vo.type1 }.jpg">
								<c:if test="${vo.type2 != '0' }">
								<img class="t_img" src="../image/book_image/${vo.type2 }.jpg"><br/>
								</c:if>
								<c:if test="${vo.type2 == '0' }">
								</c:if>
							</div>
							<div id="div2_1">강함 : 
								<c:if test="${vo.s_type1 != '0' }">
									<img class="t_img" src="../image/book_image/${vo.s_type1}.jpg">&nbsp;
								</c:if>
									<c:if test="${vo.s_type1 == '0' }">
								</c:if>
								<c:if test="${vo.s_type2 != '0' }">
									<img class="t_img" src="../image/book_image/${vo.s_type2 }.jpg"><br/>
								</c:if>
								<c:if test="${vo.s_type2 == '0' }">
								</c:if>
							</div>
							<div id="div2_1b">
								약함 :&nbsp; <img class="t_img" src="../image/book_image/${vo.l_type1 }.jpg">&nbsp;
								<c:if test="${vo.l_type2 != '0' }">
									<img class="t_img" src="../image/book_image/${vo.l_type2 }.jpg"><br/>
								</c:if>
								<c:if test="${vo.l_type2 == '0' }">
								</c:if>
							</div>
						</div>
						
						<div id="div2_">
							<!-- <div class="stat-levels"> -->
							<div style="float: left; width: 90px; text-align: center;">
								<div class="test">&nbsp;CP : ${vo.cp }</div>
								<div class="test">&nbsp;ATT : ${vo.att }</div>
								<div class="test">&nbsp;DEF : ${vo.def }</div>
								<div class="test">&nbsp;HP : ${vo.hp }</div>
							</div>
							<div style="float: right; width: 350px">
							  <div class="stat-1 stat-bar">
							  	<c:if test="${vo.cp <=400 && vo.cp > 0}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width:10% ;"></span>
							  	</c:if>
							  	<c:if test="${vo.cp <=800 && vo.cp > 400}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width:20% ;"></span>
							  	</c:if>
							  	<c:if test="${vo.cp <=1200 && vo.cp > 800}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width:30% ;"></span>
							  	</c:if>
							  	<c:if test="${vo.cp <=1600 && vo.cp > 1200}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width:40% ;"></span>
							  	</c:if>
							  	<c:if test="${vo.cp <=2000 && vo.cp > 1600}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width:50% ;"></span>
							  	</c:if>
							  	<c:if test="${vo.cp <=2400 && vo.cp > 2000}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width:60% ;"></span>
							  	</c:if>
							  	<c:if test="${vo.cp <=2800 && vo.cp > 2400}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width:70% ;"></span>
							  	</c:if>
							  	<c:if test="${vo.cp <=3200 && vo.cp > 2800}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width:80% ;"></span>
							  	</c:if>
							  	<c:if test="${vo.cp <=3600 && vo.cp > 3200}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width:90% ;"></span>
							  	</c:if>
							  	<c:if test="${vo.cp <=4000 && vo.cp > 3600}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width:100% ;"></span>
							  	</c:if>
							  </div>
							  <div class="stat-2 stat-bar">
							 	<c:if test="${vo.att <=30 && vo.att > 0}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 10%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=60 && vo.att > 30}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 20%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=90 && vo.att > 60}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 30%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=120 && vo.att > 90}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 40%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=150 && vo.att > 120}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 50%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=180 && vo.att > 150}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 60%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=210 && vo.att > 180}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 70%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=240 && vo.att > 210}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 80%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=270 && vo.att > 240}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 90%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=300 && vo.att > 270}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 100%;"></span>
							  	</c:if>
							  </div>
							  <div class="stat-3 stat-bar">
							  	<c:if test="${vo.def <=30 && vo.def > 0}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 10%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=60 && vo.def > 30}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 20%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=90 && vo.def > 60}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 30%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=120 && vo.def > 90}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 40%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=150 && vo.def > 120}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 50%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=180 && vo.def > 150}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 60%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=210 && vo.def > 180}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 70%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=240 && vo.def > 210}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 80%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=270 && vo.def > 240}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 90%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=300 && vo.def > 270}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 100%;"></span>
							  	</c:if>
							  </div>
							  <div class="stat-4 stat-bar">
							  	<c:if test="${vo.hp <=30 && vo.hp > 0}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 10%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=60 && vo.hp > 30}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 20%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=90 && vo.hp > 60}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 30%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=120 && vo.hp > 90}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 40%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=150 && vo.hp > 120}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 50%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=180 && vo.hp > 150}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 60%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=210 && vo.hp > 180}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 70%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=240 && vo.hp > 210}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 80%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=270 && vo.hp > 240}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 90%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=300 && vo.hp > 270}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 100%;"></span>
							  	</c:if>
							  </div>
							  <!-- </div> -->
							</div>
						</div>
						<%-- <div id="div2_2a">
							<div class="div2_2_2">CP : ${vo.cp }</div>
							<div class="div2_2_2">ATT : ${vo.att }</div>
						</div>
						<div id="div2_2b">
							<div class="div2_2_2">DEF : ${vo.def }</div>
							<div class="div2_2_2">HP : ${vo.hp }</div>
						</div> --%>
						
						<div id="div2_3">포획정보 ${vo.gps1 }</div>
					</div>
			</div>
			
			
			
			<div id="div0_1">
				<div id="div3">
					<div class="div3_1">
						<c:if test="${vo.rev1 !='0' }">
							<img class="rev_img" src="../image/poket_image/${vo.rev1 }.png" >
						</c:if>
						<c:if test="${vo.rev1 =='0' }"></c:if>
					</div>
					<div class="div3_1">
						<c:if test="${vo.rev2 !='0' }">
							<img class="rev_img" src="../image/poket_image/${vo.rev2 }.png" >
						</c:if>
						<c:if test="${vo.rev2 =='0' }"></c:if>
					</div>
					<div class="div3_1">
						<c:if test="${vo.rev3 !='0' }">
							<img class="rev_img" src="../image/poket_image/${vo.rev3 }.png" >
						</c:if>
						<c:if test="${vo.rev3 =='0' }"></c:if>
					</div>
					<div class="div3_1">
						<c:if test="${vo.rev4 !='0' }">
							<img class="rev_img" src="../image/poket_image/${vo.rev4 }.png" >
						</c:if>
						<c:if test="${vo.rev4 =='0' }"></c:if>
					</div>
					<div class="div3_1">
						<c:if test="${vo.rev5 !='0' }">
							<img class="rev_img" src="../image/poket_image/${vo.rev5 }.png" >
						</c:if>
						<c:if test="${vo.rev5 =='0' }"></c:if>
					</div>
					<div class="div3_1">
						<c:if test="${vo.rev6 !='0' }">
							<img class="rev_img" src="../image/poket_image/${vo.rev6 }.png" >
						</c:if>
						<c:if test="${vo.rev6 =='0' }"></c:if>
					</div>
				</div>
			</div>
		</div>
	</center>
</body>
</html>