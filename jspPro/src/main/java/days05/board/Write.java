package days05.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBconn;

@WebServlet("/cstvsboard/write.htm")
public class Write extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Write() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> Write.doGet() 함수 호출");
		
		String path = "/days05/board/write.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		// write.jsp 포워딩
	} // doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 톰캣 8 UTF-8 방식으로 입력받은 값을 POST로 요청 했는데 설정을 안해줘서 ISO-8859-1 인코딩 하고 있으니
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("> Write.doPost() 호출");
		
		// 1. 파라미터로 넘어오는 값을 가지고 BoardDTO dto 생성
		String writer = request.getParameter("writer");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("eamil");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int tag = Integer.parseInt(request.getParameter("tag"));
		
		BoardDTO dto = new BoardDTO();
		dto.setWriter(writer);
		dto.setPwd(pwd);
		dto.setEmail(email);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setTag(tag);
		
		// 2. insert(dto) 메서드를 가지고 DB에 저장하기
		Connection conn = DBconn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		int rowCount = 0;
		try {
			rowCount = dao.insert(dto);
		} catch (SQLException e) {
			System.out.println("> Write.java doPost() Exception 발생");
			e.printStackTrace();
		} // try
		
		DBconn.close();
		
		// 3. list.htm 으로 리다이렉트 요청 -> 요청에 의해서 List.java 서블릿 호출 -> 새 글을 포함해서 list.jsp 포워딩
		String location = "/jspPro/cstvsboard/list.htm"; // 클라이언트에서부터 다시 요청하기 때문에 /cstvsboard/list.htm
		if(rowCount == 1) location +="?write=success";
		response.sendRedirect(location);
		
	} // doPost

}
