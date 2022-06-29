<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 28. - 오전 9:11:00</title>
</head>
<body>
<h3>ex02_ok.jsp</h3>

<pre>
	ex02에 form 태그에.. 아래 속성을 추가하고 서브밋 -> 파라미터 값이 null로 찍힘
	 method="post" 
     enctype="multipart/form-data" => 속성을 주면 request.getParameter로 파라미터 값을 가져올 수 없다. **     
</pre>

<%
	String name = request.getParameter("name");
	String upload = request.getParameter("upload");
%>

> 전달된 이름 : <%= name %><br>
> 전달된 파일 : <%= upload %><br>

<!-- 
	ex02에 form 태그에.. 아래 속성을 지정해 주지 않으면..
	  method="post" 
      enctype="multipart/form-data"
	실제 짱구.jpg 파일이 서버 전송 즉, 업로드 된 것은 아니다.
	파일명만 서버에 파라미터 값으로 전송된 것이다.
-->
</body>
</html>