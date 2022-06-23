<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 23. - 오전 9:07:42</title>
</head>
<body>
<h3>ex09_05_ok.jsp</h3>

<%
	Cookies cookies = new Cookies(request);
	// 쿠키의 이름과 쿠기 객체를 엔트리셋으로 반복해서 출력해보자
	Set<Entry<String, Cookie>> set = cookies.cookieMap.entrySet();
	
	Iterator<Entry<String, Cookie>> ir = set.iterator();
	while(ir.hasNext()){
		Entry<String, Cookie> entry = ir.next();
		String cname = entry.getKey();
		String cvalue = entry.getValue().getValue(); //  entry.getValue() 이걸로 쿠키 객체를 가져와서 쿠키객체.getValue()로 쿠키값 가져옴
%>
	<li><%= cname %>-<%= cvalue %></li>
<%		
	}
%>

<pre>
	EL로 쿠키 다루기
</pre>
EL id : ${cookie.id.value }<br><!-- id라는 쿠키의 값을 얻어올 수 있음 -->
EL user : ${cookie.user.value }<br>
EL age : ${cookie.age.value }<br>

<hr />
<!-- EL + JSTL -->
<!-- cookie가 하나의 맵 객체로 아래 코딩은 while문 안의 코딩과 동일 -->
<c:forEach items="${cookie }" var="entry">
 <li>${entry.key}-${entry.value.value }</li><!-- entry.value == 쿠키 객체 그 자체 -->
</c:forEach>

<hr />
<!-- EL + JSTL -->
<c:forEach items="${cookie }" var="entry">
 <c:set value="${entry.value }" var="c"></c:set><!-- 변수 선언 -->
 <li>${entry.key}-${c.value }</li>
</c:forEach>
</body>
</html>