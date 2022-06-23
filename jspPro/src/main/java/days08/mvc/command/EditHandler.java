package days08.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBconn;

import days05.board.BoardDAOImpl;
import days05.board.BoardDTO;

public class EditHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equals("GET")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			Connection conn = DBconn.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);
			BoardDTO dto = null;
			try {
				dto = dao.view(seq);
				request.setAttribute("dto", dto); // 수정할 글의 dto를 담아서 포워딩..
			} catch (SQLException e) {
				System.out.println("> Edit.doGet() Exception 발생");
				e.printStackTrace();
			} // try
			
			DBconn.close();
			
			return "/days08/board/edit.jsp";
			
		}else if(request.getMethod().equals("POST")) {
			request.setCharacterEncoding("UTF-8");
						
			// cstvsboard/edit.htm?seq=364 요청URL 이므로 아래 코딩을 통해 수정할 글 번호 가져옴
			int seq = Integer.parseInt(request.getParameter("seq"));
					
			// 1. 파라미터로 넘어오는 값을 가지고 BoardDTO dto 생성
			// String writer = request.getParameter("writer"); // 수정 못해서 주석처리
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int tag = Integer.parseInt(request.getParameter("tag"));
			
			BoardDTO dto = new BoardDTO();
			// dto.setWriter(writer);
			dto.setPwd(pwd);
			dto.setEmail(email);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setTag(tag);
			dto.setSeq(seq); // 수정하고자 하는 글 번호
			
			// 2. update(dto) 메서드를 가지고 DB에 저장하기
			Connection conn = DBconn.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);
			int rowCount = 0;
			try {
				rowCount = dao.update(dto);
			} catch (SQLException e) {
				System.out.println("> EditHandler.java doPost() Exception 발생");
				e.printStackTrace();
			} // try
			
			DBconn.close();
			
			// 3. view.htm 으로 리다이렉트 요청 -> 요청에 의해서 View.java 서블릿 호출 -> 수정한 글을 포함하여 view.jsp 포워딩
			String location = "/jspPro/board/view.do?seq="+seq; // 클라이언트에서부터 다시 요청하기 때문에 /cstvsboard/view.htm
			if(rowCount == 1) location +="&edit=success";
			else location +="&edit=fail";
			response.sendRedirect(location);
			
		}else {
			response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		}
		
		return null;
		
	}

}
