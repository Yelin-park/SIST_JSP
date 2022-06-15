package days02;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
		description = "@WebServlet 어노테이션을 사용해서 자동으로 서블릿 등록하는 예제", 
		urlPatterns = { 
				"/info", 
				"/days02/info.htm"
		})

public class Info extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Info() {
        super();
    }

    // service는 get, post 방식 모든 요청 처리
	// protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	}

	// doGet 함수는 get 방식의 요청이 있으면 호출되어짐
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		response.getWriter()
				.append("GET 방식 요청: ")
				.append(request.getContextPath() + "<br>") // context path를 가져와서 응답을 하겠다.(out 객체)
				.append("> 이름 : " + name + "<br>")
				.append("> 나이 : " + age + "<br>");
	}

	// doPost 함수는 post 방식의 요청이 있으면 호출 되어짐
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 웹 브라우저가 UTF-8로 웹서버(WAS 톰캣(웹컨테이너))로 줄 때 setCharacterEncoding
		// A가 영어로 작성하여 WAS가 영어로 받음(CharacterEncoding) B가 일본사람이라면 일본어로 번역하여 다시 보내줄 때(ContentType)
		response.setContentType("text/html; charset=UTF-8"); // 응답할 때
		request.setCharacterEncoding("UTF-8"); // 요청해서 받을 때
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));		
		
		response.getWriter()
				.append("POST 방식 요청: ")
				.append(request.getContextPath() + "<br>")
				.append("> 이름 : " + name + "<br>")
				.append("> 나이 : " + age + "<br>");
	}

}
