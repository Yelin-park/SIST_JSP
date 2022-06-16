<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 16. - 오후 4:46:54</title>
</head>
<body>
<h3>test/test00.jsp</h3>

<pre>
	/test/test00.htm -> 서블릿 호출(TestDeptEmp.java) -> test01.jsp
						ㄴ doGet() {
							포워딩 시킴
							test01.jsp
						}
</pre>

<%
	String contextPath = request.getContextPath();
%>
<a href="<%= contextPath %>/test/test00.htm">test00.html</a>

</body>
</html>