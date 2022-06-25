package com.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/*@WebFilter("/days09/board/*")*/ // days09의 board 폴더 안에 있는 것들의 모든 요청이 일어날 때 이 필터를 거치겠다.
public class LoginCheckFilter implements Filter {

	// 디폴트 생성자
    public LoginCheckFilter() {
    	
    } // LoginCheckFilter

    // 웹 컨테이너 소멸될 때 호출
	public void destroy() {
		
	} // destroy

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("> LoginCheckFilter.doFilter() 호출");
		
		// session - member(세션이름) : logonID(세션값)
		// 이 안에서 session 객체를 바로 얻어올 수 없음
		// 서블릿에서 세션을 사용하는 방법
		
		// 여기서 사용하는 서블릿은 HttpServletRequest가 아니라 해당 서블릿의 부모인 ServletRequest 이기 때문에 다운 캐스팅 필요
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		
		String logonID = null;
		boolean isLogon = false; // 로그인 여부를 판단하는 변수
		
		HttpSession session = httpRequest.getSession(false);
		
		if(session != null) {
			logonID = (String)session.getAttribute("member");
			if(logonID != null) {
				isLogon = true; // 로그인을 했다.
			} // if
		} // if
		
		// System.out.println(">>> isLogon : " + isLogon);
		// board/* -> board 폴더 안에 있는 JSP 페이지 로그인을 했는지 체크
		// isLogon true(로그인 O), false(로그인 X)
		if(isLogon) {
			chain.doFilter(request, response); // 로그인을 했다면 그 다음으로 갈 필터나 페이지로 이동
		} else {
			// 원래 가고자 했던 요청URI 확인 / 저장
			// page scope, request scope는 X / session scope, application scope, DB저장, 쿠키 중 용도에 맞춰서 사용하기
			String referer = httpRequest.getRequestURI(); // /jspPro/days09/board/ex03_write.jsp
			session.setAttribute("referer", referer);
			
			// 로그인 페이지로 이동
			String location = "/jspPro/days09/member/ex03_logon.jsp";
			httpResponse.sendRedirect(location);
		} // if		
	
	} // doFilter

	public void init(FilterConfig fConfig) throws ServletException {
		
	} // init

}
