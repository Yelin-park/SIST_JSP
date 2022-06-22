<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="ex06_auth.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 22. - 오전 10:12:11</title>
<style>
  div{
    border: 1px solid gray;
    width:300px;
    height:100px;
    padding:20px;
  }
</style>
</head>
<body>
<h3>ex06_default_EL_JSTL.jsp - 메인페이지</h3>

<c:if test="${empty logonID }"><!-- == if(logonID == null){ -->
<div id="logon">
  <form action="ex06_logon.jsp">
      아이디 : <input type="text" name="id" value="admin" /><br>
    비밀번호 : <input type="password" name="passwd" value="1234" /><br>
    <input type="submit" value="로그인" />
    <input type="button" value="회원가입" /> 
    
    <!-- ex06_logon.jsp에서 넘어오는 ?error가 있을 때 보여야 함 -->
	<c:if test="${not empty param.error }">
		<span style="color:red">로그인 실패했습니다.</span>
	</c:if>

    <script>
     	$(function () {
			$("#logon span").fadeOut(5000); // 천천히 5초동안 사라지게하겠다.
		});
    </script>
  </form>
</div>
</c:if>

<c:if test="${not empty logonID }">
<div id="logout">
 [<%= logonID %>]님 환영합니다.<br>
 <a href="ex06_logout.jsp">로그아웃</a>
</div>
</c:if>

<!-- 로그인 하지 않아도 모두가 사용하는 메뉴 -->
<a href="/jspPro/cstvsboard/list.htm">게시판</a><br>
<a href="#">공지사항</a><br />

<!-- 로그인(인증)해야 사용하는 메뉴 -->
<c:if test="${not empty logonID }">
 <a href="#">일정관리</a><br>
 <a href="#">자료실</a><br>
</c:if>

<!-- 인증 + 권한(관리자) -->
<c:if test="${logonID eq 'admin' }">
 <a href="#">급여관리</a><br>
 <a href="#">사원관리</a><br>
</c:if>

</body>
</html>