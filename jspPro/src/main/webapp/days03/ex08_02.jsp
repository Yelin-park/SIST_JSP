<%@page import="java.util.Enumeration"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 16. - 오후 4:01:05</title>
</head>
<body>
<h3>ex08_02.jsp</h3>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>	

<form action="ex08_03.jsp" method="get">
	address : <input type="text" name="address" value="서울 강남구"><br>
	tel : <input type="text" name="tel" value="010-1234-5678"><br>
	<input type="button" value="Prev" onclick="history.back()">
	<input type="submit" value="Next">
	<!-- 쿠키, 세션 사용해도 되고 아래처럼 숨겨서 가져가도 됨(전에 있던 값을 가져와서 숨겨가지고 ex08_03.jsp에게 전달) -->
<%--
	<input type="hidden" name="name" value="<%= name %>">
	<input type="hidden" name="age" value="<%= age %>"> --%>
	
<script>
	// form태그 안에 type이 hidden인 태그를 스크립트 안에서 동적 생성
	<% 
		Enumeration<String> en = request.getParameterNames();
		while(en.hasMoreElements()){
			String pname = en.nextElement();
			String pvalue = request.getParameter(pname);
	%>
		$("form").append("<input type='hidden' name='<%= pname %>' value='<%= pvalue %>'>");
	<%
		} // while
	%>
</script>
</form>
</body>
</html>