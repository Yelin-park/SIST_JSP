<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 22. - 오후 4:48:53</title>
</head>
<body>
<h3>ex09_04_03.jsp</h3>
<pre>
?color=red&color=black&color=blue
</pre>
<%
	String[] colors = request.getParameterValues("color");
	for(int i=0; i < colors.length; i++){
%>
	<li>color : <%= colors[i] %></li>
<%		
	}
%>

<hr>
<!-- paramValues EL 객체를 사용해서 출력 -->
 <c:forEach items="${ paramValues.color }" var="color">
    <li> color : ${ color }</li> 
 </c:forEach>
</body>
</html>