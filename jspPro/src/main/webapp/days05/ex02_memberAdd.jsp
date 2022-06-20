<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 20. - 오전 10:31:25</title>
</head>
<body>
<h3>ex02_memberAdd.jsp</h3>
<div style="text-align: center;">
 <table width="600px" border="1" align="center">
  <tr>
   <td colspan="3">
    <jsp:include page="/layout/top.jsp"></jsp:include>
   </td>
  </tr>
  <tr height="300">
   <td width="150" valign="top" style="background: yellow;"><jsp:include page="/days05/layout/left.jsp"></jsp:include></td>
   <td>
    <a href="ex02_template.jsp">HOME</a><br>
    회원 추가 Content 부분<br>
    회원 추가 Content 부분<br>
    회원 추가 Content 부분<br>
    회원 추가 Content 부분<br>
    회원 추가 Content 부분<br>
   </td>
   <td valign="top" style="background: red;"><jsp:include page="/days05/layout/right.jsp"></jsp:include></td>
  </tr>
  <tr>
   <td colspan="3">
    <jsp:include page="/layout/bottom.jsp"></jsp:include>
   </td>
  </tr>
 </table>
</div>
</body>
</html>