package days08.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBconn;

import days05.board.BoardDAOImpl;
import days05.board.BoardDTO;

public class WriteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equals("GET")) { // GET 방식 요청 - 새 게시글 작성할 수 있는 write.jsp 포워딩
			return "/days08/board/write.jsp";
		} else if(request.getMethod().equals("POST")){ // POST 방식 요청
			// 새 게시글을 DB 저장 후 list.do로 리다이렉트 해야함
			
			// 톰캣 8 UTF-8 방식으로 입력받은 값을 POST로 요청 했는데 설정을 안해줘서 ISO-8859-1 인코딩 하고 있으니
			request.setCharacterEncoding("UTF-8");
						
			// 1. 파라미터로 넘어오는 값을 가지고 BoardDTO dto 생성
			String writer = request.getParameter("writer");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
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
				System.out.println("> WriteHandler.java doPost() Exception 발생");
				e.printStackTrace();
			} // try
			
			DBconn.close();
			
			// 리다이렉트를 여기서 하면 안됨 DispatcherServlet에서 해야함
			// 3. list.do 으로 리다이렉트 요청 -> 요청에 의해서 ListHandler.java 서블릿 호출 -> 새 글을 포함해서 list.jsp 포워딩
			String location = "/jspPro/board/list.do"; // 클라이언트에서부터 다시 요청하기 때문에 /board/list.do
			if(rowCount == 1) location +="?write=success";
			response.sendRedirect(location);

		} else { // PUT, DELETE, UPDATE 등등 방식이 있음
			response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED); // GET과 POST 방식 외에는 응답하지 않는다 라는 에러 발생
		}
	
		return null;
	}

}
