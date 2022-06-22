<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 22. - 오후 3:37:21</title>
</head>
<body>
<h3>ex09_02.jsp</h3>
<%
	// JSP 4가지 영역(scope)에 저장이 되어져 있어야 EL 사용 가능
	request.setAttribute("title", "JSP 프로그래밍");
%>

<!-- p262 EL 3.0 version 부터 EL 문자열 연결 연산자 : +=  -->
${"제목 : " += title }<br>

<hr>
<!-- p264 세미콜론 연산자 - A ; B이면 A는 출력하지 않고 B만 출력함 -->
${1 + 1; 10 + 10 }<br>

<hr>
<!-- p265 할당(대입)연산자 - 변수 var1에 10이라는 값을 할당하고 var1을 출력하겠다. -->
${var1 = 10 }<br>

<hr>
<!-- p266 연산자 우선 순위가 있다. -->
</body>
</html>