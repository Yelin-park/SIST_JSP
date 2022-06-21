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

@WebServlet("/cstvsboard/view.htm")
public class View extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public View() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// cstvsboard/view.htm?seq=364 이런 식으로 요청이 옴
		System.out.println("> View.java doGet() 호출");
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		Connection conn = DBconn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		BoardDTO dto = null;
		try {	
			// 트랜잭션 처리 필요 - 지금은 안할것..(service 클래스 필요)
			// ㄱ.
			dao.increaseReaded(seq);
			// ㄴ.
			dto = dao.view(seq);
			request.setAttribute("dto", dto); // dto를 담아서 포워딩..
		} catch (SQLException e) {
			System.out.println("> View.doGet() Exception 발생");
			e.printStackTrace();
		} // try
		
		DBconn.close();
		
		// view.jsp 포워딩 작업
		String path = "/days05/board/view.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	} // doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	} // doPost

}
