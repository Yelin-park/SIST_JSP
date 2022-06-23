package days08.mvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 로직을 처리하는 핸들러의 공통되는 것들
public interface CommandHandler {
	
	// 로직 처리 메서드
	// 리턴 자료형 왜 String? list.jsp / write.jsp와 같이 응답할 페이지를 돌려주기 위해서 
	// 포워딩 | 리다이렉트 + JSP 페이지 - 방식과 페이지를 둘 다 돌려줘야한다면 클래스를 하나 선언해서 리턴자료형으로 넣으면 됨
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
