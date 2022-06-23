<%@page import="java.util.Date"%> <%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 22. - 오후 12:14:40</title>
</head>
<body>
<h3>ex04.jsp</h3>

<pre>
	2. 세션(Session) p232 Chapter10 클라이언트와의 대화2 : 세션
	 1) 세션이란?
	 쿠키는 웹 브라우저에 쿠키를 저장
	 - 세션은 웹 브라우저가 아니라 서버에 값을 저장
	 - 서버는 세션을 사용해서 클라어인트 상태를 유지할 수 있기 때문에 로그인한 사용자 정보를 유지하기 위한 목적으로 세션을 사용(상태 유지 관리)
	 - 세션은 클라이언트인 웹 브라우저 요청을 하면 하나의 세션 저장 공간을 생성
	 	A
	 	B
	 	C
	 	ex) 교육원 -> 수강신청/결재
	 		익순이	[저장공간 캐비넷] == 세션
	 		익동이	[저장공간 캐비넷]
	 		홍길동	[저장공간 캐비넷]
	 		
	 		강제 세션 종료
	 
	 2) 세션은 언제 생성되나? 하나의 웹 브라우저 -> 처음 요청[세션 == 캐비넷]
	 													비밀번호/열쇠
	 													JSESSIONID == 세션의 고유한 ID
</pre>
<% 
	// 세션(Session) 인증/권한/장바구니 데이터 저장
	// JSP 9가지 기본 객체 중 session 사용
	// 세션을 저장하고 읽어오는 예시) 
	// session.setAttribute("auth", "admin"); // 세션 저장 
    // String logonID = (String)session.getAttribute("auth"); // 세션 값 가져오기

	String sessionID = session.getId(); // 세션 ID 가져오기
	long ms = session.getCreationTime(); // 세션이 생성된 ms 값(1970.01.01 00:00:00 ~)
    long lastms = session.getLastAccessedTime(); // 세션을 마지막으로 접근한시간(ms)
%>

JSESSIONID(session id) = <%= sessionID %><br />
session creation Time = <%= ms %>ms<br />
session last Accessed Time = <%= lastms %>ms<br />

<%	
	// ms를 날짜형식으로 바꾸기
	String pattern = "yyyy-MM-dd HH:mm:ss";
    SimpleDateFormat sdf = new SimpleDateFormat(pattern);
    Date d = new Date();
    d.setTime(ms);
%>
session creation Time = <%= sdf.format(d) %><br />

</body>
</html>
