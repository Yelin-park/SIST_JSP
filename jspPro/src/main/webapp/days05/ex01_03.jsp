<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <!-- 여기 안에 errorPage 속성을 주어도 됨 -->
<%@ page errorPage="/error/viewErrormessage.jsp" %> <!-- 에러가 발생하면 error 폴더 안에 viewErrormessage.jsp 페이지를 보여줌 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 20. - 오전 9:13:07</title>
</head>
<body>
<h3>ex01_03.jsp - 예외 처리를 에러 페이지로</h3>

<%
	// ex01_02.jsp?name=hong
	// HTTP 상태 500 - 내부 서버 오류 발생
	// 파라미터 값이 넘어오지 않았기 때문에

	String pname = null;
	pname = request.getParameter("name").toUpperCase();
%>

> name = <%= pname %><br>
</body>
</html>