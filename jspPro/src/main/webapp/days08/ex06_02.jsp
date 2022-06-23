<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 23. - 오전 11:35:21</title>
</head>
<body>
<h3>ex06_02.jsp</h3>
<pre>
	p327 날짜 출력, 파싱 - fmt:formatDate, fmt:parseDate
</pre>
<%
	Date now = new Date();
%>
now : <%= now %><br>
<hr>

<!-- EL 표현언어로 사용하기 위해서 변수로 담음 -->
<c:set value="<%= now %>" var="now"></c:set>
<li><fmt:formatDate value="${now }" dateStyle="default"/> </li>
<li><fmt:formatDate value="${now }" dateStyle="full"/> </li>
<li><fmt:formatDate value="${now }" dateStyle="short"/> </li>
<li><fmt:formatDate value="${now }" dateStyle="long"/> </li>
<li><fmt:formatDate value="${now }" dateStyle="medium"/> </li>

<li><fmt:formatDate value="${now }" pattern="yyyy년 MM월 dd일 이지롱"/> </li>

<hr>
<li><fmt:formatDate value="${now }" type="date"/> </li>
<li><fmt:formatDate value="${now }" type="time"/> </li>
<li><fmt:formatDate value="${now }" type="both"/> </li>


<hr>
<%
	String strNow = "2022년 06월 22일";
	// 문자열 -> 날짜형 변환
	// 자바코딩
	// 1. Date now = new Date(2022-1900, 6-1, 22);
	
	// 2.
	// String pattern = "yyyy년 MM월 dd일";
	// SimpleDateFormat sdf = new SimpleDateFormat(pattern);
	// Date now = sdf.parse(strNow);
	
	// 3.
	// String pattern = "yyyy년 MM월 dd일";
	// DateTimeFormatter f = DateTimeFormatter.ofPattern(pattern);
	// LocalDate now = LocalDate.parse(strNow, f);
%>
<fmt:parseDate value="<%= strNow %>" pattern="yyyy년 MM월 dd일" var="now"></fmt:parseDate>
now : ${now }<br>
</body>
</html>