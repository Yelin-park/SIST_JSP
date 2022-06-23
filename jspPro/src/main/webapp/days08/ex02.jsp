<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 23. - 오전 9:23:12</title>
</head>
<body>
<h3>ex02.jsp</h3>
<pre>
	[p292 표준 태그 라이브러리(JSTL)]
	사용자(개발자) 편의에 의해서 '커스텀 태그'를 직접 만들어서 사용
	많은 개발자가 공통적으로 만들어 사용하던 커스텀 태그가 있다.
	표준화 태그 제공 -> JSTL 
	
	jsp가 붙은 건 액션 태그 그 외는 JSTL
	ex) c:forEach 등등
	
	- jstl-1.2jar 파일을 lib 폴더에 추가
	
	- JSTL 태그의 종류
		1) 코어 ***** 제일 많이 사용 p297
		 - prefix(접두어) c 사용
		 - uri는 http://java.sun.com/jsp/jstl/core 사용
		 - 주요기능 : 변수 지원, 흐름 제어, URL 처리를 함
		 ex04.jsp - 코어 변수
		 ex05.jsp - 코어 흐름제어
		 
		2) XML
		 - 접두어 x 사용
		 - uri는 http://java.sun.com/jsp/jstl/xml
		 - 주요기능 :  xml
		 
		3) 국제화 p317 (넘어감)
		 - 접두어 fmt
		 - uri는 http://java.sun.com/jsp/jstl/fmt
		 - 주요기능 : 지역의 화폐단위 등, 메시지 형식, 숫자, 날짜 형식
		 
		4) 데이터베이스
		 - 접두어 sql
		 - uri는 http://java.sun.com/jsp/jstl/sql
		 - 주요기능 : SQL을 위해 사용
		  ex03.jsp에서 예제다룸
		  
		5) 함수
		 - 접두어 fn
		 - uri는 http://java.sun.com/jsp/jstl/functions
		 - 주요기능 : 컬렉션 처리, 문자열(String) 처리		
</pre>
</body>
</html>