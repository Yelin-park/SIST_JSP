<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 16. - 오전 9:19:05</title>
</head>
<body>
<h3>p90 JSP 기본 객체 중에 자주 사용하는 객체 - response 객체</h3>
<pre>
 1. [response 기능]
  1) 응답 헤더 정보 입력 p91 표3.7
  2) 리다이렉트(redirect) 하기 - 사전적의미(다른 방향으로 다시 보내다, 전송하다) ***
  * 이외에 기능이 있지만, JSP 페이지에서는 거의 사용되지 X
 
 2. [리다이렉트 기능 설명 p93]
  - 웹 서버가 웹 브라우저에게 다른 페이지로 이동하라고 응답하는 기능
 				
	 클라이언트(웹브라우저) -> [A] 웹서버
	 클라이언트 <- [B]한테 요청해라 <-	[A] 웹서버
	 클라이언트 -> [B] 웹서버
 
 	예시) ex03.jsp									ex03_ok.jsp
 		 아이디 										아아디, 비밀번호 DB 체크를 해야하지만 생략하고 로그인 성공/실패 정보를 돌려줌
 		 비밀번호
 		 로그인 버튼 클릭 -> ex03_ok.jsp 요청
 		 
 		 로그인 X 화면
 		 로그인 성공 화면
 	
 	예시) ex04.jsp ex04_ok.jsp
 
 2-2. 포워딩 기능
 
</pre>
</body>
</html>