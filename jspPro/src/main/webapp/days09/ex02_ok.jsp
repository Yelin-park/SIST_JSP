<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="/include.jspf" %> --%><!-- 2. 공통모듈화 사용 가능 -->
<%
	// 넘어오는 한글 파라미터 값을 안깨지게 하도록 인코딩
	// 1. 모든 페이지 마다 아래 코딩 추가해도 됨
	// request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 24. - 오전 10:23:23</title>
</head>
<body>
<h3>ex02_ok.jsp</h3>

<%
	String name = request.getParameter("name");
%>

전달된 이름 : <%= name %><br>
</body>
</html>