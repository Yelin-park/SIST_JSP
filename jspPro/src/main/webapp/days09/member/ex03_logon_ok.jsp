<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <h3>ex03_logon_ok.jsp</h3> -->
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	// 로그인 성공 가정
	session.setAttribute("member", id); // member 라는 세션 이름으로 id 세션 값을 저장

	String location = "/jspPro/days09/ex03.jsp"; // 메인페이지 경로
	
	// 무조건 로그인 성공하면 메인페이지로 이동할 게 아니라 글목록, 글쓰기, 기타 눌렀던 링크 태그의 경로로 이동해야함
	// 글목록 요청URL -> 로그인X -> 로그인 페이지_ok.jsp
	String referer = (String)session.getAttribute("referer"); // 원래 가고자 했던 경로 값
	if(referer != null){
		location = referer; // location에 할당하고
		session.removeAttribute("referer"); // 세션 속성 삭제하기
	} // if	
	
	response.sendRedirect(location); // 세션을 가지고 메인페이지로 이동


%>
