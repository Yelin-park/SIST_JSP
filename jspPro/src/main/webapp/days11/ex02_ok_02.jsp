<%@page import="java.io.DataInputStream"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 28. - 오전 9:19:28</title>
</head>
<body>
<h3>ex02_ok_02.jsp</h3>

<%
	Enumeration<String> en = request.getHeaderNames();
	out.println("> 전송된 헤드 정보 출력 < <br>");
	
	while(en.hasMoreElements()){
		String key = en.nextElement();
		String value = request.getHeader(key);
		out.println(key + " : " + value + "<br>");
	} // while
%>

<h3>서버에 전송된 데이터(스트림 객체) 정보 출력</h3>
<%
	// 읽기 용도 + 바이트 스트림
	ServletInputStream sis = request.getInputStream(); // 서버에 전송된 데이터를 바이트로 가져와 읽음
	DataInputStream dis = new DataInputStream(sis); 
	String line = "";
	while( (line = dis.readLine()) != null ){ 
		out.println( new String(line.getBytes("ISO-8859-1"), "UTF-8" )); // 받아온 바이트 값을 UTF-8 문자열로 바꿈
	} // while
%>
</body>
</html>