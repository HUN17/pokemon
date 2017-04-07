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
 <%-- JoinForm.jsp에서 입력한 정보를 넘겨 받아 처리한다. --%>
    <% 
        // 한글 깨짐을 방지하기 위한 인코딩 처리
        request.setCharacterEncoding("euc-kr"); 
    %>
    
    <%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="MemberVO" class="com.sist.user.MemberVO" />
    <jsp:setProperty property="*" name="MemberVO"/>    
    
    <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">회원가입 정보를 확인하세요.</font></b>
        <br><br>
        <font color="blue"><%=MemberVO.getNickname() %></font>님 가입을 축하드립니다.
        <br><br>
        
        <%-- 자바빈에서 입력된 값을 추출한다. --%>
        <table>
            <tr>
                <td id="title">아이디</td>
                <td><%=MemberVO.getId() %></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%=MemberVO.getPwd() %></td>
            </tr>
                    
            <tr>
                <td id="title">닉네임</td>
                <td><%=MemberVO.getNickname() %></td>
            </tr>
                    
            <tr>
                <td id="title">성별</td>
                <td><%=MemberVO.getGender()%></td>
            </tr>
                    
            <tr>
                <td id="title">이메일</td>
                <td>
                    <%=MemberVO.getEmail() %>@<%=MemberVO.getEmail1() %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">휴대전화</td>
                <td><%=MemberVO.getPhone() %></td>
            </tr>
         
        </table>
        
        <br>
        <input type="button" value="확인">
    </div>
</body>
</html>
