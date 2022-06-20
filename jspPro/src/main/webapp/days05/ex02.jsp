<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 20. - 오전 9:43:25</title>
</head>
<body>
<h3>ex02.jsp</h3>
<pre>
 JSP 프로젝트 : 페이지 모듈화(공통 부분)
 include 액션태그와 include 지시자 차이점을 알고 사용하기
</pre>
<pre>
	p155 Chapter 07 - 페이지 모듈화와 요청 흐름 제어 ***
	1. jsp:접두사	JSP액션태그
	   jsp:include	액션태그 포함한다.
	   
	   웹사이트의 공통 영역 부분인 TOP,	LEFT, FOOTER(BOTTOM) 같은 영역을
	   중복을 제거하기 위해서 별도의 top.jsp, left.jsp, footer.jsp를 만든 후
	   jsp:include 액션태그를 사용해서 각각의 웹 페이지에 추가를 하겠다.
	   
	    > 모든 웹페이지에 공통적인 부분 : top, bottom 이라면..
	   	webapp/layout/top.jsp
	   				 /bottom.jsp
		
		> days05에서만 쓰는 공통적인 부분 : left,right 이라면..			 
	   	webapp/days05/layout/left.jsp
	   						/right.jsp
	   				 
	   	ex02_template.jsp 생성해서 그 안에서 top, bottom, left, right jsp:include 액션태그 사용해서 모듈화
	   
	2. 디렉티브(지시자)
		1) page 지시자
		2) taglib 지시자
		3) include 지시자
		
	***** jsp:include와 include 지시자의 차이점을 이해하고 사용!
	 모든 웹 사이트에 공통 적인 변수가 필요하다면 jsp에 코딩한 후 include 지시자로 모든 웹 페이지에 추가
	 (내가 다는 코멘트)액션태그는 원래 서블릿 객체를 실행시키는 것이고 지시자는 하나의 서블릿 객체가 생성되어짐
	 ex) webapp/include.jspf 생성 후 ex02_02.jsp 13-14라인 코딩
	
	
	3. jsp:forward 액션태그 - p177 읽어보고 넘어가기
	
	4. 기본 객체를 이용한 값 전달(개념) -> 스프링 이해할 때 도움 되어짐
</pre>
</body>
</html>