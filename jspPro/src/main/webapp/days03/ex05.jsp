<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 16. - 오전 10:11:38</title>
</head>
<body>
<h3>ex05.jsp</h3>

<pre>
	1. 리다이렉트(redirect)
	2. 포워딩(forward)
	차이점 설명
	
	1. 리다이렉트
	e05.jsp에서 리다이렉트 링크 클릭 -> ex05_redirect.jsp 요청
	ex05_redirect.jsp에서 ex05_finish.jsp을 다시 새로 요청(새로 요청하기 때문에 파라미터값이 전달X 직접 구현해주어야함)
	ex05_finish.jsp에서 name과 age의 파라미터 값을 찍음 
	
	2. 포워딩
	ex05.jsp에서 포워딩 링크 클릭 -> ex05_forward.jsp 요청 -> 포워딩 때문에 서버에서 직접 finish로 이동
	서버에서 이동하기 때문에 request와 response의 객체가 그대로 전달됨
	
</pre>

<%
	String name = "admin";
	int age = 20;
%>

<!-- a 태그는 GET 방식 요청 -->
<%-- ex05_redirect.jsp?name=<%=name%>&age=<%=age%> : href에 바로 이렇게 줘도 되지만 --%>
<a href="ex05_redirect.jsp">리다이렉트(redirect)</a><br>
<a href="ex05_forward.jsp">포워딩(forward)</a><br>

<script>
	$("a").on("click", function () {
		$(this).attr("href", function (i, val) {
			return val + "?name=<%= name %>&age=<%= age %>";
		});
	});
</script>
</body>
</html>