<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 22. - 오후 4:27:41</title>
</head>
<body>
<h3>ex09_04.jsp</h3>
<pre>
	p254 표11.1 - EL의 기본 객체
		EL 기본객체				JSP 기본 객체
	1. pageContext  		== page
	2. pageScope			== pageContext.setAttribute("deptn", 10)
		requestScope		== requset.setAttribute("empno", 7369)
		sessionScope		== session.setAttribute()
		applicationScope	== application.setAttribute()
	3. param				== request.getParameter("age")
		param.age
	4. paramValues
		ex) ?name=yaliny&name=hong&name=admin
		paramValues.name	== request.getParameterValues("name")
	5. header				== request.getHeader()
	6. headerValues			== request.getHeaderValues()
	7. cookie				== request.getCookies()
		ㄴ 쿠키 객체
		Map 객체 = key, value
					쿠키이름, 쿠키객체(cookie)
	8. initParam			== application.getInitParameter()
		web.xml
		  <context-param>
   			<description>디버깅 레벨</description>
  			<param-name>debugLevel</param-name>
   			<param-value>3</param-value>
  		  </context-param>
  		  
  		  ${initParam.debugLevel } == param-value인 3을 가져옴
  		  
  		  
  	ex09_04_02.jsp에서 다루기
</pre>
</body>
</html>