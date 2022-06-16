<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 16. - 오후 12:45:26</title>
</head>
<body>
<h3>ex07.jsp</h3>
<pre>
	p292 JSTL(JSP Standard Tag Library)
	- 스크립트릿 코드의 사용을 줄이면서 더욱 간결하고 이해하기 쉬운 JSP 코드를 작성할 수 있음
	- https://mvnrepository.com/artifact/javax.servlet/jstl/1.2 : 링크에서 jstl 다운로드 받고 lib 폴더에 복사 붙여넣기
	
	form 태그 2개 생성 후 name과 age를 입력받도록 함
	form name, age -> submit(GET 방식) -> 요청URL : /member/get								-> doGet() -> ex07_ok.jsp로 리다이렉트
																-> Member.java(서블릿) 생성
	form name, age -> submit(POST 방식) -> 요청URL : /member/post								-> doPost() -> ex07_ok.jsp 포워딩
</pre>
<%
	String contextPath = request.getContextPath();
%>

<form method="get" action="<%= contextPath %>/member/get">
 name : <input type="text" name="name" value="홍길동"><br>
 age : <input type="text" name="age" value="20"><br>
 <input type="submit" value="GET 전송">
</form>

<form method="post" action="<%= contextPath %>/member/post">
 name : <input type="text" name="name" value="홍길동"><br>
 age : <input type="text" name="age" value="20"><br>
 <input type="button" value="POST 전송"><!-- js로 유효성 검사 후 보내기 위해서 -->
</form>

<script>
	// 입력값에 대한 유효성 검사를 한 후에 전송을 하기 위한 의도
	$("form:last-of-type :button").on("click", function () {
		// parent() 해도 되고 아래처럼 코딩해도 됨
		$(this).parents("form").submit();
	});
</script>
</body>
</html>