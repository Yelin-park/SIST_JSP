<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/jspPro/days13/httpRequest.js"></script>
<title>2022. 7. 1. - 오전 9:04:07</title>
</head>
<body>
<h3>ex02.jsp</h3>

<pre>
	비동기적으로 처리하는 기술 = ajax
	ex02_cd_catalog.xml -> 버튼 클릭할 때 js를 사용해서 ajax(비동기적)를 사용해 데이터를 읽어옴
							js로 table로 데이터를 구성해서 화면에 출력
							
	ajax = 비동기적으로 백그라운드에서 서버를 갔다오는것							
</pre>

<button type="button" onclick="loadXml();">Get My CD Collection</button>
<br>
<br>
<p id="demo">
	<table id="tblajax"></table>
</p>

<script>
	function loadXml() {
		// [httpRequest.js] js에서 ajax 처리할 수 있는 라이브러리 생성
		// var httpRequest로 전역으로 선언되어져 있음
		// sendRequest(url, param, callback, method);
		sendRequest("ex02_cd_catalog.xml", null, callback, "GET");
						
	} // loadXml
	
	function callback() {
		if(httpRequest.readyState == 4){ // 요청 완료
			if(httpRequest.status == 200){ // 응답 성공
				// 에러 확인하고 httpRequest.status == 304(에러번호)로 띄워보기
				// 응답 받은 xml 데이터를 가지고 table 구성 - DOM
				// xml = responseXML
				var xmlDoc = this.responseXML; // this
				// alert(xmlDoc);
				
				var tblContent = "<table id='tblajax' border='1'>";
				
				tblContent += "<tr><th>TITLE</th><th>ARTIST</th></tr>";
				
				// DOM 메서드 - core(코어 = 공통적인것), html, xml DOM 3가지
				// var cdList = xmlDoc.querySelectorAll("CATALOG CD"); // CATALOG 안에 모든 CD 태그를 가져오겠다.
				var cdList = xmlDoc.getElementsByTagName("CD"); // HTML DOM 메서드
				for(var i = 0; i < cdList.length; i++){
					tblContent += "<tr>";
					tblContent += "<td>";
					tblContent += cdList[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue;				
					tblContent += "</td>";
					
					tblContent += "<td>";
					tblContent += cdList[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue;
					tblContent += "</td>";
					tblContent += "</tr>";					
				} // for
				
				tblContent += "</table>";
				
				document.getElementById("demo").innerHTML = tblContent;
				
			} else {
				alert("> Ajax 요청 실패" + httpRequest.status);
			}
		} 
	} // callback
</script>

<script>
/*
// 1. XmlHttpRequest 객체(xhr) 생성
var xhr = new XMLHttpRequest(); // 크롬 브라우저이기 때문에 그냥 객체 바로 생성

// 2. xhr 요청전/요청가는중/[요청완료]/[요청후응답완료] 등등 상태가 바뀔 때 마다 일어나는 이벤트를 처리하면서 콜백함수 등록
xhr.onreadychange = function () { // 콜백함수
	if(httpRequest.readyState == 4){ // 요청 완료
		if(httpRequest.status == 200){ // 응답 성공
			// 에러 확인하고 httpRequest.status == 304(에러번호)로 띄워보기
			// 응답 받은 xml 데이터를 가지고 table 구성 - DOM
			// xml = responseXML
			var xmlDoc = xhr.responseXML; // this가 아니라 xhr를 줘야함
			alert(xmlDoc);
		} else {
			alert("> Ajax 요청 실패" + httpRequest.status);
		}
	} 
};

// 3. xhr.open(method, url, boolean)
xhr.open("GET", "ex02_cd_catalog.xml", true);

// 4. sned()
xhr.send(null); // 파라미터가 없는 상태
*/
</script>
</body>
</html>