<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 30. - 오전 10:32:12</title>
</head>
<body>
<h3>ex03.jsp</h3>
<pre>
	jquery의 load() 메서드 확인
	ex03_load.html
</pre>

<ol id="new-projects"></ol>

<script>
	// 자동으로 html 파일의 일부분만 가져옴
	$(function(){
		$("#new-projects").load("ex03_load.html #projects li");
	});
</script>
</body>
</html>