<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 23. - 오전 10:18:41</title>
</head>
<body>
<h3>ex05.jsp - 코어 흐름제어(if, forEach, choose, forTokens)</h3>
<!--
	?num=10 이렇게 파라미터 값으로 넘어와야함 
	넘어오는 파라미터 값이 짝수/홀수 출력
-->
<c:set var="num" value="${param.num }"></c:set>
 <c:if test="${num % 2 == 0 }">짝수</c:if>
 <c:if test="${num % 2 != 0 }">홀수</c:if>
 
<hr />
name = ${param.name }<br> 
age = ${param.age }
</body>
</html>