<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- <h3>ex02_02_ok.jsp</h3> -->
<%
// 1. 쿠키 생성
	String cookieName = request.getParameter("cookieName");
	String cookieValue = request.getParameter("cookieValue");
	// JSP 반드시 주의 - 쿠키 값이 한글일 경우 UTF-8 인코딩 필요 ***
	// Cookie c = new Cookie(쿠키이름, 쿠키값);
	Cookie c = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8"));
	c.setMaxAge(-1); // 만료시점 설정, -1 값으로 브라우저 닫을 때 쿠키 자동 제거
	// c.setDomain(domain); // 도메인 설정 가능 안주면 localhost 들어가짐
	// c.setPath(uri); // 경로 설정 가능 안주면 / 잡혀있음
	
// 2. 생성된 쿠키 응답
	response.addCookie(c); // 클라이언트에게 쿠키를 생성하라는 응답을 해주고
	
// 3. 리다이렉트
	String location = "ex02.jsp";
	response.sendRedirect(location);
%>


