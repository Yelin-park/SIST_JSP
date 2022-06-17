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
<title>2022. 6. 17. - 오후 3:25:08</title>
</head>
<body>
<h3>ex05_04.jsp</h3>

<pre>
	[p121 JSP 기본 객체 중 application 객체]
	1. 웹 애플리케이션과 관련된 기본 객체(웹 사이트)
	2. 모든 JSP 페이지에서 공유하는(=1개) 기본 객체
	3. 모든 JSP 페이지에서 공유하는 정보를 저장/읽기
	
	예) web.xml
		<context-param> 태그 추가해서 param-name과 param-value를 설정해서
		아래 2가지 메서드로 읽어온다.		
		application.getInitParameter(String name); - name에 해당하는 value 값을 읽어옴 
		application.getInitParameterNames(); - param-name을 읽어옴
		
</pre>

<h3>application 기본 객체 - 서버에 대한 정보 얻기</h3>
서버 정보 : <%= application.getServerInfo() %><br>
서블릿 규약 메이저 버전 : <%= application.getMajorVersion() %><br>
서블릭 규약 마니어 버전 : <%= application.getMinorVersion() %><br>

<hr>
<%
	Enumeration<String> en = application.getInitParameterNames();
	while(en.hasMoreElements()){
		String pName = en.nextElement(); // web.xml에서 설정한 param-name 들을 읽어옴
		String pValue = application.getInitParameter(pName); // web.xml에서 설정한 param-value 들을 읽어옴
%>
	<li><%= pName %> : <%= pValue %></li>
<%		
	}
%>


</body>
</html>