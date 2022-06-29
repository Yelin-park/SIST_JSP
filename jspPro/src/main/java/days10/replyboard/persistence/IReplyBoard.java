package days10.replyboard.persistence;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import days10.replyboard.domain.ReplyBoardDTO;

public interface IReplyBoard {

	// 1. 글목록 : 페이징 처리 X
	List<ReplyBoardDTO> selectList(Connection con) throws SQLException;

	// 2. 글쓰기 = 새글 + 답글                REF/STEP/DEPTH
	int insert( Connection con, ReplyBoardDTO dto) throws SQLException;

	// 3. 조회수 1증가
	int updateReadCount( Connection con, int num) throws SQLException;

	// 4. 글내용 
	ReplyBoardDTO selectOne( Connection con, int num) throws SQLException;

	// 5. 답글 필요한 쿼리
	// 1) 먼저)  동일한 글그룹(REF)에서 부모순번(STEP) 보다 큰 것들의 'STEP을 1증가'
	int updateRefStep( Connection con, int parentRef, int parentStep) throws SQLException;

	// 6. 삭제
	int delete(Connection con, int num) throws SQLException;

}