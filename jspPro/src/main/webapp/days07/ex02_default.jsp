<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="auth.jspf" %>
<!-- include 디렉티브 사용 auth.jspf -->
<%-- <%
	// 인증(로그인)한다면 쿠키이름(auth)으로 쿠키값(로그인ID) 저장
	String cname = "auth";
	String logonID = null;
	
	// com.util.Cookies.java
	// Cookies.java 객체 생성 -> 생성자 호출 -> CookieMap(key-쿠키이름, value-쿠키객체)
	Cookies cookies = new Cookies(request);
	if(cookies.exists(cname)){ // 쿠키이름에 해당하는 쿠키가 존재하니?
		// 있으면 로그인을 했다(인증)
		logonID = cookies.getValue(cname); // 쿠키 이름으로 쿠키값을 가져와서 ID변수에 저장
	}
%> --%>
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
<h3>ex02_default.jsp - 메인페이지</h3>

<%
	if(logonID == null){ // 로그인(인증)X
%>
<div id="logon">
  <form action="ex02_logon.jsp">
      아이디 : <input type="text" name="id" value="admin" /><br>
    비밀번호 : <input type="password" name="passwd" value="1234" /><br>
    <input type="submit" value="로그인" />
    <input type="button" value="회원가입" /> 
    <!-- ex02_logon.jsp에서 넘어오는 ?error가 있을 때 보여야 함 -->
    <%
    	String error = request.getParameter("error");
    	if(error != null){
	%>
		<span style="color:red">로그인 실패했습니다.</span>
	<%    		
    	}
    %>
    <script>
     	$(function () {
			$("#logon span").fadeOut(5000); // 천천히 5초동안 사라지게하겠다.
		});
    </script>
  </form>
</div>
<%		
	}else{ // 로그인(인증)O
%>
<div id="logout">
 [<%= logonID %>]님 환영합니다.<br>
 <a href="ex02_logout.jsp">로그아웃</a>
</div>
<%		
	}
%>

<!-- 로그인 하지 않아도 모두가 사용하는 메뉴 -->
<a href="/jspPro/cstvsboard/list.htm">게시판</a><br>
<a href="#">공지사항</a><br />

<!-- 로그인(인증)해야 사용하는 메뉴 -->
<% 
	if(logonID != null){
%>
<a href="#">일정관리</a><br>
<a href="#">자료실</a><br>
<%		
	}
%>

<!-- 인증 + 권한(관리자) -->
<%
	//auth 쿠키 이름에 값이 없어서 null이라서 logonID != null 안하면 500 에러
	if(logonID != null && logonID.equals("admin")){ 
%>
<a href="#">급여관리</a><br>
<a href="#">사원관리</a><br>
<%		
	}
%>

</body>
</html>