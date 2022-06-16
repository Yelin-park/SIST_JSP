<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 리다이렉트는 새로운 요청이기 때문에 request 파라미터 전달이 안된다. ***
	// 따라서 파라미터를 붙여서 전달해야함
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String params = String.format("?name=%s&age=%s", name, age);
	
	String location = "ex05_finish.jsp" + params;
	response.sendRedirect(location);
%>
