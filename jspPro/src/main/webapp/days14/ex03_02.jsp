<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 7. 1. - 오전 10:22:10</title>
</head>
<body>
<h3>ex03_02.jsp</h3>

<pre>
	1. js object -> JSON 변환	JSON.stringify(js object) 메서드
	2. JSON -> js object 변환	JSON.parse(JSON) 메서드
	
	F12 -> application -> Storage -> LocalStorage(로컬저장소) 확인
</pre>

<button onclick="setPerson()">로컬 저장소에 person 정보 쓰기</button>
<br>
<button onclick="getPerson()">로컬 저장소의 person 정보 읽기</button>
<br>


<script>
	// js object
	var person = {
			name:"admin",
			age:20,
			city:"SEOUL"
	};


	function setPerson() {
		var personJSON = JSON.stringify(person);
		console.log("personJSON : " + personJSON);
		// personJSON : {"name":"admin","age":20,"city":"SEOUL"}
		// JSON 문자열 표기법으로 변환되어짐
		// F12 -> application -> Storage -> LocalStorage(로컬저장소) 확인
		localStorage.setItem("personJSON", personJSON);		
	} // setPerson

	
	function getPerson() {
		// JSON 표기법으로 생성된 문자열
		var getPersonJSON = localStorage.getItem("personJSON");
		// JSON -> js object 변환
		var jsObj = JSON.parse(getPersonJSON);
		// 1. name
		console.log("1. name : " + jsObj.name);
		// 2. age
		console.log("2. age : " + jsObj.age);
		// 3. city
		console.log("3. city : " + jsObj.city);
		

	} // getPerson
</script>
</body>
</html>