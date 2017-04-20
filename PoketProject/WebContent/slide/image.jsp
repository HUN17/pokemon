<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="../main/js/jquery.innerfade.js"></script>
<script>
        $(document).ready(function () {
            // innerfade 플러그인을 적용합니다.
            $('#inner-fade').innerfade({
                animationtype: 'fade',
                speed: 750,
                timeout: 4000,
                type: 'random',
                containerheight: '350px'
            });
        });
</script>
</head>
<body>
     
        <div id="inner-fade">
	        <img class="slideImg" src="../slide/img/1.png" />
	        <img class="slideImg" src="../slide/img/2.png" />
	        <img class="slideImg" src="../slide/img/3.jpg" />
	        <img class="slideImg" src="../slide/img/4.png" />
		</div>

</body>
</html>