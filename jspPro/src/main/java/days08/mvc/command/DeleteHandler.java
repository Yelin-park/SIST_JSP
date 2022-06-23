package days08.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBconn;

import days05.board.BoardDAOImpl;
import days05.board.BoardDTO;

public class DeleteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equals("GET")) {
			
			return "/days08/board/delete.jsp";
			
		}else if(request.getMethod().equals("POST")) {
			request.setCharacterEncoding("UTF-8");
			
			// 1. 파라미터로 넘어오는 값을 가지고 BoardDTO dto 생성
			int seq = Integer.parseInt(request.getParameter("seq")); // http://localhost/jspPro/cstvsboard/delete.htm?seq=362
			String pwd = request.getParameter("pwd"); // 입력받은 비밀번호 - form 태그 안에 담겨져서 넘어오는 값
			
			// 2. delete() 메서드를 가지고 DB에 저장하기
			Connection conn = DBconn.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);
			int rowCount = 0;
			try {
				BoardDTO dto = dao.view(seq); // 글 번호에 해당하는 dto를 가져와서
				String originalPwd = dto.getPwd(); // 기존의 비밀번호를 가져온 뒤
				if(pwd.equals(originalPwd)) { // 입력받은 비밀번호와 기존의 비밀번호를 비교해서 같으면
					// 삭제
					rowCount = dao.delete(seq);
				} else {
					// 비밀번호 잘못되었다 경고 후 delete.jsp를 다시 보여줌
					request.setAttribute("error", "비밀번호가 틀립니다."); // 이 경고문구를 담아서
					return "/days08/board/delete.jsp";
				}
			} catch (SQLException e) {
				System.out.println("> DeleteHandler.java doPost() Exception 발생");
				e.printStackTrace();
			} // try
			
			DBconn.close();
			
			// 3. list.htm 으로 리다이렉트 요청 -> 요청에 의해서 List.java 서블릿 호출 -> 삭제한 글을 포함해서 list.jsp 포워딩
			String location = "/jspPro/board/list.do"; // 클라이언트에서부터 다시 요청하기 때문에 /cstvsboard/list.htm
			if(rowCount == 1) location +="?delete=success";
			response.sendRedirect(location);
			
		}else {
			response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		}
		
		return null;
	}

}
