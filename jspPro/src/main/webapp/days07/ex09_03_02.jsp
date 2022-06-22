<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="days07.FormatUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 22. - 오후 4:07:51</title>
</head>
<body>
<h3>ex09_03_02.jsp</h3>

<pre>
	p266 EL에서 객체의 메서드, 정적(static) 메서드를 사용하는 방법
	days07 패키지 안에 FormatUtil.java 생성
</pre>
<%
	long price = 22345;
	// 1. request.setAttribute("price", price);
%>
<!-- 2. JSTL 변수 선언 할당 -->
<!-- p295 표12.2 c:set 변수 선언 태그 -->
<c:set var="price" value="<%= price %>"></c:set>
FormatUtil.staticNumber() price = ${price }<br>

FormatUtil.staticNumber() price = ${FormatUtil.staticNumber(price, "#,##0") }<br>

<!-- FormatUtil 객체를 생성해서 객체명.number() 호출 -->
<%
	FormatUtil fu = new FormatUtil(); // FormatUtil 객체를 생성하고
	request.setAttribute("f", fu);  // 저장해야 EL로 사용할 수 있음
%>
FormatUtil.staticNumber() price = ${f.number(price, "#,##0") }<br>
</body>
</html>