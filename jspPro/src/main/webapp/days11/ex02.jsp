<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 28. - 오전 9:10:51</title>
</head>
<body>
<h3>ex02.jsp</h3>
<pre>

</pre>
<!-- <form action="ex02_ok.jsp" -->
<form action="ex02_ok_02.jsp"
          method="post" 
          enctype="multipart/form-data"
>
          
  이름 : <input type="text" name="name" value="홍길동" /><br>
  첨부파일 : <input type="file" name="upload"><br>
  
  <input type="submit" />
</form>
</body>
</html>