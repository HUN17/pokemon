<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.board.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String no = request.getParameter("no");
	String pwd = request.getParameter("pwd");
	
	qnaVO vo = new qnaVO();
	vo.setNo(Integer.parseInt(no));
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
	//DB연동
	qnaDAO dao = qnaDAO.newInstance();
	boolean bCheck = dao.qboardUpdate(vo);
		
		if(bCheck==false){
%>
		<script>
			alert("비밀번호가 틀립니다.\n다시 입력해주세요");
			history.back();
		</script>
<%
	} else {
		response.sendRedirect("../main/main.jsp?mode=21&no="+no);
	}
%>