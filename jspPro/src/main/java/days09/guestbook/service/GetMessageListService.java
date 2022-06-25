package days09.guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import days09.guestbook.domain.Message;
import days09.guestbook.persistence.MessageImpl;

// 싱글톤
public class GetMessageListService {
	
	// 싱글톤 구현하기 위한 코딩 3가지
	private static GetMessageListService  instance = null;

	private GetMessageListService() {}

	public static GetMessageListService getInstance() {
		if(   instance == null ) {
			instance = new GetMessageListService();
		}
		return instance;
	}

	// 한 페이지에 출력할 방명록 수 
	private static final int MESSAGE_COUNT_PER_PAGE = 3;

	// MessageListView [방명록 목록 + 페이징 처리] 반환하는 메서드
	public MessageListView getMessageList( int pageNumber ) {

		Connection conn = null;      
		int currentPageNumber = pageNumber;
		
		try {
			// DBCP를 사용하여 커넥션 객체를 얻어옴
			conn = ConnectionProvider.getConnection();
			// DAO 객체를 가져옴
			MessageImpl messageDao = MessageImpl.getInstance();

			// 총 방명록 수 - DAO 객체에 있는 메서드
			int messageTotalCount = messageDao.selectCount(conn);

			List<Message> messageList = null;
			
			// 시작값과 끝값
			int firstRow = 0;
			int endRow = 0;
			
			// 페이징 처리 로직
			if ( messageTotalCount > 0 ) {
				firstRow =
						(pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				//      dao.selectList()     해당 페이지의 방명록을 select
				messageList =
						messageDao.selectList(conn, firstRow, endRow); // 시작과 끝값에 해당하는 방명록 리스트(?)를 가져와라
			} else {
				currentPageNumber = 0;
				messageList = Collections.emptyList();  // 비워져있다...
			} // if

			return new MessageListView( // MessageListView에 있는 모든 필드 값
					messageList, // ArrayList
					messageTotalCount
					, currentPageNumber,
					MESSAGE_COUNT_PER_PAGE
					, firstRow, endRow);
			
		} catch (SQLException | NamingException e) {
			throw new ServiceException("> 목록 구하기 실패: " + e.getMessage(), e); // 사용자가 만든 예외 사용
		} finally {
			try {
				conn.close();  // 커넥션 풀 반환
			} catch (SQLException e) {
				e.printStackTrace();
			} // try  
		} // try-catch-finally

	} // getMessageList

	public Message getMessage(int messageId) {
		Connection  conn = null; 
	      try {
	         conn = ConnectionProvider.getConnection();
	         MessageImpl messageDao = MessageImpl.getInstance();      
	         
	         return  messageDao.select(conn, messageId); // DI
	         
	      } catch (Exception e) {
	         throw new ServiceException("메세지 구하기 실패 : " 
	               + e.getMessage(), e);
	      }finally {
	         JdbcUtil.close(conn);
	      }
	} // getMessage

} // class

