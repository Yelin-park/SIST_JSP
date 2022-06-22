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
<title>2022. 6. 22. - 오전 9:21:05</title>
</head>
<body>
<h3>ex02_05.jsp - 쿠키 수정</h3>
<%!
	// js에서 getCookie(name)
	// 쿠키이름 -> 쿠키 값 반환하는 메서드
	public String getCookie(String cname, HttpServletRequest request) throws Exception{
		// request.getCookies(); 필요
		String cvalue = null;
		
		Cookie[] cookies = request.getCookies(); // 모든 쿠키를 가져와서
		for(Cookie c:cookies){ // 반복작업으로
			if(c.getName().equals(cname)){ // 쿠키이름에 해당하는 쿠키이름과 같다면
				cvalue = URLDecoder.decode(c.getValue(), "UTF-8"); // 쿠키의 값을 디코딩한 후 cvalue에 담고
				break; // 반복문 빠져나오기
			} // if
		} // for
		
		return cvalue;
	}
%>

<form action="ex02_05_ok.jsp">
<!-- ex02_05.jsp?ckbCookie=name&ckbCookie=age -->
<%
	String[] edit_cnames = request.getParameterValues("ckbCookie"); // 모든 쿠키 이름이 넘어옴
	for(int i=0; i < edit_cnames.length; i++){
		String cname = edit_cnames[i]; 
%>
	<!-- 표현식에서 선언문으로 선언된 메서드 getCookie()를 호출할 수 있다. -->
	<li><%= cname %> : <input type="text" name="<%= cname %>" value="<%= getCookie(cname, request) %>"></li>
<%		
	} // for
%>
<input type="submit" value="쿠키수정">
</form>
</body>
</html>