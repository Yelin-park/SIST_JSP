<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 실제 수정할 쿠키이름, 쿠키값 파라미터 전송 -->
<!-- <h3>ex02_05_ok.jsp</h3> -->
<%
	// ?name=AAA&age= 12
	Enumeration<String> en = request.getParameterNames();
	while(en.hasMoreElements()){
		String cname = en.nextElement(); // 이름을 얻어오고
		String cvalue = request.getParameter(cname); //  쿠키이름에 해당하는 파라미터 값을 얻어와서
		// 쿠키 생성 + 응답
		Cookie c = new Cookie(cname, URLEncoder.encode(cvalue, "UTF-8"));
		c.setMaxAge(-1); // 브라우저 종료할 때 쿠키 삭제
		response.addCookie(c);
	} // while
		
	// location.href로 해도되고 아래 리다이렉트로해도 같은 결과이다.
	String location = "ex02_03.jsp";
	response.sendRedirect(location);
	
%>
