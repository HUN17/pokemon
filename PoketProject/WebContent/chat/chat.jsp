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

var userId ="<%=id%>"; //���̵�

/* 	//��ȭ ������
	function sendTalk(){
		var obj = document.getElementById("talk_input");

		if(obj.value!=""){
			addTalk(obj.value);	//��ȭ���� �߰�
			obj.value="";	//�ؽ�Ʈ�ʵ� �ʱ�ȭ
			obj.focus();	//Ŀ��
		}
	};

	//����Ű�� ��ȭ ������
	function enterSend(){
			if(window.event.keyCode==13) sendTalk();
	};

	//��ȭ ����
	function addTalk(content){
		var obj = document.getElementById("talk_view");
		
		var line = "[" + userId + "] : " + content+"<br>";	//�̸�: ����
			obj.innerHTML+=line;	//���� �߰�
			obj.scrollTop=obj.scrollHeight;	//��ũ�� �ڵ� ����
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

		//5�ʸ��� ����
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

	//�������� ����, ���ΰ�ħ, �̵� üũ
	function accessExit(){

		//����
		if (self.screenTop>9000){
			exitRequest();
		}
		//���ΰ�ħ
		else if(document.readyState == "complete"){
			
		}
		//�ٸ� ����Ʈ �̵�
		else if(document.readyState == "loading"){
			
		}
		
		return false;
	}

	//������ ����
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
		<img class="chat_ball" alt="���Ϻ�" src="../chat/image/chat_subject.png">
		���� �����ο�: <%=accessUserCount.size() %>��
		<img class="chat_ball" alt="���Ϻ�" src="../chat/image/chat_subject.png">
	</div>
	<div id="chatContent">
		<table id="chatTable" >
			<tr>
				<th>���̵�</th>
				<th>�г���</th>
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