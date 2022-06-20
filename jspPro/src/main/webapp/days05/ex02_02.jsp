<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 20. - 오전 10:41:49</title>
</head>
<body>
<%@ include file="/include.jspf" %>
contextPath = <%= contextPath %>
<h3>ex02_02.jsp</h3>

<%-- <%= id %> id 변수를 인식하지 못해서 500번 에러 발생 --%> 
<pre>include 액션태그 사용</pre>
<pre>
	p156
	응답하는 출력버퍼에만 차례대로 쌓여서 응답이 될 뿐
	서블릿 클래스와 서블릿 객체는 따로다
</pre>
<jsp:include page="/layout/top.jsp"></jsp:include>

<pre>include 지시자 사용 - <%= id %></pre>
<pre>
	p169
	ex02_02.jsp와 top.jsp를 하나로 만들어서 자바코드 생성하여 서블릿 클래스 컴파일하여짐
	서블릿 클래스가 하나가 되어짐
	
</pre>
<%@ include file="/layout/top.jsp" %>
</body>
</html>