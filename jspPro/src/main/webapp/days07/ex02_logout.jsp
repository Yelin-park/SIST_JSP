<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="auth.jspf" %>
<!-- <h3>ex02_logout.jsp</h3> -->
<!-- include 디렉티브 사용 auth.jspf -->
<%-- <%
	// 어떤 회원이 로그아웃하는지 알아야 하기 때문에 ID를 가져오는 작업
	String cname = "auth";
	String logonID = null;
	Cookies cookies = new Cookies(request);
	if(cookies.exists(cname)){ // 로그인한 상태라 ID 값이 있는 상태
		logonID = cookies.getValue(cname);
	}
%> --%>
<%
	// 로그아웃시 쿠키 삭제하기 - 만기시점 0 설정
	// auth 쿠키 이름을 가진 
	Cookie c = Cookies.createCookie(cname, "", "/", 0);
	response.addCookie(c);
	
	// ex02_default.jsp 이동	
	// 리다이렉트를 하면 경고창 띄우기 힘들기 때문에 아래 script 태그 안에 코딩
%>
<script>
	alert("[<%= logonID %>]님 로그아웃 하셨습니다.");
	location.href = "ex02_default.jsp";
</script>