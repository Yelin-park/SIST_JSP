<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 20. - 오전 9:36:05</title>
</head>
<body>
<h3>ex01_05.jsp</h3>

<%
	// ?name 
	// NullPointException 발생
	String pname = request.getParameter("name").toUpperCase();
%>
</body>
</html>