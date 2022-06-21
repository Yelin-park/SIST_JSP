<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 21. - 오후 4:24:09</title>
</head>
<body>
<h3>ex02.jsp</h3>

<pre>
	*** 취업 : 게시판, 상태관리-쿠키, 세션 *** 
	p205 Chapter09 클라이언트와의 대화 1 : 쿠키
	p232 Chapter10 클라이언트와의 대화 2 : 세션	
</pre>

<pre>
	쿠키는 웹 브라우저가 보관하는 텍스트 파일의 데이터
	웹 브라우저는 웹 서버에 요청을 보낼 때 쿠키를 함께 전송 -> 웹 서버는 웹 브라우저가 전송한 쿠키를 사용해서 필요한 데이터를 읽음
	쿠키는 웹 서버와 웹 브라우저 양쪽에서 생성 가능
	js에서 생성하는 쿠키는 웹 브라우저에서 생성하는 쿠키
	JSP에서 생성하는 쿠키는 웹 서버에서 생성하는 쿠키
	
	JSP에서 생성하는 쿠키는..
	웹 브라우저가 쿠키를 생성해달라고 요청을 하면 웹 서버에서 쿠키를 생성한 뒤 그 쿠키를 응답할 때 돌려줌
</pre>

<pre>
	p205 Chapter09 클라이언트와의 대화 1 : 쿠키
	
	1. 클라이언트			서버
				  요청
				  응답
		매번 새로운 페이지(응답받을 때 마다)
	
	2. 어떤 정보를 저장할 필요가 있다. -> 상태 값을 저장해서 유지할 필요가 있다.
		ㄴ 상태 값을 저장해 유지하는 것중에 클라이언트에게 텍스트 파일로 저장하는 것이 '쿠키' 이다.
		
	3. js - document.cookie 속성 -> 쿠키 생성(저장), 쿠키 읽기 등등 작업
		js 클라이언트 사용자 측에서 하는 것
	
	4. JSP/Servlet에서 cookie를 사용한다는 것은
		서버 측에서 쿠키 관련 코딩(명령)을 해서 클라이언트의 쿠키 생성, 삭제 하는 것
		
	5. 쿠키 구성
		ㄱ. 쿠키이름(필수)
		ㄴ. 쿠키값(필수)
		ㄷ. 만료시점(선택) : -1 값을 주면 브라우저를 닫으면 쿠키는 자동으로 제거
						 : 0 값을 주면 지금 즉시 쿠키를 제거
						 : 별도의 만료시점을 설정하지 않으면 웹 브라우저를 종료할 때 쿠키 자동 제거
		ㅁ. 도메인(domain) : ex. localhost
		ㅂ. 경로(path) : /	 ex. days06 이라고 설정하면
		
		  ex) http://localhost/jspPro/days02/ex01.jsp 
		  ex) http://localhost/jspPro/days06/ex01.jsp		-> days06일 때만 쿠키를 서버에 가지고 가서 사용할 수 있음
		
		/ 만 주면 : 모든 도메인에 요청이 일어날 때 클라이언트 쿠키 값을 가지고 가라 -> 클라이언트 쿠키 사용할 수 있다.
		
	6. JSP 쿠키 생성 
		ㄱ. Cookie 클래스로 객체 생성
			ex. Cookie c = new Cookie(쿠키이름, 쿠키값);
				c.setXXX 으로 만료시점, 도메인, 경로 설정
		ㄴ. 응답할 때 생성된 Cookie 객체를 포함해서 가지고 가서 클라이언트에게 전달(응답) -> 브라우저가 받아서 쿠키 값을 저장
			response.addCookie(c);		
</pre>

<a href="ex02_02.jsp">JSP 쿠키 생성</a><br><!-- ex02_02_ok.jsp도 생성 -->
<a href="ex02_03.jsp">JSP 쿠키 확인</a><br>

</body>
</html>