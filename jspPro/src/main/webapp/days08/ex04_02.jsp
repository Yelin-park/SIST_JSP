<%@page import="days02.DeptDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 23. - 오전 9:56:18</title>
</head>
<body>
<h3>ex04_02.jsp</h3>

<pre>
	target 속성 : 프로퍼티 값을 설정할 대상 객체 지정
				 자바빈, 맵, 표현식, EL을 사용할 수 있음
	property 속성 : 설정할 프로퍼티의 이름 지정
</pre>

<%
	// DeptDTO days02 패키지
	DeptDTO dto = new DeptDTO(10, "QC", "SEOUL");
%>

<c:set var="dto2" value="${dto }"></c:set>
deptno : ${dto2.deptno }<br> 
dname : ${dto2.dname }<br>
loc : ${dto2.loc }<br>

<c:set var="dto2" value="<%= dto %>"></c:set>
deptno : ${dto2.deptno }<br> 
dname : ${dto2.dname }<br>
loc : ${dto2.loc }<br>

<!-- deptbo : 10번 -> 50번 수정 -->
<!--
	target - dto2라는 변수의
	property - deptno를
	value - 50으로 바꾸겠다.
-->
<c:set target="${dto2 }" property="deptno" value="50"></c:set>
deptno : ${dto2.deptno }<br> 
</body>
</html>