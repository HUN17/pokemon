<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>¼öÁ¤ ¹× Å»Åğ</title>
<script type="text/javascript">

$(function(){
	$('#update').click(function(){
		var url = "../member/updateForm.jsp";
		var set = "width=700,height=500";
		window.open(url,'',set); 
	});
});

/* $(function(){
	$('#update').click(function(){
		var url = "../member/updateForm.jsp";
		var set = "width=500,height=400";
		window.open(url,'',set); 
	}); */
	
	
</script>
</head>

<body>
    <h1>¼öÁ¤ ¹× Å»Åğ  ÆäÀÌÁö</h1>
    <h2>modify.jsp</h2>
    <p>
    <span id="update">Á¤º¸ ¼öÁ¤</span>
    <a href="deleteForm.jsp">È¸¿ø Å»Åğ</a>
    </p>
</body>
</html>