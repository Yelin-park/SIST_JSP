<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %><!-- 에러를 처리해주는 페이지이다 라는 속성을 주어야함 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 20. - 오전 9:17:45</title>
</head>
<body>
<h3>viewErrormessage.jsp</h3>
요청 처리 과정에서 에러가 발생했습니다.<br>
빠른 시간 내에 문제를 해결하도록 하겠습니다.

<p>
	<!-- exception 기본 객체를 사용하여 아래와 같이 타입과 메시지를 출력가능  -->
	에러 타입 : <%= exception.getClass().getName() %><br>
	에러 메시지 : <%= exception.getMessage() %><br>
</p>
</body>
</html>