<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 30. - 오전 9:04:14</title>
</head>
<body>
<h3>ex01.jsp</h3>
<pre>
	[js ajax, jquery ajax + JSON]
	1. js ajax
		- 기본 개념 이해
		1) ajax(에이작스, 아작스)
			Asynchronous Javascript And Xml
			=> XML 데이터를 사용하는 비동기적인 자바스크립트 기술
			
		2) ajax란?
			- 페이지 로드된 후에도 웹 서버에서 데이터를 읽어와서 사용 가능
			- 페이지가 전체 새로 고침되지 않고 웹페이지의 일부분 업데이트 가능
			- 페이지는 유지된채로 백그라운드에서 웹 서버와 통신하는 기술
		 
		3) 예시
			- 네이버에 메인 페이지 요청 후 검색창에 검색어 입력시 검색부분만 업데이트 하는 기능
				+ 환율, 날씨정보, 상품 다음페이지/이전페이지
			- 회원가입할 때
			  이름		상태관리
			  생년월일 상태관리
			  주소 [우편번호검색] ajax
			  아이디 [admin] [중복체크검사버튼] ajax
		 
		 4) ajax 장점
		 	- 성능 향상 (why? 전체 페이지가 다시 요청, 응답X, 수신 데이터 양이 줄어든다.)
		 	- 개발 속도 향상
		 	- 각각의 기능을 하는 서버로 부터 분산 처리 가능(ex. 날씨는 기상청, 환율은 환율정보서비스 등등)
		 	
		 5) ajax 단점
		 	- 클라이언트 기술(javascript 사용)이기 때문에 보안적인 측면이 취약하다.
		 	- 필요하다면 가져다 쓸 수 있기 때문에 차별화가 없음
		 	- 브라우저 호환성 체크 필요
		 
		 6) js ajax 처리 방법(과정)
		 	ㄱ. 웹페이지에서 이벤트 발생시키기(로딩된 웹페이지에서 다음버튼 클릭하거나 검색어창에 검색어 입력하거나 등..)
		 	
		 	ㄴ. 현재 페이지는 유지한채로 -> 서버 요청
		 						 [ 백그라운드 객체, 일꾼(스레드) ]	
		 							 <- 응답
		 			XMLHttpRequest 객체를 js로 생성 + 설정(어떤 서버에 어떤 기능으로 다녀와라)
		 			객체 생성 방법) 브라우저 종류 또는 버전에 따라 객체 생성이 다를 수 있다.
		 				- XMLHttpRequest 객체명 = new XMLHttpRequest();
		 				- XMLHttpRequest 객체명 = new ActiveXObject("Microsoft.XMLHTTP"); // IE6 이하 버전
		 			
		 			ex)
		 			var xmlHttp
		 			if(window.XMLHttpRequest){
		 				xmlHttp = new XMLHttpRequest();
		 			} else {
		 				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		 			} else {
		 				xmlHttp = null;
		 			}	
		 				
		 	ㄷ. XMLHttpRequest 객체를 사용해서 웹서버에 요청
		 		'수영복' 파라미터를 가지고 DB에서 select 한 뒤 가져옴
		 		  [요청 설정]
		 		  > GET 또는 POST 설정 가능
		 		  open("GET", 요청URI) 메서드 - 요청에 필요한 설정을 하는 함수
		 		  open("POST") 메서드 - 요청에 필요한 설정을 하는 함수
		 		  send() 메서드 - open 메서드에 설정한 것을 가지고 실제 서버에 요청을 하는 함수
		 		
		 		  XMLHttpRequest 객체 생성 후!
		 		  
		 		  XMLHttpRequest 객체.onreadystatechange = function(){ => 상태가 바뀌었을 때 호출하는 함수 등록(콜백함수)
		 		  		if( 서버 요청이 완료되고 응답 준비가 되었다면 readyState 속성 == 4 && status 속성 == 200 요청받는 결과가 성공적으로 확인이 되었다면 ){
		 		  			// 응답 결과를 가지고 웹 페이지를 수정, 추가 등 처리하는 코딩
		 		  			// [응답 결과]
		 		  				1. responseText 속성 : 응답한 결과가 String
		 		  				2. responseXML 속성 : 응답한 결과가 XML
		 		  		}
		 		  }
		 		  
		 		  1) GET 방식 요청
		 			XMLHttpRequest 객체.open("GET", "/test.jsp?id=admin", true)
		 				? 뒤로 파라미터 값을 가지고 감
		 				true : 비동기적 처리 / false : 동기적처리 => ajax는 100% 비동기적 처리이기 때문에 무조건 true임
		 			XMLHttpRequest 객체.send(null);
		 			
		 		  2) POST 방식 요청
		 			XMLHttpRequest 객체.open("POST", "/test.jsp", true)
		 			XMLHttpRequest 객체.send("id=admin"); 
		 			파라미터 값이 send 메서드로 보내짐
		 			
		 	ㄹ. 서버에서 요청 처리 -> 응답
		 	
		 	ㅁ. 콜백함수 호출 + 응답 결과(요청 처리를 하고난 뒤에 요청한 사람을 부름)
		 		js 웹 페이지의 일정 부분 + DOM(새로운 데이터 추가, 수정 처리)
		 
		 7) 실제 예제
		 	ex02.jsp
		 	ex02_ajax_info.txt
		 	ex02_02.jsp => jquery로 코딩
		 	
		 	  jquery의 load() 메서드 확인
		 	   ex03.jsp
		 	   ex03_load.html
		 			 	
		 	ex04.jps
		 	ex04_top5.jsp
		 	
		 	
	2. jquery ajax
	
	3. JSON
</pre>
</body>
</html>