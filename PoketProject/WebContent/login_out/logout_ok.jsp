
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
		
	//동일한 세션아이디 접속자 리스트에서 제거
		if(sessionId.equals(session.getId())){
			System.out.println(tmpMap.get("id")+"logouted.");
			
			accessUserCount.remove(i);
		}
	
	}
	
	//개별 세션 정보 삭제
	session.removeAttribute("id");
	session.removeAttribute("name");

	//session.invalidate();  //전체 세션 종료
	response.sendRedirect("../main/main.jsp");
%>