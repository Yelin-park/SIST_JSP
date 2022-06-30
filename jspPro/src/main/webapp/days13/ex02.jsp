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
<title>2022. 6. 30. - 오전 9:41:51</title>
</head>
<body>
<h3>ex02.jsp</h3>

서버 요청 시간 : <%= new Date().toLocaleString() %>
<br>

<!-- 버튼을 누르면 시간은 안바뀐 상태로 ex02_ajax_info.txt를 가져오겠다. -->
<input type="button" value="js ajax" onclick="load('ex02_ajax_info.txt')">
<br>

<p id="demo"></p>

<script>
	var httpRequest; // 전역변수 선언
	
	// XMLHttpRequest 객체 생성해주는 함수 선언
	function getXMLHttpRequest(){
    	if( window.ActiveXObject ){   // IE
              try{
                 return new ActiveXObject("Msxml2.XMLHTTP");   // 
              }catch(e){
                 try{
                   return new ActiveXObject("Microsoft.XMLHTTP");
                 }catch(e){
                    return null;
                 }
              }
        }else if( window.XMLHttpRequest ){
               return new XMLHttpRequest();
        }else{
           return null;
        }
   }
 	
 	
	// js로 ajax 처리
	function load(url) {
		// 1. XMLHttpRequest 객체 생성(브라우저에 따라 다르기 때문에)
		httpRequest = getXMLHttpRequest();
		 
		// 2. XMLHttpRequest 객체.onreadystatechange = 콜백함수 등록
		// 비동기처리 객체의 요청처리에서 발생하는 상태가 변할 때마다 호출되는 함수
		httpRequest.onreadystatechange = callback ;
				 	
		// 3. XMLHttpRequest 객체.open() 설정
		httpRequest.open("GET", url, true)
		
		// 4. XMLHttpRequest 객체.send() 설정
		httpRequest.send();
	}
 	
	// 상태에 대한 보고를 아래 함수에게 함
	function callback(){
		if(httpRequest.readyState == 4){ // 서버에 요청 완료
			if(httpRequest.status == 200){ // 응답받은 응답이 성공적
				// js DOM 사용하여 웹페이지 수정, 추가, 삭제 등등 작업
				var msg = httpRequest.responseText; // 응답 받은 값이 ex02_ajax_info.txt의 Hello World 문자열
				
				// $("#demo").html(msg);
				
				// ex02_ajax_info.txt에 문자를 이름으로 나열후 li태그로 감싸기
		        var names =  msg.split(",");
		        for (let name of names) {
		            $("#demo").append( $("<li></li>").text( name ) );
		        }
				
				// p 태그를 li 태그 만들어서 추가
			}else{ // 요청은 했지만 응답이 실패했다면..
				alert("ajax 실패 : " + httpRequest.status); // 상태값 찍기
			}	
		}
	}
</script>

</body>
</html>