<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 17. - 오후 2:45:23</title>
</head>
<body>
<h3>ex05.jsp</h3>

<pre>
	[JSP에서 제공하는 기본 객체 9가지 p114]
	기본객체			실제타입(클래스)									설명	
	1. request 		: javax.servlet.http.[HttpServletRequest]  클라이언트의 요청 정보를 저장하는 객체
	2. response 	: javax.servlet.http.HttpServletResponse   응답 정보를 저장하는 객체
	3. out 			: javax.servlet.jsp.JspWriter  JSP 페이지가 생성하는 결과를 출력할 때 사용하는 출력 스트림
														ㄴ 출력 버퍼
	
	4. session 		: HttpSession   HTTP 세션 정보를 저장(인증, 권한 정보 저장 ex)로그인 )
	5. pageContext 	: javax.servlet.jsp.PageContext  JSP 페이지에 대한 정보를 저장하는 객체
	8. page 		: java.lang.Object  JSP 페이지를 구현한 자바 클래스 인스턴스   -> 페이지를 생성한 객체
	
	6. application 	: javax.servlet.ServletContext  웹애플리케이션(사이트) 전처에 대한 정보를 저장하는 객체
	7. config 		: javax.servlet.ServletConfig  JSP 페이지의 설정 정보 저장
	
	9. exception 	: java.lang.Throwable  예외 처리 객체(에러 페이지에서만 사용 가능하다)
</pre>
</body>
</html>