<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 22. - 오후 12:30:09</title>
</head>
<body>
<h3>ex05_02.jsp - JSP 4가지 영역 이해 및 활용</h3>

<!-- ex05.jsp에서 a 링크 태크 클릭 시 가져오는 값 -->
job : <%= pageContext.getAttribute("job") %><br><!-- 페이지가 바뀌어서 가져올 수 X -->
deptno : <%= session.getAttribute("deptno") %><br><!-- 세션 접속이 안끊어져서 가져올 수 있음(브라우저 다 닫고 실행시키면 null 나옴) --> 
empno : <%= request.getAttribute("empno") %><br><!-- 요청이 바뀌어서 가져올 수 X -->
dbcp : <%= application.getAttribute("dbcp") %><br><!-- 서버가 종료되지 않아서 가져올 수 있음 -->

<pre>
	1. 세션 언제 종료?
		- 웹 브라우저 종료(닫기)
		- 웹 브라우저 열기 + 요청/응답X -> 자동으로 종료되는 경우
			세션 20분 후에 종료된다.
		- 강제 세션 종료 == session.invalidate();
	
	2. 세션 유효 시간
		- 마지막 요청/응답 있은 후에 20분 유효시간 있음
		- web.xml에서 설정
</pre>
</body>
</html>