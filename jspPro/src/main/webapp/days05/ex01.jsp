<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 17. - 오후 4:49:33</title>
</head>
<body>
<h3>ex01.jsp</h3>

<pre>
	p 140 Chapter 06 에러처리
	게시판(board)
	MVC 게시판
	자료실
	
----------------------------------------------
	1. 자바에서 처럼 JSP도 예외처리				ex01_02.jsp
		: try-catch문 사용
		
	2. 웹 -> 클라이언트 (응답)					ex01_03.jsp
		ㄴ 404, 500번 에러 띄우는 것보단 에러나는 페이지로 응답(코드를 보여주기 때문에 보안상 문제)
		
	3. 상태코드(404, 500)별로 예외처리를 할 것인지, 예외 타입별(예외 종류) 예외처리 할 것인지		ex01_04.jsp / ex01_05.jsp
													ㄴ> SQL Syntax Exception, NullPointer exception 등..
													
													
	[에러 페이지의 우선 순위]
	1) page 지시자 errorPage = "/error/XXX.jsp"
	2) 예외 타입
	3) 에러 코드
	4) 웹 컨테이너가 제공하는 기본 에러 페이지													
	 	
</pre>
</body>
</html>