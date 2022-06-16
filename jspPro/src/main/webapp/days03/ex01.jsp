<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 16. - 오전 9:03:23</title>
</head>
<body>
<pre>
	p88 : jsp 기본 객체 중 request 객체로 헤더 정보를 얻어 올 수 있다
	
	http 프로토콜의 헤드에 부가적인 정보가 담겨 있음 - 웹 브라우저 종류, 선호하는 언어 등등
	
	[표3.6]
	1) String getHeader(String name) : 지정한 이름의 헤더 값을 구한다
	2) Enumeration getHeaders(String name) : 지정한 이름의 헤더 목록 반환
	3) Enumeration getHeaderNames() : 모든 헤더의 이름 반환 ***
	4) int getIntHeader(String name) : 지정한 헤더의 값을 정수 값으로 반환
	5) long getDateHeader(String name) : 지정한 헤더의 값을 시간 값으로 반환(1970.01.01~ms)
	
	컴파일 -> Now.class 클래스 파일 -> 실행
	클래스 파일 생성 후 C드라이브의 WAS(톰캣)WEB-INF/classes 폴더 생성 후 넣는 것은 웹 배포할 때 넣음
	웹 사이트 개발 -> 웹 서버 배포(게시) 
</pre>

<h3>헤드 목록 출력</h3>
<ol>
<%
	// 스크립트릿 - 자바코딩
	Enumeration<String> en = request.getHeaderNames();

	while(en.hasMoreElements()){ // 요소를 가지고 있으면
		String headerName = en.nextElement();
		String headerValue = request.getHeader(headerName);
%>
	<%-- out.println("<li>" + <%= headerName %> + "</li>") --%>
	<li><%= headerName %> : <%= headerValue %></li>
<%
	}
%>
</ol>
</body>
</html>