<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
   $('#btn').click(function(){
      var url = "../member/idcheck.jsp";
      var option = "width=250,height=150,toolbar=no,statusbar=no,scrollbars=no"
      window.open(url,"",option);
   });         

   $('#combo').change(function(){
      var data=$('#combo').val();
      $('#site').val(data);
   });
});

function send(){
	var f=document.join_frm;
	if(f.id.value==""){
		alert("ID를 확인하세요.")
		f.id.focus();
		return;
	}
	if(f.pwd.value==""){
		alert("Passwoard를 확인하세요.")
		f.pwd.focus();
		return;
	}	
	if(f.pwd.value != f.pwd1.value){
		alert("Passwoard가 다릅니다.")
		f.pwd.focus();
		return;
	}	
	if(f.nickname.value==""){
		alert("닉네임을 입력하세요.")
		f.nickname.focus();
		return;
	}	
	f.submit();
}
</script>
</head>
<body>
   <center>
      <h3>회원가입</h3>
      <form name="join_frm" action="../member/join_ok.jsp" method="post">
         <table id="table_content">
            <tr height="30">
               <td width="15%" align="right">아이디</td>
               <td width="85%" align="left">
                  <input type="text" size="12" readonly name="id">
                  <input type="button" value="중복체크" id="btn">
               </td>
            </tr>
            <tr height="30">
               <td width="15%" align="right">패스워드</td>
               <td width="85%" align="left">
                  <input type="password" size="12" name="pwd">
                  &nbsp;재입력
                  <input type="password" size="12" name="pwd1">
               </td>
            </tr>         
            <tr height="30">
               <td width="15%" align="right">닉네임</td>
               <td width="85%" align="left">
                  <input type="text" size="12" name="nickname">
               </td>
            </tr>      
            <tr height="30">
               <td width="15%" align="right">성별</td>
               <td width="85%" align="left">
                  <input type="radio" name="gender" value="남자" checked>남자
                  <input type="radio" name="gender" value="여자">여자
               </td>
            </tr>   
            
            <tr height="30">
               <td width="15%" align="right">핸드폰</td>
               <td width="85%" align="left">
                  <select name="phone">
                     <option>010</option>
                     <option>02</option>
                     <option>031</option>
                  </select>
                  <input type="text" size="12" name="phone1">
               </td>
            </tr>   
            <tr height="30">
               <td width="15%" align="right">이메일</td>
               <td width="85%" align="left">
                  <input type="text" size="10" name="email">
               </td>
            </tr>   
            
            <tr>
               <td colspan="2" align="center">
                  <input type="button" value="작성" onclick="send()">
                  <input type="button" value="취소" onclick="self.close();">
               </td>
            </tr>                                                            
         </table>
      </form>
   </center>
</body>
</html>