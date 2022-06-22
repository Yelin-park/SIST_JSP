<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 22. - 오후 3:20:12</title>
</head>
<body>
<h3>ex09.jsp</h3>
<pre>
	p253 [EL 자료형 / 리터럴]
	 1. boolean - true, false
	 2. 정수 - 10, -10
	 3. 실수 - 3.14	=> java.lang.Double 클래스 타입으로 잡힘
	 4. 문자열 - "" ''
	 5. NULL - null
</pre>

${true }<br>
${10 }<br>
${-10 }<br>
${3.14 }<br>
${"홍\"길동" }<br>
${'홍\'길동' }<br>
${null }<br>


<pre>
	[EL 연산자]
	 1. 수치연산자		+ - * / %
						/ == div
						% == mod 문자로 사용 가능
</pre>

${3 + 5 }<br>
${3 - 5 }<br>
${3 * 5 }<br>
${3 / 5 } == ${3 div 5 }<br>
${3 % 5 } == ${3 mod 5 }<br>


<pre>
	[EL 연산자]
	 2. 비교연산자
	 ==		eq
	 !=		ne
	 <		lt
	 >		gt
	 <=		le
	 >=		ge
</pre>

${ 5 == 3 } == ${5 eq 3 }<br>
${ 5 != 3 } == ${5 ne 3 }<br>
${ 5 < 3 } == ${5 lt 3 }<br>
${ 5 > 3 } == ${5 gt 3 }<br>
${ 5 <= 3 } == ${5 le 3 }<br>
${ 5 >= 3 } == ${5 ge 3 }<br>

<pre>
	[EL 연산자]
	 3. 논리 연산자
	 &&		and
	 ||		or
	 !		not
</pre>

${ true && true } == ${true and true }<br>
${ true || true } == ${true or true }<br>
${ !true } == ${not true }<br>

<pre>
	*** empty 연산자 ***
	값이 null이 와도 true
	값이 ""(빈문자열)이 와도 true
	배열의 길이가 0이어도 true
	빈 Map이 와도 true
	빈 Collection이 와도 true(ex. empty list == true)
	
	위의 경우 외에는 empty 연산자의 결과는 false를 리턴한다.
</pre>

${empty "" }<br>
${empty null }<br>

<pre>
	[삼항 연산자]
	? :
</pre>
</body>
</html>