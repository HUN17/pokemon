<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "com.sist.user.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>�����Ϸ�</title>
</head>

<body>
    <h1>member update ������</h1>
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
            <font size="+1" ><b>ȸ�������� �����Ǿ����ϴ�.</b></font>
        </td>
    </tr>
    
    <tr>
        <td align="center"> 
            <p>�Է��Ͻ� ������ ������ �Ϸ�Ǿ����ϴ�.</p>
        </td>
    </tr>
    
    <tr>
        <td align="center"> 
            <form>
                <input type="button" value="�ݱ�" onclick="self.close();">
            </form>
           <!--  5���Ŀ� �������� �̵��մϴ�.
            <meta http-equiv="Refresh" content="5;url=main.jsp" > -->
        </td>
    </tr>
</table>
</body>
</html>