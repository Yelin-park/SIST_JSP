<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 22. - 오후 12:29:53</title>
</head>
<body>
<h3>ex05.jsp</h3>
<%
	// 4가지 Scope(영역) : page, request, session, application
	// 세션 부서번호 저장
	pageContext.setAttribute("job", "CLEAK"); // page scope에 저장하는 작업 - 해당 페이지에서만 접근/사용 가능
	session.setAttribute("deptno", 10); // session scope에 저장하는 작업
	request.setAttribute("empno", 7369); // request scope에 저장하는 작업 - 하나의 요청이 살아있을 때만 접근/사용 가능
	application.setAttribute("dbcp", "oracle"); // 

%>

<!-- 가져오기 -->
job : <%= pageContext.getAttribute("job") %><br>
deptno : <%= session.getAttribute("deptno") %><br> 
empno : <%= request.getAttribute("empno") %><br>
dbcp : <%= application.getAttribute("dbcp") %><br>

<br>

<a href="ex05_02.jsp">ex05_02.jsp</a> <!-- a 링크 태그 클릭시 새로운 요청이 일어난다. -->

<br>
<br>

<!-- /days07/ex05.htm 요청 -> Ex05_Session.java 서블릿 호출 -> 서블릿 안에서 세션 다루기 -->
<a href="ex05.htm">서블릿 호출 Ex05_Session.java</a>

</body>
</html>