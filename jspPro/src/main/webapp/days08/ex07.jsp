<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 23. - 오전 11:49:43</title>
</head>
<body>
<h3>ex07.jsp</h3>
<pre>
	p333 함수
	JSTL + EL : 함수
</pre>
<%
	String msg = "<b>Message</b>입니다.";
	// int len = msg.length(); // 문자열 길이 자바 코딩으로 가져올 수도 있고..
	// msg.toUpperCase();
%>
<c:set value="<%= msg %>" var="msg"></c:set>
${msg}<br>
<!-- fn을 사용하여 함수 사용 가능 -->
문자열 길이 : ${fn:length(msg) }<br>
대문자변환 : ${fn:toUpperCase(msg) }<br>
</body>
</html>