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
		
	// 3-1. 조회수 증가 메서드(int seq가 매개변수	void 리턴타입)
	void increaseReaded(int seq) throws SQLException; // 예외는 service로 떠넘기기~
	
	// 3-2. 게시글 정보 반환 메서드(int seq가 매개변수	BoardDTO dto 리턴타입)
	BoardDTO view(int seq) throws SQLException;
	
	// 5. 게시글 수정하는 메서드
	int update(BoardDTO dto) throws SQLException;
	
	// 4. 게시글 삭제하는 메서드
	int delete(int seq) throws SQLException;
	
	// 10. 게시글 검색하는 메서드 + 페이징 처리 추가
	public abstract ArrayList<BoardDTO> search(int currentPage, int numberPerPage, int searchCondition,
			String searchWord) throws SQLException;
	
	// 11. 검색된 총 페이지 수 반환하는 메서드
	int getTotalPages(int numberPerPage, int searchCondition, String searchWord) throws SQLException;
	
} // interface
