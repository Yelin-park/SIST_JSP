<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="httpRequest.js"></script><!-- ajax 처리를 위해 javascript 파일 하나 생성  -->
<title>2022. 6. 30. - 오전 10:38:17</title>
</head>
<body>
<h3>ex04.jsp</h3>
처음 ex04.jsp 요청한 시간 : <%= new Date().toLocaleString() %>
<br>
<br>
<input type="button" value="emp sal Top5" onclick="getTop()">
<br>

<p id="demo"></p>

<script>
	// 버튼을 누르면 ajax로 호출
	function getTop() {
		sendRequest("ex04_top5.jsp", null, callback, "GET");
		timer = setTimeout(getTop, 4000); // 4초마다 호출
	}
	
	function callback() {
		if(httpRequest.readyState == 4){ // 서버에 요청 완료
			if(httpRequest.status == 200){ // 응답받은 응답이 성공적
				$("#demo").html(httpRequest.responseText); // httpRequset => httpRequest.js에 있는 것
			}else{ // 요청은 했지만 응답이 실패했다면..
				alert("ajax 실패 : " + httpRequest.status); // 상태값 찍기
			}	
		}		
	}
</script>
<!--
js ajax
1. XMLHttpRequest 생성
2. onreadyStateChange 속성 - 콜백함수 등록
3. open() 메서드 설정
4. send() 
 -->
<!-- 
httpRequest.js에 위 과정을 등록
1) sendRequest(url, param, method, callback) 함수 => ajax 요청 -> 응답
	위의 함수에서.. 아래 작업을 함
	1. XMLHttpRequest 생성
		xhr == XMLHttpRequest
	2. onreadyStateChange 속성 = callback
	[GET 방식]
	3. open(method, url, true) 메서드 설정
	4. send() 
	[POST 방식]
	3. open(method, url, true) 메서드 설정
	4. send() 
2) getXMLHttpRequest() 함수 => xhr 반환
 -->
</body>
</html>