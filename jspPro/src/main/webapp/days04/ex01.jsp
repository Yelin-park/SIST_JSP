<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 16. - 오후 11:58:32</title>
</head>
<body>
<h3>ex01.jsp</h3>

<pre>
	1. test 문제 풀이
	2. p98 Chapter 04 jsp 처리 과정
	
ex01.jsp -> TestDeptEmp2(서블릿) 호출 -> 포워딩 되어져서 -> ex01_forward.jsp
</pre>

<%
	String contextPath = request.getContextPath();
%>

<a href="<%= contextPath %>/test/test00.htm">test00.htm</a>
<br>
1. 서블릿 TestDeptEmp.java 생성
2. 서블릿을 거쳐서 포워딩 되어질 때 ex01_forward.jsp 이 파일로
</body>
</html>