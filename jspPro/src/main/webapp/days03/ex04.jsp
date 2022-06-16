<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 16. - 오전 9:46:55</title>
</head>
<body>
<h3>ex04.jsp</h3>

<div id="logon">
	<form action="ex04_ok.jsp" method="get">
	 아이디 : <input type="text" name="id" value="홍길동"><br>
	 비밀번호 : <input type="password" name="passwd" value="1234"><br>
	 <input type="submit">
	</form>
</div>
<div id="logout">
	<!-- ex04.jsp?id=admin&ok -->
	[${param.id}]님 로그인하였습니다.<br>
	<button>로그아웃</button>
</div>

<script>
	$("#logout").hide();
</script>

<%
	// 로그인을 성공해서 다시 페이지 요청(리다이렉트) = ex04.jsp?id=admin&ok
	// 로그인을 실패해서 다시 페이지 요청(리다이렉트) = ex04.jsp?error
			
	String ok = request.getParameter("ok"); // 요청받을때 받는 파라미터에 ok라는 값이 있니?
	String error = request.getParameter("error");
	
	// alert("로그인 성공")과 같은 경고창을 띄우자 
	if(ok != null){ // 로그인 성공했을 때
%>
<!-- 경고창은 웹 서버에서 띄울 수 없기 때문에 스크립트릿을 끊어서 script 태그 안에 js/jq 코딩 -->
	<script>
		alert("로그인 성공");
		$("#logon").hide();
		$("#logout").show();
	</script>
	[로그인했을 때 사용할 수 있는 기능]<br>
	게시판<br>
	일정관리<br>
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
[로그인 유무와 상관없이 사용할 수 있는 기능]<br>
공지사항<br>
설문조사<br>
</body>
</html>