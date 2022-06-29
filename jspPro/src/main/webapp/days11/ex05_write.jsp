<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 28. - 오전 11:21:20</title>
</head>
<body>

<h3 style="text-align: center">ex05_write.jsp</h3>
<form 
  action="write_ok.ss" 
  method="post"
  enctype="multipart/form-data" >
 <table border="1" style="width: 500px;" align="center">
  <tr>
    <td> subject </td>
    <td> <input type="text" name="subject" /></td>
  </tr>
  <tr>
     <td> attach file </td>
     <td><input type="file" name="attachFile" /></td>
  </tr>
  <tr>
   <td colspan="2"><input type="submit" /></td>
  </tr>
 </table>
</form>

</body>
</html>