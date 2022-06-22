package days07;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/days07/ex05.htm")
public class Ex05_Session extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Ex05_Session() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Ex05_Session.doGet() 호출");
		
		// JSP 페이지에서 세션을 사용하는 방법 ? JSP 기본 객체 중 session 사용(setAttribute, getAttribute)
		// 서블릿에서 세션을 사용하는 방법 ? request.getSession() 메서드를 통해서 세션 객체를 얻어옴

		// [주의] 아래 2가지의 차이점 이해
		// 1. request.getSession(); - 세션이 존재하지 않으면 새로운 세션 객체를 생성해서 반환
		// 2. request.getSession(false); - 세션이 존재하지 않으면 null을 반환
		HttpSession session = request.getSession(false);
		if(session != null) {
			String 세션값 = (String) session.getAttribute("세션명");
		}else {
			
		}
		
	} // doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	} // doPost

}
