<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 21. - 오후 4:38:00</title>
</head>
<body>
<h3>ex02_03.jsp</h3>

<form action="">
<%
	String cname, cvalue;

	// ex02_03.jsp 요청할 때(ex02.jsp에서 쿠키 확인 클릭)
	// 클라이언트(웹 브라우저)에서 저장된 쿠키 정보를 읽어서 서버에게 전달(전송)		-> 우리가 전달 안함 자동으로 전달됨 그것이 바로 쿠키..
	// 서버에게 전달된 쿠키를 얻어올 때는..
	Cookie[] cookies = request.getCookies(); // 전달된 모든 쿠키들
	for(Cookie c : cookies){
		cname = c.getName(); // 쿠키 이름
		// 쿠키 값이 한글일 때 UTF-8로 인코딩을 했기 때문에 다시 디코딩을 해주어야함 ***
		cvalue = URLDecoder.decode(c.getValue(), "UTF-8"); // 쿠키 값
%>
	<input type="checkbox" name="ckbCookie" value="<%= cname %>"><%= cname %> - <%= cvalue %><br>
<%
	}
%>
</form>
<br />
<br />
<!--
체크박스 체크 후 쿠키 삭제 링크 태그를 클릭하면
value 속성값 = 쿠키 이름 -> 쿠키의 이름 값을 가져와서
ex02_04.jsp로 넘기면서 체크박스의 name 속성 값으로
ex02_04.jsp?ckbCookie=name&ckbCookie=age 이렇게 넘길 예정
 -->
<a href="ex02_04.jsp">쿠키 삭제</a><br>
<a href="ex02_05.jsp">쿠키 수정</a><br>
<a href="ex02.jsp">쿠키 Home</a><br>

<!-- 기억 *** -->
<script>
	$("a").on("click", function (event) {
		event.preventDefault(); // a 링크 태그의 이동하는 기본 기능을 막기
		
		// 체크된 체크박스를 얻어와서 그 박스의 value 속성 값을 얻어와야함, 쿠키이름을 얻어오면 코딩으로 파라미터 값을 만들어야함
		// 일일히 ex02_04.jsp?ckbCookie=name&ckbCookie=age 이렇게 만들 필요 없이
		// (기억) jQuery serialize() 메서드
		// ckbCookie=name&ckbCookie=age  이와 같은 쿼리스트링을 만들어줌
		var queryString = $("form").serialize();
		// $(this).attr("href") = 현재 클릭한 a 링크 태그의 href 속성을 가져오겠다.
		// href 속성 값을 ex02_04.jsp?ckbCookie=name&ckbCookie=age 이렇게 만들겠다.
		location.href = $(this).attr("href") + "?" + queryString; 		
	});
</script>
</body>
</html>