package days08.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBconn;

import days05.board.BoardDAOImpl;
import days05.board.BoardDTO;
import days05.board.PageBlock;

public class ListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int currentPage = 1; // 현재 페이지
		int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
		int numberOfPageBlock = 10; // [1] 2 3 4 5 6 7 8 9 10
		ArrayList<BoardDTO> list = null;
		
		// 페이징 처리하기 위해 총 레코드 수와 총 페이지 수를 알아야함
		int totalRecords, totalPages = 0;
		
		// 검색하기 위해 필요한 변수
		int searchCondition = 1; // 안주면 기본값 1(title)
		String searchWord = "";
		
		Connection conn = DBconn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		
		try {
			// ?currentPage		뒤에 아무 것도 안넘어오면 에러 발생하기 때문에 try catch로 묶어서 아무것도 안넘어오면 1이 찍힐 수 있도록
			try {
				// list.jsp에서 페이징 처리하는 부분의 a 태그의 href 속성 값이 currentpage임
				currentPage = Integer.parseInt(request.getParameter("currentpage")); 
			} catch(Exception e) {	}			
			
			// 검색했을 때는 검색조건, 검색어 파라미터가 넘어올 수도 있다.
			// 넘어오면 해당하는 값을 안넘어오면 1을 줌
			try {
				searchCondition = Integer.parseInt(request.getParameter("searchCondition")); 
			} catch(Exception e) {	}		
			
			searchWord = request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord");
			
			if(searchWord.equals("")) { // 검색어가 빈 문자열이라면 검색하기 위한 것이 아님
				list = dao.select(currentPage, numberPerPage);
				// 페이징 처리를 위한 코딩..
				totalPages = dao.getTotalPages(numberPerPage); // 총 페이지 수
			} else { // 빈 문자열이 아니라면 검색하기 위함
				list = dao.search(currentPage, numberPerPage, searchCondition, searchWord);
				totalPages = dao.getTotalPages(numberPerPage, searchCondition, searchWord); // 검색된 총 페이지 수
			} // if			

		} catch (SQLException e) {
			System.out.println("> ListHandler.doGet() Exception 발생");
			e.printStackTrace();
		} // try
		
		DBconn.close();
		
		request.setAttribute("list", list); // ArrayList에 담겨진 데이터를 setAttribute로 list라는 이름으로 담아서 포워딩시 보내겠다.

		// 페이징 처리하는 코딩..
		PageBlock pageBlock = new PageBlock(); // 페이징 처리하는 객체 생성
		pageBlock.setCurrentPage(currentPage);
		pageBlock.setNumberPerPage(numberPerPage);
		pageBlock.setNumberOfpageBlock(numberOfPageBlock);
		
		int startOfPageBlock = 1;
		int endOfPageBlock;

		startOfPageBlock = (currentPage-1) / numberOfPageBlock * numberOfPageBlock + 1;
		endOfPageBlock = startOfPageBlock + numberOfPageBlock - 1;
		if(endOfPageBlock > totalPages) endOfPageBlock = totalPages;
		
		pageBlock.setStartOfPageBlock(startOfPageBlock);
		pageBlock.setEndOfPageBlock(endOfPageBlock);
		
		if(startOfPageBlock != 1) pageBlock.setPrev(true); // 페이징 블럭에 시작 값이 1이 아니면 이전 버튼 생성하겠다.
		if(endOfPageBlock != totalPages) pageBlock.setNext(true); // 페이징 블럭의 마지막 값이 총 페이지 수와 다르다면 다음 버튼 생성하겠다.
		
		request.setAttribute("pageBlock", pageBlock); //  페이징 정보를 담은 객체를 pageBlock 이라는 이름에 담아서 포워딩시 보냄
				
		return "/days08/board/list.jsp"; // 포워딩할 페이지
	}

}
