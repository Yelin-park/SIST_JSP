<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 24. - 오전 10:50:17</title>
</head>
<body>
<h3>ex03_logon.jsp</h3>

<form action="<%= request.getContextPath() %>/days09/member/ex03_logon_ok.jsp">
  아이디 :  <input type="text" name="id" /><br>
  비밀번호 : <input type="password" name="passwd"><br>
  <input type="submit" value="로그인" />
</form> 
</body>
</html>