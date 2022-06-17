<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 17. - 오후 12:48:28</title>
</head>
<body>
<h3>ex03.jsp</h3>

<pre>
	p98 Chapter04 부터 오후 수업 시작
	
	JSP 	요청 ->
		<- 응답(출력버퍼)
	처리과정
												
	브라우저[ 주소창 : http://~~~/ex01.jsp] -> 톰캣(웹서버 + WAS) -> ex01.jsp
		웹서버 : 요청받고 응답하는 서버                               	jsp파일을 jasper(톰캣 안에 있는 툴)로 인하여 -> 
		WAS : 컴파일 + 실행하는 역할의 서버								.java - 서블릿 클래스 생성 
																	.class - 컴파일
																										
								  <- 응답 웹 컨테이너[서블릿 객체] ()서블릿이 호출되어서 응답)	
	
		
		
		
	스크립트릿을 아무리 끊어서 코딩을 해도 _jspService 메서드 안에서 차례대로 출력되라고
	out.write() 되어지고 있음 
</pre>

<pre>
게시판 글 + 첨부 파일은 아래의 경로에 있음
[이클립스 내에서 배포했을 때의 위치 : 첨부파일 업로드 된다 ]
C:\Class\JSPClass
	\.metadata
		\.plugins
			\org.eclipse.wst.server.core
				\tmp0
					\work
						\Catalina
							\localhost\jspPro\org\apache\jsp\days04


JSP페이지로부터 자바코드가 생성이 되고 생성된 클래스가 서블릿 클래스이고 
 ex03.jsp -> 서블릿 클래스			-> 컴파일 class
 				ex03_jsp.java		ex03_jsp.class

 ex03.jsp -> 서블릿 + 서블릿 객체
 			<- 응답		출력버퍼[.........]에 어느 정도 쌓았다가 보냄
 			
 			출력 버퍼에 저장했다가 한꺼번에 웹 브라우저에 전송할 때 생기는 장점
 				ㄱ. 데이터 전송 성능 향상
 				ㄴ. JSP 실행 도중에 버퍼를 비우고 새로운 내용 전송 가능
 				ㄷ. 버퍼가 다 차기전에 헤더 변경 가능


</pre>


<!--
	스크립트릿에서 선언하는 변수는 지역변수
	선언문에서 선언하는 변수는 멤버변수(필드)
-->
<%
	// 스크립트릿
	// jspServicer(){} 안에 있는 지역변수
	String name = "hong";
%>

<%!
	// 선언문
	// 서블릿 클래스의 멤버변수(필드), 메서드로 선언되어짐
	int age = 20;

	public String getname(){
		return "홍길동";
	}
%>

<%
	// 스크립트릿
	for(int i=1; i <=10; i++){
		out.append("<li>" + i + "</li>");
%>
	<li><%= i %></li>
<%		
	}
%>

</body>
</html>