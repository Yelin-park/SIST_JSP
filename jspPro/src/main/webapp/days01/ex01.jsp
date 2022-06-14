<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// WAS(톰캣) - jsp 페이지 안에 있는 자바 코딩을 컴파일 + 실행
	// 컴파일할 때는 javac.exe, 실행할 때는 java.exe 인터프리터를 알아야 하니까 환경변수(JAVA_HOME) 설정 => WAS 서버의 역할
	// <% 붙어 있으면 전부 다 서버에서 실행되는 것. (톰캣에 의해서..)
	// 따라서 클라이언트는 html 내용들만 보임(페이지 소스보기)
	
	// < % 이것을 스크립트릿
	// 자바 코딩을 한다.
	Date now = new Date();

	String pattern = "yyyy-MM-dd hh:mm:ss";
	SimpleDateFormat sdf = new SimpleDateFormat(pattern);
	String strNow = sdf.format(now);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 14. - 오후 12:26:36</title>
</head>
<body>
<h3>ex01.jsp - 동적 자원</h3>
<pre>
	새로고침을 해도 바뀌지 않으면 정적 자원, 바뀐다면 동적 자원
</pre>

<!-- 표현식 -->
<h3><%= strNow %></h3>

<%-- JSP의 주석처리 --%>
<%--
[p52 JSP 페이지의 구성 요소]
1. 디렉티브(Directive) == 지시자
	- JSP 페이지에 대한 설정 정보를 지정할 때 사용한다.
	- 선언 형식 : <%@ %>
	- 디렉티브(지시자) 3가지 종류
	 ㄱ. <%@ page %> : page 지시자
	 ㄴ. <%@ taglib %> : taglib(태그 라이브러리) 지시자
	 ㄷ. <%@ include %> : include 지시자

2. JSP 스크립트
	ㄱ. 스크립트릿(Scriptlet)	<% %> : 자바 코딩, 변수 선언 가능
	ㄴ. 표현식(Expression) <%= %> : 출력 용도
	ㄷ. 선언문(Declaration) <%! %> : 변수, 메서드 선언 영역
	
3. 표현 언어(Expression Language) == EL : 출력 용도
	- 문법 : ${}
	  > param 이란 객체로 ? 뒤에 값을 받아올 수 있음

4. 기본 객체(Implicit Object) - 9가지
 - JSP는 웹 어플리케이션 프로그래밍을 하는데 필요한 기능을 제공해주는 기본 객체를 제공함
	ㄱ. request
	ㄴ. response
	ㄷ. session
	ㄹ. application
	ㅁ. page
	등
	
5. 정적인 데이터

6. 표준 액션 태그(Action Tag)
	- <jsp:태그명></jsp:태그명>

7. 커스텀 태그(Custom Tag) <logon></logon>
	표준 태그 라이브러리(JSTL)
	
--%> 

</body>
</html>