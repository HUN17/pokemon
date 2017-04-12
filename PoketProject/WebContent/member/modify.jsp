<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.user.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String id = (String)session.getAttribute("id");
    MemberDAO dao = MemberDAO.newInstance();
    MemberVO vo = dao.getMember(id); 
%>
    
<html>
<head>
    <title>수정 및 탈퇴</title>
<script type="text/javascript">

/* $(function(){
	$('#update').click(function(){
		var url = "../member/updateForm.jsp";
		var set = "width=700,height=500";
		window.open(url,'',set); 
	});
});  */

/* $(function(){
	$('#update').click(function(){
		var url = "../member/updateForm.jsp";
		var set = "width=500,height=400";
		window.open(url,'',set); 
	}); */
	
	
</script>
</head>

<body>
    <center>
    <h3>마이페이지</h3>
    <form name="updateform" action="../member/updateForm_ok.jsp" method="post" onSubmit="return checkIt()" class="form-inline">
    <table border="0" width="600" class="table" style="width: 40%">
        <tr height="25">
            <td colspan="4" bgcolor="#fffacd">계정정보 수정</td>
        </tr>
        
        <tr>
            <td height="30" width="25%">사용자 ID</td>
            <td colspan="3" width="75%">
                    <input type="text" value="<%=vo.getId()%>" readonly name="id" class="form-control" style="width: 40%">  
            </td>
        </tr>
       
        <tr>
            <td height="30" width="25%">비밀번호</td>
            <td colspan="3" width="75%" >
                <input type="password" name="pwd" size="15" maxlength="12" value="<%=vo.getPwd()%>" class="form-control" style="width: 40%"></input>
            </td>
        </tr>
 
        <tr height="25">
            <td colspan="4" bgcolor="#fffacd" >개인정보 수정</td>
        </tr>   
               
        <tr>
            <td height="30"  width="25%">닉네임</td>
            <td  colspan="3" width="75%">
               <input type="text" value="<%=vo.getNickname()%>" name="nickname" class="form-control" style="width: 40%">
            </td>
        </tr>
       
       
        <tr>
            <td height="30"  width="25%">성별</td>
            <td colspan="3" width="75%">
                 <input type="text" value="<%=vo.getGender()%>"  name="gender" class="form-control" style="width: 40%">
            </td>
        </tr>
        
        <tr>
            <td height="30" width="25%">전화번호</td>
            <td  colspan="3" width="75%">
               <input type="text" name="phone" value="<%=vo.getPhone()%>"  maxlength="30" class="form-control" style="width: 20%">
               <input type="text" name="phone1" value="<%=vo.getPhone1()%>" maxlength="30" class="form-control" style="width: 20%">         
            </td> 
            
        </tr>

       <tr>
            <td height="30" width="25%">E-Mail</td>
            <td width="75%">
               <input type="text" name="email" value="<%=vo.getEmail()%>" maxlength="30" class="form-control">   
               &nbsp;@&nbsp;
               <input type="text" name="email1" value="<%=vo.getEmail1()%>" maxlength="30" class="form-control" >   
            </td>    
        </tr>
    </table>
  
   <button type="submit" class="btn btn-default">
        수정<span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>
   </button>
        <input type="button" name="cancel" value="변경 취소" onclick="self.close()"  class="btn btn-default">
        
           <a href="../login_out/logout.jsp">
           	<input type="button" name="logout" value="로그아웃"  class="btn btn-default">
           </a>
               
          <input type="button" name="cancel" value="포인트 추가" onclick="self.close()"  class="btn btn-default">
    </form> 
    </center>
</body>
</html>