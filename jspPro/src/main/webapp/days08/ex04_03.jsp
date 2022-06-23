<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 23. - 오전 10:12:52</title>
</head>
<body>
<h3>ex04_02.jsp</h3>

<%
	Map<String, String> map = new HashMap<>();
	map.put("id", "admin");
	map.put("passwd", "1234");
%>

<c:set var="m" value="<%= map %>"></c:set>
<!-- map 객체의 key 값으로 얻어올 수 있다. -->
m.id = ${m.id }<br>
m.passwd = ${m.passwd }<br>

<!-- map.put("name", "hong") 엔트리를 맵에 추가하기 -->
<!-- target= < %= map %> 대신에 ${m} 이라고 해도 됨 -->
<c:set target="<%= map %>" property="name" value="hong"></c:set>
m.name = ${m.name }<br>

<c:set target="${m }" property="age" value="20"></c:set>
m.age = ${m.age }<br>
</body>
</html>