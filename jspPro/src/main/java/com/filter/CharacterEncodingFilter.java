package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter{
	
	private String encoding;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// web.xml에 filter 등록할 때 encoding:UTF-8
		this.encoding = filterConfig.getInitParameter("encoding");
		if(this.encoding == null) {
			this.encoding = "UTF-8";
		}
	} // init
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("> CharacterEncodingFilter.doFilter() 호출됨");
		// 매번 이렇게 선언하지 않고.. init 메서드에서..
		// request.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding(this.encoding);
		chain.doFilter(request, response); // 다음으로 연결된 필터 또는 자원(JSP) 쪽으로 넘기겠다.
		
	} // doFilter

	@Override
	public void destroy() {
		
	} // destroy

} // class
