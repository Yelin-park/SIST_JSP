package days05.board;

import java.sql.SQLException;
import java.util.ArrayList;

public interface BoardDAO {
	// 1. 모든 게시글 목록 반환하는 메서드
	public abstract ArrayList<BoardDTO> select() throws SQLException;
	
	// 2. 새로운 게시글 추가하는 메서드
	int insert(BoardDTO dto) throws SQLException;
	
	// 9. 현재 페이지(currentPage)에 해당하는 게시글 목록 반환하는 메서드(오버로딩)
	// 매개변수 : 페이지 번호, 몇개의 게시글을 뿌릴지 
	public abstract ArrayList<BoardDTO> select(int currentPage, int numberPerPage) throws SQLException;
	
	// 7. 총 레코드 수 반환하는 메서드
	int getTotalRecords() throws SQLException;
	
	// 8. 총 페이지 수 반환하는 메서드
	int getTotalPages(int numberPerPage) throws SQLException;
	
	// 11. 검색된 총 페이지 수 반환하는 메서드
	int getTotalPages(int numberPerPage, int searchCondition, String searchWord) throws SQLException;
	
} // interface
