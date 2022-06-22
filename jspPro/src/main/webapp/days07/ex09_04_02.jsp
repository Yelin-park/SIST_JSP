<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 22. - 오후 4:39:07</title>
</head>
<body>
<h3>ex09_04_02.jsp</h3>
<!-- 요청 URL : http://localhost/jspPro/days07/ex09_04_02.jsp
요청 URI : /jspPro/days07/ex09_04_02.jsp -->
요청 URL : <%= request.getRequestURL() %><br>
요청 URI : <%= request.getRequestURI() %><br><!-- 프로젝트명부터 찍힘 -->

<hr><!-- EL 객체 사용 -->
요청 URL : ${pageContext.request.requestURL }<br>
요청 URI : ${pageContext.request.requestURI }<br>

<hr>
<%
	request.setAttribute("name", "익순이");
	session.setAttribute("age", 20);
%>
name = <%= request.getAttribute("name") %><br>
age = <%= session.getAttribute("age") %><br>

<hr><!-- EL 객체 사용 -->
name = ${requestScope.name }<br>
age = ${sessionScope.age }<br>

<hr>
<!-- 특정 Scope라고 지정해 주지 않아도 내부적으로 모든 영역(Scope)을 다 뒤져서 가져온다. -->
name = ${name }<br>
age = ${age }<br>

<hr>
<%
	String color = request.getParameter("color");
%>
<!-- 실행 시키면 null이 나오는데 URL에 직접 쿼리스트링 입력해주면 값이 나옴
ex) http://localhost/jspPro/days07/ex09_04_02.jsp?color=blue -->
color = <%= color %><br>
color = ${param.color }<br>

<hr>
<!-- 링크 태그 클릭시 ex09_04_03.jsp로 이동하고 파라미터 값을 가지고 이동 -->
<a href="ex09_04_03.jsp?color=red&color=black&color=blue">ex09_04_03.jsp</a>
</body>
</html>