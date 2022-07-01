<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 7. 1. - 오전 9:50:25</title>
</head>
<body>
<h3>ex03.jsp</h3>

<pre>
	https://www.json.org/json-en.html
	ajax == xml 데이터를 비동기적으로 처리하는 js 기술
	[JSON] 데이터 형식을 xml 파일보다 더 많이 사용한다. 이유? 가볍고 편리해서
	
	1. JSON == JavaScript Object Notation
	2. js로 객체 표기화 하겠다는 방법(형식)
	3. 가벼운 데이터 교환 형식
	4. 사람이 읽고 쓰는 것이 훨씬 쉬움
	5. 기계가 구문 분석하고 생성하기 쉽다.
	
	6. 예)
	클라이언트		-> ajax ->		서버
				요청할 때 JSON 사용 가능
				응답받을 때 JSON 사용 가능
				
	7. JSON 두 가지 구조
		- 어떤 이름으로 어떤 값을 주는 한쌍들의 모임 -> 이름:값
	
	8. JSON 선언 형식
	{ String : value } == { "이름" : 숫자, "이름" : 문자, "이름" : 값, "이름" : 값 ... }
	
	value(값)로 들어갈 수 있는 것들
	object {}, array [], 'string', number, 'true', 'false', 'null'
	String인 경우 " 쓰고 싶다면 \" 역슬래쉬 사용하여 찍기
	
	ex)  {
			"age" : 20,	- number
			"name" : "홍길동", - string
			"array" : [1,2,3,4,5], -array
			"object" : {}, - object
			"이름" : "false", - false
			"이름" : "true", - ture
			"이름" : "null" - null
		 }

	// 응용 복합
	{ "emp":[{
			empno: 7369
			ename: "KING"
		  }, {}, {}, {}]
	}
	
	9. 예
		1) js Object 선언
		var person = {
			name:"admin",
			age:20,
			addr:"SEOUL"
		};
		
		2) 위의 js Object를 JSON 형식으로 변환
		
		var personJSON = '{
			"name" : "admin",
			"age" : 20,
			"addr" : "SEOUL",
			"tel" : "null",
			"cars" : ["KIA", "BMW"],
			"color" : ["black", "white"],
			"gender" : "true"								
		}';
	
	10. JSON 사용할 때 주의할 점
		js 문자열 = "문자열" '문자열'
		JSON 문자열 = "문자열"			'' 홑따옴표 사용X
	
	11. JSON 데이터를 가진 파일
		ㄱ. 확장자 : .json
		ㄴ. MIME 유형 : "application/json"
	
</pre>
</body>
</html>