<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 17. - 오후 3:18:45</title>
</head>
<body>
<h3>ex05_03.jsp</h3>

<pre>
	[pageContext 객체] - JSP 페이지에 대한 정보 저장 객체
	1. 기능
	 - JSP 페이지의 기본 객체를 얻어올 수 있다. -> request, response, out 등등
	 - 속성 처리 기능
	 - 페이지의 흐름 제어(7장)
	 - 에러 데이터 구하기(6장)
	 
	 pageContext를 직접 사용하는 경우는 드물다.
	 
	 p120 pageContext가 제공하는 기본 객체 접근 메서드 표5.3
</pre>

<%
	// request.getParameter("name";)
	pageContext.getRequest().getParameter("name"); // pageContext.getRequest() == request
	
	pageContext.getResponse(); // == response
	pageContext.getOut(); // == out
	pageContext.getSession(); // == session
%>

<%= request == pageContext.getRequest() %> <!-- 결과 : true -->
</body>
</html>