<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// Scriptlet
	// JSP 기본 객체 - request(요청), response(응답), session 등등
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 14. - 오후 2:47:51</title>
</head>
<body>
<h3>ex02_ok.jsp</h3>

<%--
전송된 name : <%= name %><br>
전송된 age : <%= age %><br>
--%>

<%--
	EL(표현 언어) 문법  :  ${}
	? 뒤에 날아오는 값을 받아오는 방법으로 param 사용
	EL안에 param 기본객체가 있음
--%>

name : ${param.name}<br>
age : ${param.age}<br>

<pre>
	JSP == Java Server Page
	자바 웹 기술은 2가지가 있다.
	1) 서블릿(Servlet)
	2) JSP(서블릿 다음에 나온 것)
	
			[웹 기술]
	ms사     asp
	c#(.net) aspx
			 php
			 등등
			 
	http://localhost/jspPro/days01/ex02_ok.jsp?name=%ED%99%8D%EA%B8%B8%EB%8F%99&age=20
	http://localhost/jspPro/days01/ex02_ok.jsp
	?	=> ? 뒤에 있는 것을 쿼리스트링(QueryString)이라고 함(요청할 때 넘어오는 값)
	name=%ED%99%8D%EA%B8%B8%EB%8F%99	=> 한글 -> %16진수값 변경
	&
	age=20
</pre>
</body>
</html>