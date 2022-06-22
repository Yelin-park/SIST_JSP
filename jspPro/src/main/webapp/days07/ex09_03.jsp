<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- 3자리 마다 콤마를 찍기 위해 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 22. - 오후 3:47:50</title>
</head>
<body>
<h3>ex09_03.jsp</h3>
<%
	long price = 22345;
	// EL로 사용하기 위해서는 JSP 4가지 영역에 저장해야 사용할 수 있음
	request.setAttribute("price", price); // 이 코딩으로 저장안하면 $로 사용할 수 없음
%>
price = ${price }<br>
price = <%= price %>

<pre>
	단가를 세 자리마다 콤마를 찍어서 출력
	22,345
</pre>

price = <%= String.format("%,d", price) %><br>
<%
	DecimalFormat formatter = new DecimalFormat("###,###");
	String sPrice = formatter.format(price);
	request.setAttribute("sPrice", sPrice);	
%>
price = ${sPrice }<br>
price = <%= sPrice %><br>

<!-- 액션태그를 사용해서 , 찍기 가능 -->
price = <fmt:formatNumber value="${price }" pattern="#,###"></fmt:formatNumber><br>
</body>
</html>