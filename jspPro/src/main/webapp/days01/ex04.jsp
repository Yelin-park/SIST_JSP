<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 14. - 오후 3:31:43</title>
</head>
<body>
<h3>ex04.jsp</h3>
<!-- 1+2+3+4+5+6+7+8+9+10=55 -->

<%
	int sum = 0;
	for(int i=1; i<=10; i++){
		// System.out.printf("%d+", i); // cmd 창에 출력됨
		// 서버 -> 클라이언트 출력 전송
		// JSP 제공하는 기본 객체 중에 하나 : out 객체 - 출력
		// out.append(i + "+"); // append() 매개변수 string만 가능
		out.print(i); // print()는 매개변수 int만 가능
		if( i != 10){ // 10이 아닐때만 + 출력
%>+<%
		}
		sum += i;
	} //for
%>=<%= sum %>
</body>
</html>