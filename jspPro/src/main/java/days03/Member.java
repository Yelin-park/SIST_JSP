package days03;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Member extends HttpServlet{
	// 코딩 다 맞는데 안되면 Servers탭에서 clear 후 restart
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("> /member/get -> doGet() 호출됨");
		
		// ex07_ok.jsp 리다이렉트
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		String location = String.format("/jspPro/days03/ex07_ok.jsp?name=%s&age=%s", URLEncoder.encode(name, "UTF-8"), age);
		response.sendRedirect(location);
	} // doGet

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 요청하는 글꼴에 따라서 읽어오기 위함
		
		System.out.println("> /member/post -> doPost() 호출됨");
		
		String path = "/days03/ex07_ok.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response); // 포워딩 시키면 파라미터 값이 그대로 넘어간다.
		
	} // doPost

}
