<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 23. - 오전 9:40:42</title>
</head>
<body>
<h3>ex04.jsp</h3>

<pre>
	1) 코어
		ㄱ. 변수 지원 - set(변수 설정), remove(변수 제거)
		ㄴ. 흐름 제어(제어문) - forEach(컬렉션, 맵을 반복적으로 처리)
						   - if(조건에 따라 내부 코드 수행)
						   - choose(== switch)
						   - forTokens(구분자로 분리된 각각의 토큰을 처리)
		ㄷ. URL 처리 - import(URL을 사용하여 다른 자원 결과 삽입)
					- redirect(지정한 경로로 리다이렉트)
					- url(URL 재작성)
		ㄹ. 기타 - catch(예외 처리), out(JspWriter 내용 출력)
</pre>

<pre>
	c:set 태그 - EL의 변수 값, EL 변수의 프로퍼티(속성) 값을 지정할 때 사용
	 선언형식)
	 c:set var="변수명" value="변수에 해당되는 값" [scope="4가지 영역"]
	 c:set var="변수명">값/c:set
	 value에는 표현식과 $EL을 사용할 수 있다.
</pre>
<%
	String name = "익순이";
	// EL은 4가지 스코즈 중 하나에 저장을 해야 사용 가능함
	request.setAttribute("xxx", name);
%>
<c:set var="name1" value="익순이"></c:set>
<c:set var="name2">익순이</c:set>
<c:set var="fullname1" value="<%= name %>"></c:set>
<c:set var="fullname2" value="${xxx }"></c:set>

<!-- c:set에 저장된 변수는 EL로 출력 가능 -->
> Name1 = ${ name1 }<br>
> Name2 = ${ name1 }<br>
> Name3 = ${ fullname1 }<br>

<c:remove var="fullname2"/><!-- 변수삭제 -->
> Name4 = ${ fullname2 }<br><!-- 값 없음 -->

</body>
</html>