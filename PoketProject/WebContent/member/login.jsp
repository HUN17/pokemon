<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<!-- MDB cnd -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="resource/mdb.css">
<link rel="stylesheet" href="resource/mdb.min.css">

<!-- 아이콘 나오는 cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>

<!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>

<link rel="stylesheet" type="text/css" href="../member/login.css">
<script type="text/javascript">
/* $(function(){
	$('#join').click(function(){
		var url = "../member/join.jsp";
		var set = "width=500,height=400";
		window.open(url,'',set); 
	});
}); */
$(function(){
	   $('#btn').click(function(){
	      var url = "../member/idcheck.jsp";
	      var option = "width=250,height=150,toolbar=no,statusbar=no,scrollbars=no";
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
<style type="text/css">
	input[type="submit"]{
		background-color: #FF3636;
		width:455px;
		height:50px;
		border: none;
		color: white;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		font-weight: bold;
		-webkit-transition-duration: 0.4s;
		transition-duration: 0.4s;
		cursor: pointer;
	}
	
	input[type="submit"]:HOVER {
		background-color: white;
		color: black;
		border: 2px solid #FF3636;
}
</style>
</head>
<body>
	<center>
		<img alt="포사모 로그인" src="../image/login_out_image/login_logo.png" width="450">
		<form action="../member/login_ok.jsp" method="post">
			<table id="table_login" width="500">
				<tr>
					<td width="450" height="100" align="center">
						<input class="box" type="text" name="id" placeholder="아이디" style="width:450px; height:50px;">
					</td>
				</tr>
				<tr>
					<td width="450" height="40" align="center">
						<input class="box" type="password" name="pwd" placeholder="패스워드" style="width:450px; height:50px;">
					</td>
				</tr>
				<tr>
					<td align="center" height="100">
						<input type="submit" value="로그인">
					</td>
				</tr>
				<tr>
					<td id="join" align="right">
							<a data-toggle="modal" data-target="#modal-login">회원가입</a>
					</td>
				</tr>
			</table>
		</form>
		<!-- 회원가입 폼 -->
		<div class="modal fade modal-ext" id="modal-login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<!--Content-->
				<form name="join_frm" action="../member/join_ok.jsp" method="post" class="form-inline">
					<div class="modal-content">
						<!--Header-->
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<center>
								<h2 class="w-100">
									Sign Up
								</h2>
							</center>
						</div>
						<!--아이디,중복체크 버튼-->
						<div class="modal-body">
							<div class="md-form" align="left">
								<i class="fa fa-user prefix"></i> 
								<input type="text" readonly name="id" class="form-control" placeholder="Your ID" style="width: 40%">
								<input type="button" value="중복체크" class="btn btn-warning btn-sm" id="btn" style="width: 20%">
							</div>
							<!-- 패스워드 -->
							<div class="md-form" align="left">
								<i class="fa fa-lock prefix"></i> 
								<input type="password" name="pwd" class="form-control" placeholder="Your password" style="width: 40%"> 
								<input type="password" name="pwd1" class="form-control" placeholder="Confirm password" style="width: 40%; margin-right: 10px;">
							</div>
							<!-- 닉네임 -->
							<div class="md-form" align="left">
								<input type="text" name="nickname" class="form-control" placeholder="Your nickname" style="margin-left: 50px; width: 80%">
							</div>
								<!-- 성별체크 -->
								  <label class="checkbox-inline" style="margin-left: 50px; font-size: 16px">						  
  									<input type="checkbox" id="inlineCheckbox1" name="gender" value="남자" checked="checked">
  									남자
									</label>
									<label class="checkbox-inline" style="font-size: 16px;">
									  <input type="checkbox" id="inlineCheckbox2" name="gender" value="여자" >
									  여자
									</label>
									
									<!-- phone -->
									<i class="fa fa-phone" style="font-size:35px; margin-left:110px;"></i> 
									<select class="form-control" style="height: 50px; margin: 10px;" name="phone">
										<option>010</option>
										<option>02</option>
										<option>031</option>
										<input type="text" name="phone1" class="form-control" placeholder="Your Phone" style="width: 30%">
									</select>
									
								<!-- email -->
								<div class="md-form" align="left">
								
									 <input type="text" name="email" class="form-control" placeholder="Your Email" style="margin-left: 50px; width: 80%">
								
								</div>
							</form>
							
							<div class="text-center">
								<button class="btn btn-warning btn-lg" onclick="send()">Sign Up</button>
							</div>
						</div>
				</form>

				<!--Footer-->
				<div class="modal-footer">
					<div class="options text-left" style="font-size: 15px;">
					</div>
					<button type="button" class="btn btn-danger ml-auto" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!--Content-->
	</center>
</body>
</html>


