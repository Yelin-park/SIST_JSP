package days09.guestbook.service;

import java.sql.Connection;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import days09.guestbook.domain.Message;
import days09.guestbook.persistence.MessageImpl;

public class DeleteMessageService {
	// 1 싱글톤
	private static DeleteMessageService instance = new DeleteMessageService();
	public static DeleteMessageService getInstance() {
		return instance;
	}
	private DeleteMessageService() { }

	public int delete(int message_id, String password) {
		Connection conn = null;
		int result = 0;
		try {
			conn = ConnectionProvider.getConnection();

			MessageImpl dao =  MessageImpl.getInstance();

			Message message = dao.select(conn, message_id);

			if( message == null ) {
				throw new MessageNotFoundException("해당 메시지 없습니다.");
			}
			if( ! message.matchPassword(password)) {
				throw new InvalidPasswordException("비밀번호 틀렸다.");
			}

			result = dao.delete(conn, message_id);

		}catch( InvalidPasswordException | MessageNotFoundException e) {
			JdbcUtil.rollback(conn);
			throw e;
		}
		catch (Exception e) {
			throw new ServiceException("메시지 삭제 실패 : "
					+ e.getMessage(), e);
		}
		finally {
			JdbcUtil.close(conn); // 커넥션풀에 커넥션객체를 반환....
			return result;
		}

	}
}