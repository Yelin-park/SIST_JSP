<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- <h3>ex02_04.jsp - 쿠키 삭제</h3> -->
<!-- ex02_04.jsp?ckbCookie=name&ckbCookie=age 이렇게 파라미터가 넘어옴 -->
<%
	// js 쿠키 삭제할 때는 만료시점을 과거로 설정해서 삭제했음
	// JSP 쿠키 삭제는? c.setMaxAge(-1) -> 브라우저를 종료할 때 자동 삭제해라
	//	0을 주면 쿠키 바로 삭제해라
	
	String[] del_cnames = request.getParameterValues("ckbCookie"); // 모든 쿠키 이름이 넘어옴
	for(int i=0; i < del_cnames.length; i++){
		Cookie c = new Cookie(del_cnames[i], "");
		c.setMaxAge(0); // 응답 받으면 즉시 삭제하고
		response.addCookie(c); // 
	}
	
%>

<!-- 위의 자바 코딩을 명령받은 브라우저에서 띄움 -->
<script>
	alert("체크한 쿠키를 모두 삭제 완료하였습니다.");
	location.href = "ex02_03.jsp"; // 경로 이동
</script>