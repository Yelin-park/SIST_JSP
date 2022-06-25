<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <h3>ex03_logout.jsp</h3> -->
<%
	// 강제로 세션 종료(제거)
	session.invalidate();
	
	String location = "/jspPro/days09/ex03.jsp"; // 메인페이지 경로
	response.sendRedirect(location); // 세션을 가지고 메인페이지로 이동
%>