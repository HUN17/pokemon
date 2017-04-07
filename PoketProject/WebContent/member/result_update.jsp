<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "com.sist.user.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>수정완료</title>
</head>

<body>
    <h1>member update 페이지</h1>
    <h2>updateMember.jsp</h2>
    <% request.setCharacterEncoding("euc-kr");%>
    
    <jsp:useBean id="dto" class="com.sist.user.MemberVO">
        <jsp:setProperty name="dto" property="*" />
    </jsp:useBean>
    
    <%
    String id = (String)session.getAttribute("memId");
    dto.setId(id);
    MemberDAO dao = MemberDAO.newInstance();
    dao.updateMember(dto);
    //member = dto    manager - dao
     %>

<table width="270" border="1" cellspacing="0" cellpadding="5" align="center">
    <tr> 
        <td height="39" align="center">
            <font size="+1" ><b>회원정보가 수정되었습니다.</b></font>
        </td>
    </tr>
    
    <tr>
        <td align="center"> 
            <p>입력하신 내용대로 수정이 완료되었습니다.</p>
        </td>
    </tr>
    
    <tr>
        <td align="center"> 
            <form>
                <input type="button" value="닫기" onclick="self.close();">
            </form>
           <!--  5초후에 메인으로 이동합니다.
            <meta http-equiv="Refresh" content="5;url=main.jsp" > -->
        </td>
    </tr>
</table>
</body>
</html>