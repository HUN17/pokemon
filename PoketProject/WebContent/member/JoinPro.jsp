<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.sist.user.MemberVO" %>
<%@ page import="com.sist.user.MemberDAO" %>    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <%-- JoinForm.jsp���� �Է��� ������ �Ѱ� �޾� ó���Ѵ�. --%>
    <% 
        // �ѱ� ������ �����ϱ� ���� ���ڵ� ó��
        request.setCharacterEncoding("euc-kr"); 
    %>
    
    <%-- �ڹٺ� ���� �׼��±� ��� --%>
    <jsp:useBean id="MemberVO" class="com.sist.user.MemberVO" />
    <jsp:setProperty property="*" name="MemberVO"/>    
    
    <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">ȸ������ ������ Ȯ���ϼ���.</font></b>
        <br><br>
        <font color="blue"><%=MemberVO.getNickname() %></font>�� ������ ���ϵ帳�ϴ�.
        <br><br>
        
        <%-- �ڹٺ󿡼� �Էµ� ���� �����Ѵ�. --%>
        <table>
            <tr>
                <td id="title">���̵�</td>
                <td><%=MemberVO.getId() %></td>
            </tr>
                        
            <tr>
                <td id="title">��й�ȣ</td>
                <td><%=MemberVO.getPwd() %></td>
            </tr>
                    
            <tr>
                <td id="title">�г���</td>
                <td><%=MemberVO.getNickname() %></td>
            </tr>
                    
            <tr>
                <td id="title">����</td>
                <td><%=MemberVO.getGender()%></td>
            </tr>
                    
            <tr>
                <td id="title">�̸���</td>
                <td>
                    <%=MemberVO.getEmail()%>
                </td>
            </tr>
                    
            <tr>
                <td id="title">�޴���ȭ</td>
                <td><%=MemberVO.getPhone() %></td>
            </tr>
         
        </table>
        
        <br>
        <input type="button" value="Ȯ��">
    </div>
</body>
</html>
