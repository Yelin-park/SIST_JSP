<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 17. - 오후 4:36:03</title>
</head>
<body>
<h3>ex06_03.jsp</h3>

a name : <%= application.getAttribute("name") %><br>
s age : <%= session.getAttribute("age") %><br>
r addr : <%= request.getAttribute("addr") %><br>
p color <%= pageContext.getAttribute("color") %><br>

</body>
</html>