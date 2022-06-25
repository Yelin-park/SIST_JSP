<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 24. - 오전 10:49:22</title>
</head>
<body>
<h3>ex03.jsp - 메인페이지</h3>

<c:if test="${empty sessionScope.member }">
	<a href="/jspPro/days09/member/ex03_logon.jsp">로그인</a><br>
</c:if>
<c:if test="${not empty member }">
	<a href="/jspPro/days09/member/ex03_logout.jsp">로그아웃</a><br>
</c:if>

<br>
<br>

<!--
필터를 사용해서 로그인 하지 않은 경우에는 글목록, 글쓰기가 요청 -> 로그인 페이지 이동
-->
<a href="/jspPro/days09/board/ex03_list.jsp">글목록</a><br>
<a href="/jspPro/days09/board/ex03_write.jsp">글쓰기</a><br>
</body>
</html>