<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 23. - 오전 11:15:02</title>
</head>
<body>
<h3>ex06.jsp</h3>
<pre>
	국제화 태그
	- 숫자, 날짜 포맷팅 처리 태그 
	p325 표12-4 숫자 출력, 파싱 - fmt:formatNumber, fmt:parseNumber
	날짜 출력, 파싱 - fmt:formatDate, fmt:parseDate > ex06_02.jsp
</pre>
<%
	long price = 22345;
%>
<!-- type 기본 값은 number -->
<fmt:formatNumber type="number" value="<%= price %>" pattern="000000.00" var="fmt_price"></fmt:formatNumber>
fmt_price : ${fmt_price }<br>

price : <fmt:formatNumber value="<%= price %>" type="currency" currencySymbol="\\"></fmt:formatNumber><br>
퍼센트 price : <fmt:formatNumber value="<%= price %>" type="percent"></fmt:formatNumber>

<hr />

<%
	String strPrice = "1,200.34";
	int qty = 5;
	// request.setAttribute("qty", qty); 이렇게 하거나 c:set 사용하여 변수 선언
	
	// 자바 코딩이라면..
	// strPrice.replaceAll(",", ""); // "1200.34"
	// Double.parseDouble(strPrice); // 1200.34
%>

<fmt:parseNumber var="parPrice" value="<%= strPrice %>" pattern="0,000.00"></fmt:parseNumber>
<c:set var="q" value="<%= qty %>"></c:set>
총판매수량 : ${q}<br>
단가 : ${parPrice}<br>
총판매금액(단가*수량) : ${parPrice * q }<br>
</body>
</html>