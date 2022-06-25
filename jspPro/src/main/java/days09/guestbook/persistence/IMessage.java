package days09.guestbook.persistence;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import days09.guestbook.domain.Message;

public interface IMessage {
   // 1. 방명록 글쓰기
   int insert( Connection con, Message message) throws SQLException;
   // 2. 총 방명록 게시글 수를 반환하는 메서드
   int selectCount(Connection con)  throws SQLException;
   // 3. 방명록 목록
   List<Message> selectList( Connection con, int firstRow, int endRow ) throws SQLException;
   // 4. 방명록 보기
   Message select( Connection con, int message_id) throws SQLException;
   // 5. 방명록 삭제
   int delete( Connection con, int message_id ) throws SQLException;
   // 6. 방명록 수정
   int update( Connection con, Message message ) throws SQLException;
}