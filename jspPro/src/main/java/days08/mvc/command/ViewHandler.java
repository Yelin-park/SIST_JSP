package days08.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBconn;

import days05.board.BoardDAOImpl;
import days05.board.BoardDTO;

public class ViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
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
		
		return "/days08/board/view.jsp";
	}

}
