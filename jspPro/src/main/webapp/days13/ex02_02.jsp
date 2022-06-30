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
<h3>ex02_02.jsp</h3>

서버 요청 시간 : <%= new Date().toLocaleString() %>
<br>

<!-- 버튼을 누르면 시간은 안바뀐 상태로 ex02_ajax_info.txt를 가져오겠다. -->
<input type="button" value="jquery ajax">
<br>

<p id="demo"></p>

<script>
	$("input").on("click", function () {
		// jquery ajax method : load()
		// .load( url [, data ] [, complete ] )
		// Function( String responseText, String textStatus, jqXHR jqXHR ) - 응답하는객체, 응답받은 상태, 비동기객체
		$("#demo").load("ex02_ajax_info.txt", function(responseText, textStatus, jqXHR){
			// alert(responseText);
			if(textStatus == "success"){
				// $(this).append(); // append를 하지 않아도 load가 자동으로 가져옴
				$(this).empty(); // 기본적으로 가져오는 것을 지우겠다.
				
				// 아래 코딩으로 가공해서 가져옴
		        var names =  responseText.split(",");
		        for (let name of names) {
		            $("#demo").append( $("<li></li>").text( name ) );
		        }
			}else if(textStatus == "error"){
				
			}
		});
	});
</script>

</body>
</html>