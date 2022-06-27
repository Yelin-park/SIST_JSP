<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 23. - 오전 10:46:30</title>
</head>
<body>
<h3>ex05_04.jsp</h3>
<!-- c:forEach + 배열(array) -->
<c:set var="m" value="<%= new int[]{1,3,5,4,2} %>"></c:set>
<c:forEach items="${m }" var="n" varStatus="status">
 <li>m[${status.index }] = ${n }</li>
</c:forEach>

<hr />

<!-- 쿠키맵 c:forEach + Map -->
<%
    Map<String, String> map = new HashMap<>();
    map.put("k1","v1");
    map.put("k2","v2");
    map.put("k3","v3");
    map.put("k4","v4");
%>

<ol>
<c:forEach items="<%= map %>" var="entry">
  <li>${ entry.key } - ${ entry.value }</li>
</c:forEach>
</ol>

<hr />

<c:url var="url" value="ex05.jsp"></c:url>
<c:redirect url="${url }">
 <c:param name="name" value="admin"></c:param>
 <c:param name="age" value="20"></c:param>
</c:redirect>

</body>
</html>