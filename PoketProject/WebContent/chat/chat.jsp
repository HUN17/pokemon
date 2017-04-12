<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="accessUserCount" class="java.util.ArrayList" scope="application"/>
<%
	String id = (String)session.getAttribute("id");
	//System.out.println(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

var userId ="<%=id%>"; //아이디

/* 	//대화 보내기
	function sendTalk(){
		var obj = document.getElementById("talk_input");

		if(obj.value!=""){
			addTalk(obj.value);	//대화내용 추가
			obj.value="";	//텍스트필드 초기화
			obj.focus();	//커서
		}
	};

	//엔터키로 대화 보내기
	function enterSend(){
			if(window.event.keyCode==13) sendTalk();
	};

	//대화 보기
	function addTalk(content){
		var obj = document.getElementById("talk_view");
		
		var line = "[" + userId + "] : " + content+"<br>";	//이름: 내용
			obj.innerHTML+=line;	//내용 추가
			obj.scrollTop=obj.scrollHeight;	//스크롤 자동 내림
	};
*/

	var xmlHttp;

	//XMLHttpRequest
	function startRequest(){
		if(window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		else if(window.XMLHttpRequest){
			xmlHttp = new XMLHttpRequest();
		}

		xmlHttp.onreadystatechange = handleStateChange;
		xmlHttp.open("GET","../chat/userCount.jsp",true);
		xmlHttp.send(null);

		//5초마다 갱신
		setTimeout("startRequest()", 5000);
		return false;
	}

	//Output
	function handleStateChange(){
		if(xmlHttp.readyState == 4){
			if(xmlHttp.status == 200){
				document.getElementById("scrollList").innerHTML = xmlHttp.responseText;
			}
		}
	}

	//브라우저의 종료, 새로고침, 이동 체크
	function accessExit(){

		//종료
		if (self.screenTop>9000){
			exitRequest();
		}
		//새로고침
		else if(document.readyState == "complete"){
			
		}
		//다른 사이트 이동
		else if(document.readyState == "loading"){
			
		}
		
		return false;
	}

	//브라우저 종료
	function exitRequest(){
		if(window.ActiveXObject){
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}else if(window.XMLHttpRequest){
			xmlHttp = new XMLHttpRequest();
		}
		
		xmlHttp.onreadystatechange = handleStateChange;
		xmlHttp.open("GET","accessLogout.jsp",true);
		xmlHttp.send(null);
		
		return false;
	}

</script>
</head>
<body onload="startRequest()" onunload="accessExit()">
<div id="chatContainer">
	<div id="chatHeader" >
		<img class="chat_ball" alt="포켓볼" src="../chat/image/chat_subject.png">
		현재 접속인원: <%=accessUserCount.size() %>명
		<img class="chat_ball" alt="포켓볼" src="../chat/image/chat_subject.png">
	</div>
	<div id="chatContent">
		<table id="chatTable" >
			<tr>
				<th>아이디</th>
				<th>닉네임</th>
			</tr>
		</table>
		<div id="scrollList">
			<table border="0" cellspacing="1" cellpadding="0" width="100%">
				<tr>
					<td>
					Loading
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>