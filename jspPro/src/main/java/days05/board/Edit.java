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

@WebServlet("/cstvsboard/edit.htm")
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Edit() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// cstvsboard/edit.htm?seq=364 이런 식으로 요청이 옴
		System.out.println("> Edit.java doGet() 호출");
		
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
		
		// edit.jsp 포워딩 작업
		String path = "/days05/board/edit.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	} // doGet
	
	// 수정하기에서 작성 완료 버튼을 누르면 doPost 메서드 호출(Write.java 서블릿의 doPost와 거의 동일)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 톰캣 8 UTF-8 방식으로 입력받은 값을 POST로 요청 했는데 설정을 안해줘서 ISO-8859-1 인코딩 하고 있으니
		request.setCharacterEncoding("UTF-8");
				
		System.out.println("> Edit.doPost() 호출");
		
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
			System.out.println("> Edit.java doPost() Exception 발생");
			e.printStackTrace();
		} // try
		
		DBconn.close();
		
		// 3. view.htm 으로 리다이렉트 요청 -> 요청에 의해서 View.java 서블릿 호출 -> 수정한 글을 포함하여 view.jsp 포워딩
		String location = "/jspPro/cstvsboard/view.htm?seq="+seq; // 클라이언트에서부터 다시 요청하기 때문에 /cstvsboard/view.htm
		if(rowCount == 1) location +="&edit=success";
		else location +="&edit=fail";
		response.sendRedirect(location);		
	} // doPost

}
