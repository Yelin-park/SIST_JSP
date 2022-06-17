<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" buffer="8kb" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 17. - 오후 3:08:28</title>
</head>
<body>
<h3>ex05_02.jsp</h3>

<pre>
	JSP 9가지 기본 객체 중 [out 출력 스트림]
	p 117 출력 메서드
	out.append();
	out.print();
	out.println(); 		-> "\r\n" 으로 나오기 때문에 <br> 변경
<%
	out.flush();
%> <!-- out.flush로 인해서 위에 코딩까지는 전송이 되어지고  out.clearBuffer() 까지는 출력이 안되어짐 -->
	out.newLine()
	
	p 118 표5.2 버퍼 관련 메서드
</pre>
<!-- 상단에 설정안해주면 buffer="8kb" autoFlush="true 기본값 -->
버퍼 크기 : <%= out.getBufferSize() %>kb<br>
<% 
	out.clearBuffer();
%> <!-- 버퍼를 지운다면 위에 코딩은 다 안나옴 -->
남은 버퍼 크기 : <%= out.getRemaining() %>kb<br>
autoflush : <%= out.isAutoFlush() %><br>
</body>
</html>