<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "com.sist.user.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>ȸ������ ����</title>

</head>

<body>
    <h1>ȸ������ ����  ������</h1>
    <h2>updateForm.jsp</h2>
    
    <%
    String id = (String)session.getAttribute("id");
    MemberDAO dao = MemberDAO.newInstance();
    MemberVO vo = dao.getMember(id); 
    %>
    
    <form name="updateform" action="updateForm_ok.jsp" method="post" onSubmit="return checkIt()">
    <table border="1" width="600">
        <tr height="25">
            <td colspan="4" bgcolor="#fffacd">�������� ����</td>
        </tr>
        
        <tr>
            <td height="30" width="25%">����� ID</td>
            <td colspan="3" width="75%">
                    <input type="text" value="<%=vo.getId()%>" readonly name="id">  
            </td>
        </tr>
       
        <tr>
            <td height="30" width="25%">��й�ȣ</td>
            <td colspan="3" width="75%" >
                <input type="password" name="pwd" size="15" maxlength="12" value="<%=vo.getPwd()%>"></input>
            </td>
        </tr>
 
        <tr height="25">
            <td colspan="4" bgcolor="#fffacd" >�������� ����</td>
        </tr>   
               
        <tr>
            <td height="30"  width="25%">�г���</td>
            <td  colspan="3" width="75%">
               <input type="text" value="<%=vo.getNickname()%>" name="nickname">
            </td>
        </tr>
       
       
        <tr>
            <td height="30"  width="25%">����</td>
            <td colspan="3" width="75%">
                 <input type="text" value="<%=vo.getGender()%>" name="gender">
            </td>
        </tr>
        
        <tr>
            <td height="30" width="25%">��ȭ��ȣ</td>
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
        <input type="submit" value="����">
        <input type="button" name="cancel" value="���� ���" onclick="self.close()">
    </form> 
</body>

<script language="JavaScript">
   <!-- 

   function checkIt(){
          if(document.updateform.pw.value != document.updateform.pw2.value || document.updateform.pw.value=="" || document.updateform.pw2.value=="" ){
            alert("joinform : ��й�ȣ�� �����ϰ� �Է��ϼ���.");
            return false;
          }
          if(!document.updateform.tel.value){
              alert("joinform : ��ȭ��ȣ�� �Է����� �����̽��ϴ�.");
              return false;
          }
          if(!document.updateform.email.value){
              alert("joinform : �̸����� �Է����� �����̽��ϴ�.");
              return false;
          }
        }
-->
</script>

</html>