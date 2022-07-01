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
<title>2022. 7. 1. - 오전 10:39:18</title>
</head>
<body>
<h3>ex04.jsp</h3>

<pre>
	버튼 생성 후 버튼을 클릭하면 서버에
	1) ex04_dept.xml 으로 만든 데이터를 읽어와서
	2) ex04_dept.json 으로 만든 데이터를 읽어와서
	ex04.jsp로 ajax 기술로 읽어와서 출력	
</pre>

<button onclick="xmlAjax();">ex04_dept.xml 파일을 js ajax 읽어와서 table 출력</button>
<br>

<button onclick="jsonAjax();">ex04_dept.json 파일을 js ajax 읽어와서 table 출력</button>
<br>

<p id="demo"></p>

<script>
	function jsonAjax() {
		sendRequest("ex04_dept.json", null, callbackJson, "GET");
	} // jsonAjax
	
	function callbackJson() {
		if(httpRequest.readyState == 4){ // 요청 완료
			if(httpRequest.status == 200){ // 응답 성공
				// json 데이터 응답 == 문자열
				var deptJSON = this.responseText; 
				
				// json -> js Object 변환
				// departments [{},{},{}] 구조로 json 파일에 있음
				var deptJsObject = JSON.parse(deptJSON);
				var deptArray = deptJsObject.departments; // 부서정보를 가지고 있는 배열
				
				var tblContent = "<table id='tblajax' border='1' borderColor='red'>";
				tblContent += "<tr><th>deptno</th><th>dname</th><th>loc</th></tr>";
				
				for (var i = 0; i < deptArray.length; i++) {
					var dept = deptArray[i]; // 하나의 부서정보 객체를 가져옴 {"deptno":10, "dname":"ACCOUNTING", "loc":"NEW YORK"}
					
					tblContent += "<tr>";
					tblContent += "<td>";
					tblContent += dept.deptno;		
					tblContent += "</td>";
					
					tblContent += "<td>";
					tblContent += dept.dname;
					tblContent += "</td>";
					
					tblContent += "<td>";
					tblContent += dept.loc;
					tblContent += "</td>";					
					
					tblContent += "</tr>";
				} // for
				
				tblContent += "</table>";
				document.getElementById("demo").innerHTML = tblContent;					
				
			} else {
				alert("> Ajax 요청 실패" + httpRequest.status);
			}
		} 
	} // callbackJson

	
	
	function xmlAjax() {
		sendRequest("ex04_dept.xml", null, callback, "GET");
	} // xmlAjax
	
	function callback() {
		if(httpRequest.readyState == 4){ // 요청 완료
			if(httpRequest.status == 200){ // 응답 성공
				// 에러 확인하고 httpRequest.status == 304(에러번호)로 띄워보기
				// 응답 받은 xml 데이터를 가지고 table 구성 - DOM
				// xml = responseXML
				var xmlDoc = this.responseXML; // this
				// alert(xmlDoc);
				
				var tblContent = "<table id='tblajax' border='1'>";
				
				tblContent += "<tr><th>deptno</th><th>dname</th><th>loc</th></tr>";
				
				// DOM 메서드 - core(코어 = 공통적인것), html, xml DOM 3가지
				// var cdList = xmlDoc.querySelectorAll("CATALOG CD"); // CATALOG 안에 모든 CD 태그를 가져오겠다.
				var cdList = xmlDoc.getElementsByTagName("dept"); // HTML DOM 메서드
				for(var i = 0; i < cdList.length; i++){
					tblContent += "<tr>";
					tblContent += "<td>";
					tblContent += cdList[i].getElementsByTagName("deptno")[0].childNodes[0].nodeValue;				
					tblContent += "</td>";
					
					tblContent += "<td>";
					tblContent += cdList[i].getElementsByTagName("dname")[0].childNodes[0].nodeValue;
					tblContent += "</td>";
					
					tblContent += "<td>";
					tblContent += cdList[i].getElementsByTagName("loc")[0].childNodes[0].nodeValue;
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
</body>
</html>