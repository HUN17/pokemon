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
		alert("ID�� Ȯ���ϼ���.")
		f.id.focus();
		return;
	}
	if(f.pwd.value==""){
		alert("Passwoard�� Ȯ���ϼ���.")
		f.pwd.focus();
		return;
	}	
	if(f.pwd.value != f.pwd1.value){
		alert("Passwoard�� �ٸ��ϴ�.")
		f.pwd.focus();
		return;
	}	
	if(f.nickname.value==""){
		alert("�г����� �Է��ϼ���.")
		f.nickname.focus();
		return;
	}	
	f.submit();
}
</script>
</head>
<body>
   <center>
      <h3>ȸ������</h3>
      <form name="join_frm" action="../member/join_ok.jsp" method="post">
         <table id="table_content">
            <tr height="30">
               <td width="15%" align="right">���̵�</td>
               <td width="85%" align="left">
                  <input type="text" size="12" readonly name="id">
                  <input type="button" value="�ߺ�üũ" id="btn">
               </td>
            </tr>
            <tr height="30">
               <td width="15%" align="right">�н�����</td>
               <td width="85%" align="left">
                  <input type="password" size="12" name="pwd">
                  &nbsp;���Է�
                  <input type="password" size="12" name="pwd1">
               </td>
            </tr>         
            <tr height="30">
               <td width="15%" align="right">�г���</td>
               <td width="85%" align="left">
                  <input type="text" size="12" name="nickname">
               </td>
            </tr>      
            <tr height="30">
               <td width="15%" align="right">����</td>
               <td width="85%" align="left">
                  <input type="radio" name="gender" value="����" checked>����
                  <input type="radio" name="gender" value="����">����
               </td>
            </tr>   
            
            <tr height="30">
               <td width="15%" align="right">�ڵ���</td>
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
               <td width="15%" align="right">�̸���</td>
               <td width="85%" align="left">
                  <input type="text" size="10" name="email">@
                  <input type="text" size="15" id="site" name="email1">
                  <select id="combo">
                     <option>�����Է�</option>
                     <option>gmail.com</option>
                     <option>naver.com</option>
                     <option>daum.net</option>
                     <option>nate.com</option>
                  </select>
               </td>
            </tr>   
            <tr height="30">
               <td width="15%" align="right">���ŵ���</td>
               <td width="85%" align="left">
                  <input type="radio" name="recv" value="y" checked>����
                  <input type="radio" name="recv" value="n">�ź�
               </td>
            </tr>            
            
            <tr>
               <td colspan="2" align="center">
                  <input type="button" value="�ۼ�" onclick="send()">
                  <input type="button" value="���" onclick="self.close();">
               </td>
            </tr>                                                            
         </table>
      </form>
   </center>
</body>
</html>