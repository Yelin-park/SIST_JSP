<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 21. - 오후 4:38:00</title>
</head>
<body>
<h3>ex02_02.jsp - JSP 쿠키 생성</h3>

<!-- submit 클릭하면 ok.jsp로 GET 방식 전송 -->
<form action="ex02_02_ok.jsp" method="get">
 생성할 쿠키 이름 : <input type="text" name="cookieName" value="name"><br> 
 생성할 쿠키 값 : <input type="text" name="cookieValue" value="익순이"><br>
 <input type="submit">
</form>
</body>
</html>