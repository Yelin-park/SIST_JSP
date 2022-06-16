<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% // 로그인 실패/성공만 나타낼 것이라 html 태그 다 삭제, 위의 JSP 선언문은 둬야지 jsp 파일로 인식 %>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	// DB의 회원테이블에서 id, password 확인 후 로그인 성공, 실패.. (작업은 현재 생략 여기는 리다이렉트 기능 설명)
	String location = "ex04.jsp";
	if(id.equals("홍길동") && passwd.equals("1234")){
		// 로그인 성공
		// 리다이렉트할 때 한글 파라미터는 반드시 인코딩을 해야한다. *** 
		location += "?id=" + URLEncoder.encode(id, "UTF-8") + "&ok"; // 파라미터 값으로 다음과 같이 넘기겠다.
	} else {
		// 로그인 실패
		location += "?error";
	}
	
	response.sendRedirect(location); // 해당 페이지를 다시 요청해라
%>