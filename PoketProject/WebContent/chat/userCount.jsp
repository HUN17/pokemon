<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="accessUserCount" class="java.util.ArrayList" scope="application"/>

<%
	//������ ����Ʈ üũ
	Map tmpMap = null;
	String sessionId = null;
	
	for(int i=0; i<accessUserCount.size(); i++){
		tmpMap = (Map)accessUserCount.get(i);
		sessionId = String.valueOf(tmpMap.get("sessionId"));
		
		if(sessionId.equals(session.getId())){
			tmpMap.put("accessTime", System.currentTimeMillis());
			accessUserCount.set(i,tmpMap);
		}
		
		//30�� �̻� ���� ���� ��� ������ ����Ʈ���� ����
		//1. �������� ���� ���
		if((System.currentTimeMillis()-Long.parseLong(String.valueOf(tmpMap.get("accessTime")))) > 30000){
			System.out.println("������ ���� ���� ����");
			accessUserCount.remove(i);
		}
		
	}
	
	String tmpUserId = null;
	String tmpUserName = null;
	String tmpSessionId = null;
	String tmpMeTxt = "";
	
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="0" width="570" align="center">
<%
for(int i=0; i<accessUserCount.size(); i++){
	tmpMap = (Map)accessUserCount.get(i);
	tmpUserId = String.valueOf(tmpMap.get("id"));
	tmpUserName = String.valueOf(tmpMap.get("name"));
	tmpSessionId = String.valueOf(tmpMap.get("sessionId"));
	tmpMeTxt = "";

	if(session.getId().equals(tmpSessionId)){
		tmpMeTxt ="[��]";
	}
%>
		<tr>
			<td align="center" width="50%"><%=tmpUserId%></td>
			<td align="center" width="50%"><%=tmpUserName %>&nbsp;<%=tmpMeTxt %></td>
		</tr>
<%
}
%>
	</table>
</body>
</html>