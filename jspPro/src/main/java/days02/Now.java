package days02;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Now extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8"); // 한글이 깨지지 않도록 맨 위에 설정 p502
		
		PrintWriter out = response.getWriter(); // 응답할 때 사용하는 메서드 / out으로 출력하겠다.
		// 요청할 때 html 문서를 출력해주어야 함(응답)
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"UTF-8\">");
		out.println("<title>2022. 6. 15. - 오전 10:27:06</title>");
		out.println("</head>");
		out.println("<body>");
		
		Date now = new Date();

		String pattern = "yyyy-MM-dd hh:mm:ss";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String strNow = sdf.format(now);
		
		out.println("> 현재 날짜, 시간 :" + strNow);
		out.println("</body>");
		out.println("</html>");
	}

}
