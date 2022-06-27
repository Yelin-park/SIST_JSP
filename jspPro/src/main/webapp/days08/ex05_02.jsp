<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 23. - 오전 10:24:00</title>
</head>
<body>
<h3>ex05_02.jsp</h3>

<pre>
	choose == Java의 switch 문과 거의 동일
	c:choose / c:when / c:otherwise
	텍스트 박스가 1개일 경우에는 값을 입력한 후 엔터를 치면 서브밋이 된다.
</pre>

<form>
 국어 : <input type="text" name="kor">
</form>

<!-- 입력받은 국어점수로 수우미양가 출력 -->
<c:set value="${param.kor }" var="kor"></c:set>
<c:choose>
 <c:when test="${kor >= 90 && kor <= 100 }">수</c:when>
 <c:when test="${kor ge 80 && kor lt 90 }">우</c:when>
 <c:otherwise>가</c:otherwise>
</c:choose>

<!-- 그 외 -->
<%-- 
	<c:if test="${kor>=90 && kor <= 100}">수</c:if>
	<c:if test="${kor ge 80 && kor lt 90}">우</c:if>
	<c:if test="미조건식">미</c:if>
	<c:if test="양조건식">양</c:if>
	<c:if test="가조건식">가</c:if>
 --%>

</body>
</html>