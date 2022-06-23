<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 23. - 오전 9:04:37</title>
</head>
<body>
<h3>ex09_05.jsp</h3>
<pre>
	EL 쿠키 저장/읽기
</pre>
<%
	Cookie c = Cookies.createCookie("user", "admin");
	response.addCookie(c);
	
	c = Cookies.createCookie("id", "hong");
	response.addCookie(c);
	
	c = Cookies.createCookie("age", "10");
	response.addCookie(c);
%>
<!-- 쿠키 생성 후 아래 링크 태그 클릭시 이동 -->
<a href="ex09_05_ok.jsp">ex09_05_ok.jsp</a>
</body>
</html>