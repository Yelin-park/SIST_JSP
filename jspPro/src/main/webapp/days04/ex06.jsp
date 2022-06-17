<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 17. - 오후 4:26:26</title>
</head>
<body>
<h3>ex06.jsp</h3>
<!-- application은 톰캣이 죽을 때 까지 살아있어서 name은 값이 나옴 -->
a name : <%= application.getAttribute("name") %><br>
s age : <%= session.getAttribute("age") %><br>
r addr : <%= request.getAttribute("addr") %><br>
p color <%= pageContext.getAttribute("color") %><br>

<pre>
	p132 JSP 기본 객체와 4가지 영역(Scope)
	1. application scope : 웹 사이트 전체에 사용되는 영역
	2. session scope : 하나의 브라우저에서 사용되는 영역			=> 세션 수업할 때 다시
						ㄴ 접속을 한 다음에 접속을 끊을 때 까지의 영역
						ㄴ 사이트를 닫은 후에 마지막 요청은 20분 뒤에 사라지며 세션 시간은 설정할 수 있음 
	3. request scope : 하나의 요청 처리할 때 사용되는 영역		-> 포워딩이나 리퀘스트(링크태그로는 안됨)
	4. page scope : 하나의 JSP 페이지를 처리할 때 사용되는 영역
					ex01.jsp
					ex02.jsp

	[범위]
	큼 1 > 2 > 3 > 4 작음
	
	
	각각의 객체 마다 아래 메서드가 있음
	XXXX.setAttribute() 		ex) application.setAttribute() 이런 식
	XXXX.getAttribute()	
	.getAttributeNames() 메서드로 Enum(열거형)으로 이름을 가져옴 -> 잘 사용 X
	.removeAttribute(String name); -> 잘 사용 X
	
	
	예제)
	ex06_02.jsp
	ex06_03.jsp
	ex06_04.jsp
	
</pre>
</body>
</html>