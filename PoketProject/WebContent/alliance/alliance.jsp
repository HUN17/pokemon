<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String name = (String)session.getAttribute("name");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body id="body">
   <center>
      <!-- outer div -->
         <div id="aliHeader">
               <h1>제휴 사이트 정보</h1>
               <h5><%=name %>님께 유용한 사이트들을 모았습니다.</h5>
         </div>
         <div style="width:100%; height:1300px;">
         <hr width="1000">
         <div class="aliSection">
            <div class="aliImg">
               <a href="http://pokemonkorea.co.kr/main_v2" target="_blank">
                  <img alt="포켓몬 코리아" src="../alliance/image/pokemonKor.png" width="270">
               </a>
            </div>
            <div class="aliText">
               <a href="http://pokemonkorea.co.kr/main_v2" target="_blank">
                  <h3>포켓몬스터 한국 공식 사이트</h3>
               </a>
               <h5>공식 이벤트와 다양한 정보들을 만나보세요!</h5>
               <br/>
               <p class="introduction">
                  [포켓몬스터 썬-문]의 게임 내에서는 입수할 수 없는 메가스톤을 선물!<br/>
                  <br/>
                  [썬-문]에 등장하지 않는 포켓몬에게 지니게 하는 메가스톤은 인터넷 대회에 참가하거나<br/>
                  <br/>
                  함호를 통해 손에 넣을 수 있습니다.<br/>
               </p>
            </div>
         </div>
         <hr width="1000">
         <div class="aliSection">
            <div style="width: 270px; height: 10px;"></div>
            <div class="aliImg">
               <a href="http://pokemongo.inven.co.kr/" target="_blank">
                  <img alt="포켓몬 고 인벤" src="../alliance/image/inven.png" width="270">
               </a>
            </div>
            <div class="aliText">
               <a href="http://pokemongo.inven.co.kr/" target="_blank">
                  <h3>포켓몬GO 인벤</h3>
               </a>
               <h5>포켓몬GO를 하고 계신가요? 인벤에서 대세 포켓몬 정보를 알아보세요!</h5>
               <br/>
               <p class="introduction">
                   Si9nal      예전에 잡아놓은 강날 드크 관상용임? 키워도됨? 2017-03-26 답글신고<br/>
                   <br/>
                   우리엄마랑께   아. . 80%이상인데 강날/파광 떠는데 박사행인가. . . . 2017-03-25 답글신고<br/>
                   <br/>
                   새하얀설원      드테/역린 노리시는 분들은. 2017-03-25 답글신고<br/>
               </p>
            </div>
         </div>
         <hr width="1000">
         <div class="aliSection">
            <div class="aliImg">
               <a href="https://www.facebook.com/PokemonCoKr" target="_blank">
                  <img alt="포켓몬 공식 페이스북" src="../alliance/image/facebook.png" width="270">
               </a>
            </div>
            <div class="aliText">
               <a href="https://www.facebook.com/PokemonCoKr" target="_blank">
                  <h3>포켓몬 코리아 페이스북</h3>
               </a>
               <h5>포켓몬 코리아가 여러분들에게 한걸음 가까이 다가갑니다.</h5>
               <br/>
               <p class="introduction">
                  포켓몬 트레이너 친구들! <br/>
                  <br/>
                  다음 주 4월 8일과 9일에 현대백화점 판교점에서 <br/>
                  <br/>
                  코리안리그2016-17 SPRING이 개최된다옹!<br/>
               </p>
            </div>
         </div>
         <hr width="1000">
         <div class="aliSection">
            <div class="aliImg">
               <div style="width: 270px; height: 30.22px;"></div>
               <a href="#" target="_blank">
                  <img alt="sist 녀석들" src="../alliance/image/sistguys.png" width="270">
               </a>
            </div>
            <div class="aliText">
               <a href="#" target="_blank">
                  <h3>SIST 녀석들</h3>
               </a>
               <h5>포켓몬을 잡으러 돌아다니시다가 배가 고파지셨나요? 신촌 맛집을 알아보세요!</h5>
               <br/>
               <p class="introduction">
                  SIST 녀석들에서 신촌맛집을 알려드립니다.<br/>
                  <br/>
                  전원남 김지남 정우삼 심지민<br/>
                  <br/>
                  집에 가고싶다...ㅠㅠ<br/>
               </p>
            </div>
         </div>
         <hr width="1000">
      </div>
   </center>
</body>
</html>