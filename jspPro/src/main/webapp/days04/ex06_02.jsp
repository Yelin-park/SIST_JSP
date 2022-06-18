<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 17. - 오후 4:36:03</title>
</head>
<body>
<h3>ex06_02.jsp</h3>

<%
	// 4가지 영역(scope) 값 저장
	application.setAttribute("name", "admin");
	session.setAttribute("age", "20");
	request.setAttribute("addr", "seoul");
	pageContext.setAttribute("color", "red");
%>

a name : <%= application.getAttribute("name") %><br>
s age : <%= session.getAttribute("age") %><br>
r addr : <%= request.getAttribute("addr") %><br>
p color <%= pageContext.getAttribute("color") %><br>

<br>
<!-- 페이지 이동시 name과 age만 이동되어짐 -->
<a href="ex06_03.jsp">ex06_03.jsp</a>
 
<%
	// 포워딩 작업을 하면 request는 유지되어짐
	// ex06_02.jsp를 실행시키면 url은 ex06_02.jsp가 나오고 ex06_04.jsp가 보여지고 color 빼고 값을 보여짐
	String path = "ex06_04.jsp";
	RequestDispatcher dispatcher = request.getRequestDispatcher(path);
	dispatcher.forward(request, response);
%>
</body>
</html>