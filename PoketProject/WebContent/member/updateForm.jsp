<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "com.sist.user.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>회원정보 수정</title>

</head>

<body>
    <h1>회원정보 수정  페이지</h1>
    <h2>updateForm.jsp</h2>
    
    <%
    String id = (String)session.getAttribute("id");
    MemberDAO dao = MemberDAO.newInstance();
    MemberVO vo = dao.getMember(id); 
    %>
    
    <form name="updateform" action="updateForm_ok.jsp" method="post" onSubmit="return checkIt()">
    <table border="1" width="600">
        <tr height="25">
            <td colspan="4" bgcolor="#fffacd">계정정보 수정</td>
        </tr>
        
        <tr>
            <td height="30" width="25%">사용자 ID</td>
            <td colspan="3" width="75%">
                    <input type="text" value="<%=vo.getId()%>" readonly name="id">  
            </td>
        </tr>
       
        <tr>
            <td height="30" width="25%">비밀번호</td>
            <td colspan="3" width="75%" >
                <input type="password" name="pwd" size="15" maxlength="12" value="<%=vo.getPwd()%>"></input>
            </td>
        </tr>
 
        <tr height="25">
            <td colspan="4" bgcolor="#fffacd" >개인정보 수정</td>
        </tr>   
               
        <tr>
            <td height="30"  width="25%">닉네임</td>
            <td  colspan="3" width="75%">
               <input type="text" value="<%=vo.getNickname()%>" name="nickname">
            </td>
        </tr>
       
       
        <tr>
            <td height="30"  width="25%">성별</td>
            <td colspan="3" width="75%">
                 <input type="text" value="<%=vo.getGender()%>" name="gender">
            </td>
        </tr>
        
        <tr>
            <td height="30" width="25%">전화번호</td>
            <td width="10%">
            	<input type="text" name="phone"  maxlength="30" value="<%=vo.getPhone()%>">
                
            </td> 
            <td width="90%" colspan="2">
            	<input type="text" name="phone1"  maxlength="30" value="<%=vo.getPhone1()%>">
            </td>
        </tr>

       <tr>
            <td height="30" width="25%">E-Mail</td>
            <td width="25%">
            	<input type="text" name="email" maxlength="30" value="<%=vo.getEmail()%>">    
            </td> 
            <td width="5%">
            	&nbsp;@&nbsp;  
            </td>	
            <td width="35%">
            	<input type="text" name="email1" maxlength="30" value="<%=vo.getEmail1()%>">  
            </td>	
        </tr>
    </table>
        <input type="submit" value="수정">
        <input type="button" name="cancel" value="변경 취소" onclick="self.close()">
    </form> 
</body>

<script language="JavaScript">
   <!-- 

   function checkIt(){
          if(document.updateform.pw.value != document.updateform.pw2.value || document.updateform.pw.value=="" || document.updateform.pw2.value=="" ){
            alert("joinform : 비밀번호를 동일하게 입력하세요.");
            return false;
          }
          if(!document.updateform.tel.value){
              alert("joinform : 전화번호를 입력하지 않으셨습니다.");
              return false;
          }
          if(!document.updateform.email.value){
              alert("joinform : 이메일을 입력하지 않으셨습니다.");
              return false;
          }
        }
-->
</script>

</html>