<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sist.poket.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<%
		request.setCharacterEncoding("EUC-KR");
		String no = request.getParameter("detail");
		poketmonDAO dao = poketmonDAO.newInstance();
		poketmonVO vo = dao.detailData(Integer.parseInt(no));
		/* poketmonVO vo = dao.detailData(Integer.parseInt("50"));  */

%>
<c:set var="vo" value="<%=vo %>"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="detailBook1.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script type="text/javascript" src="../main/js/jquery.bounce.js"></script>


<!-- 
<link href="www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css"> 
 -->
<script type="text/javascript">
	$(function(){
		$('.bounce').bounce();
});
</script>
<script type="text/javascript">
	function send(number) {
		number = number+1; 
/*  		if(numer > 248) {
			number = 1;
		} */
		location.href="../book/detailBook1.jsp?detail="+number;
	};
	
	function send2(number) {
		number = number-1; 
/* 		if(numer < 1) {
			number = 248;
		} */
		location.href="../book/detailBook1.jsp?detail="+number;
	};
</script>
</head>
<body>
	<center>
		<div id="rootDiv">
			<div class="aaa">
				<div id="bbb">
				</div>
				<div id="div0_0">
					<img img class="bounce" 
							     data-distance="15" 
							     data-speed-down="300" 
							     data-speed-up="800" 
							     id="p_img" 
							     src="../image/poket_image/${vo.no }.png"> 
				</div>
				<div id="div0_1">
					<h1 id="title">No. ${vo.no }&nbsp;&nbsp;${vo.name }</h1>
				</div>
				
				<div id="div0_2">
				</div>
				<div id="div0_2">
					<div class="pre_btn"><span class="pre_btn" onclick="send2(${vo.no });"></span></div>
					<div class="next_btn"><span class="next_btn" onclick="send(${vo.no });"></span></div>
				</div>
			</div>
				
			<div class="aaa">
				<div id="bbb_2">
				</div>
				<div id="div1_0">
					<div id="typediv_1">
						<div id="div1_1">
							<div id="div1_1a">
								타입 : <img class="t_img" src="../image/book_image/${vo.type1 }.jpg">
								<c:if test="${vo.type2 != '0' }">
								<img class="t_img" src="../image/book_image/${vo.type2 }.jpg"><br/>
								</c:if>
								<c:if test="${vo.type2 == '0' }">
								</c:if>
							</div>
							<div id="div1_2a">강함 : 
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
							<div id="div1_3a">
								약함 : <img class="t_img" src="../image/book_image/${vo.l_type1 }.jpg">&nbsp;
								<c:if test="${vo.l_type2 != '0' }">
									<img class="t_img" src="../image/book_image/${vo.l_type2 }.jpg"><br/>
								</c:if>
								<c:if test="${vo.l_type2 == '0' }">
								</c:if>
							</div>
						</div>
						<div id="div1_2">
							<div id="div1_3"><font size="4px;">포획정보</font>
								<br/>${vo.gps1 }<br/>
								<c:if test="${vo.gps2 !='0' }">${vo.gps2 }</c:if>
								<c:if test="${vo.gps2 =='0' }"></c:if>
						</div>
					</div>
					</div>
				</div>
				<div id="div2_0">
					<div id="typediv_2">
							<!-- <div class="stat-levels"> -->
							<div style="float: left; width: 90px; text-align: center;">
								<div class="test">&nbsp;CP	: ${vo.cp }</div>
								<div class="test">&nbsp;ATT : ${vo.att }</div>
								<div class="test">&nbsp;DEF : ${vo.def }</div>
								<div class="test">&nbsp;HP	: ${vo.hp }</div>
							</div>
							<div style="float: left; width: 250px">
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
							 	<c:if test="${vo.att <=40 && vo.att > 0}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 10%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=80 && vo.att > 40}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 20%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=120 && vo.att > 80}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 30%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=160 && vo.att > 120}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 40%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=200 && vo.att > 160}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 50%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=240 && vo.att > 200}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 60%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=280 && vo.att > 240}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 70%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=320 && vo.att > 280}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 80%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=360 && vo.att > 320}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 90%;"></span>
							  	</c:if>
							  	<c:if test="${vo.att <=400 && vo.att > 360}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 100%;"></span>
							  	</c:if>
							  </div>
							  <div class="stat-3 stat-bar">
							  	<c:if test="${vo.def <=40 && vo.def > 0}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 10%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=80 && vo.def > 40}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 20%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=120 && vo.def > 80}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 30%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=160 && vo.def > 120}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 40%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=200 && vo.def > 160}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 50%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=240 && vo.def > 200}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 60%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=280 && vo.def > 240}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 70%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=320 && vo.def > 280}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 80%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=360 && vo.def > 320}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 90%;"></span>
							  	</c:if>
							  	<c:if test="${vo.def <=400 && vo.def > 360}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 100%;"></span>
							  	</c:if>
							  </div>
							  <div class="stat-4 stat-bar">
							  	<c:if test="${vo.hp <=40 && vo.hp > 0}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 10%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=80 && vo.hp > 40}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 20%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=120 && vo.hp > 80}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 30%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=160 && vo.hp > 120}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 40%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=200 && vo.hp > 160}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 50%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=240 && vo.hp > 200}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 60%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=280 && vo.hp > 240}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 70%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=320 && vo.hp > 280}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 80%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=360 && vo.hp > 320}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 90%;"></span>
							  	</c:if>
							  	<c:if test="${vo.hp <=400 && vo.hp > 360}">
							    	<span class="stat-bar-rating" role="stat-bar" style="width: 100%;"></span>
							  	</c:if>
							  </div>
					</div>
				</div>
		 	</div>
		 	
		 <div id="div3_0">
		 
				<div id="div3">
					<div class="div3_1">
						<c:if test="${vo.rev1 !='0' }">
							<a href="../book/detailBook1.jsp?detail=${vo.rev1 }"><img class="rev_img" src="../image/poket_image/${vo.rev1 }.png" ></a>
						</c:if>
						<c:if test="${vo.rev1 =='0' }"></c:if>
						<c:if test="${vo.rev2 !='0' }">
							<a href="../book/detailBook1.jsp?detail=${vo.rev2 }"><img class="rev_img" src="../image/poket_image/${vo.rev2 }.png" ></a>
						</c:if>
						<c:if test="${vo.rev2 =='0' }"></c:if>
						<c:if test="${vo.rev3 !='0' }">
							<a href="../book/detailBook1.jsp?detail=${vo.rev3 }"><img class="rev_img" src="../image/poket_image/${vo.rev3 }.png" ></a>
						</c:if>
						<c:if test="${vo.rev3 =='0' }"></c:if>
					</div>
				</div>
				
				<div id="div3">
					<div class="div3_1">
						<c:if test="${vo.rev4 !='0' }">
							<a href="../book/detailBook1.jsp?detail=${vo.rev4 }"><img class="rev_img" src="../image/poket_image/${vo.rev4 }.png" ></a>
						</c:if>
						<c:if test="${vo.rev4 =='0' }"></c:if>
						<c:if test="${vo.rev5 !='0' }">
							<a href="../book/detailBook1.jsp?detail=${vo.rev5 }"><img class="rev_img" src="../image/poket_image/${vo.rev5 }.png" ></a>
						</c:if>
						<c:if test="${vo.rev5 =='0' }"></c:if>
						<c:if test="${vo.rev6 !='0' }">
							<a href="../book/detailBook1.jsp?detail=${vo.rev6 }"><img class="rev_img" src="../image/poket_image/${vo.rev6 }.png" ></a>
						</c:if>
						<c:if test="${vo.rev6 =='0' }"></c:if>
					</div>
				</div>
		</div>		
		
		</div>
				
	</center>

</body>
</html>






























