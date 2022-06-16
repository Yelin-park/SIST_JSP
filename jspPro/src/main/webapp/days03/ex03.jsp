<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 16. - 오전 9:27:59</title>
</head>
<body>
<h3>ex03.jsp</h3>

<%
	// 로그인을 성공해서 다시 페이지 요청(리다이렉트) = ex03.jsp?id=admin&ok
	// 로그인을 실패해서 다시 페이지 요청(리다이렉트) = ex03.jsp?error
			
	String ok = request.getParameter("ok"); // 요청받을때 받는 파라미터에 ok라는 값이 있니?
	String error = request.getParameter("error");
	
	// alert("로그인 성공")과 같은 경고창을 띄우자 
	if(ok != null){ // 로그인 성공했을 때
%>
<!-- 경고창은 웹 서버에서 띄울 수 없기 때문에 스크립트릿을 끊어서 script 태그 안에 js/jq 코딩 -->
	<script>
		alert("로그인 성공");
	</script>
<%
	}else if(error != null) { // 로그인 실패했을 때
%>
	<script>
		$(function(){
			alert("로그인 실패");
			$(":text").eq(0)
			  		  .focus().select();
		});
	</script>
<%
	}
%>

<form action="ex03_ok.jsp" method="get">
 아이디 : <input type="text" name="id" value="admin"><br>
 비밀번호 : <input type="password" name="passwd" value="1234"><br>
 <input type="submit">
</form>

</body>
</html>