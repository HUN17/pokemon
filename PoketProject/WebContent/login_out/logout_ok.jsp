
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*"%>
<jsp:useBean id="accessUserCount" class="java.util.ArrayList" scope="application"/>
<%
	Map tmpMap = null;
	String sessionId = null;
	
	for(int i=0; i<accessUserCount.size(); i++){
		tmpMap = (Map)accessUserCount.get(i);
		
		sessionId = String.valueOf(tmpMap.get("sessionId"));
		
	//������ ���Ǿ��̵� ������ ����Ʈ���� ����
		if(sessionId.equals(session.getId())){
			System.out.println(tmpMap.get("id")+"logouted.");
			
			accessUserCount.remove(i);
		}
	
	}
	
	//���� ���� ���� ����
	session.removeAttribute("id");
	session.removeAttribute("name");

	//session.invalidate();  //��ü ���� ����
	response.sendRedirect("../main/main.jsp");
%>