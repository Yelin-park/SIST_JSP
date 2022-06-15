<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 15. - 오후 3:44:11</title>
</head>
<body>
<h3>ex06.jsp</h3>
<pre>
	[p72 JSP 기본 객체 중에 가장 많이 사용하는 request 객체]
	1. 클라이언트(웹 브라우저)와 관련된 정보 읽기 기능
	2. 서버와 관련된 정보 읽기 기능
	3. 클라이언트가 전송한 [요청] 파라미터 읽기 기능 *** 
	4. 클라이언트가 전송한 요청 헤더 읽기 기능
	5. 클라이언트가 전송한 쿠키 읽기 기능
		// js 쿠키 정보 : document.cookie
	6. 속성 처리 기능
</pre>

<h3>클라이언트 + 서버 관련 정보 읽기 p73 표3.3</h3>

*** 1. contextPath(컨텍스트 패스) : <%= request.getContextPath() %><br>
*** 2. 클라이언트 IP : <%= request.getRemoteAddr() %><br>
*** 3. 요청 전송방식 : <%= request.getMethod() %><br>
*** 4. 요청 URL : <%= request.getRequestURL() %><br>
*** 5. 요청 URI : <%= request.getRequestURI() %><br>

6. 요청 정보 인코딩 : <%= request.getCharacterEncoding() %><br>
7. 요청 컨텐츠 타입 :<%= request.getContentType() %><br>
8. 요청 프로토콜 : <%= request.getProtocol() %><br>
9. 서버 이름 : <%= request.getServerName() %><br>
10. 서버 포트 : <%= request.getServerPort() %><br>
11. 요청 정보 길이 : <%= request.getContentLength() %><br>

</body>
</html>