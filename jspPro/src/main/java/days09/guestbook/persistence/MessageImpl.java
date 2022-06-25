package days09.guestbook.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import days09.guestbook.domain.Message;

// DAO 싱글톤으로 구현
public class MessageImpl implements IMessage{
	
	// 아래 3가지 싱글톤 관련 코딩
	private static MessageImpl messageDAO = null;
	
	private MessageImpl() {} // new 연산자로 객체 생성 불가능
	
	public static MessageImpl getInstance() {
		if(messageDAO == null) { // 없을때만 생성하겠다.
			messageDAO = new MessageImpl();
		}
		return messageDAO;
	}
	
	// 새 방명록 쓰기
	@Override
	public int insert(Connection con, Message message) throws SQLException { 
		PreparedStatement pstmt = null;

		String sql = " insert into guestbook_message " + 
				" (message_id, guest_name, password, message) "
				+ " values ( seq_guestbook_message.nextval, ?, ?, ? )";
		try {
			pstmt = con.prepareStatement(sql);
			// ? ? ? 
			pstmt.setString(1, message.getGuest_name() );
			pstmt.setString(2, message.getPassword() );
			pstmt.setString(3, message.getMessage() );

			return pstmt.executeUpdate();  // 1
		} catch (Exception e) {
			System.out.println("> MessageImpl.insert -" + e.toString());
		} finally {
			try {
				pstmt.close();
			}catch(Exception e) {            
			}
		}
		return 0; // 
	} // insert

	// 총 방명록 수
	@Override
	public int selectCount(Connection con) throws SQLException {
		PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      String sql = "select count(*) from guestbook_message";
	      try {
	         pstmt = con.prepareStatement(sql);         
	         rs = pstmt.executeQuery();
	         rs.next();
	         return rs.getInt(1);
	      } catch (Exception e) {
	         System.out.println("> MessageImpl.selectCount -" + e.toString());
	      } finally {
	         try {
	            pstmt.close();
	            rs.close();
	         }catch(Exception e) {            
	         }
	      }      
	      return 0;
	} // selectCount

	// 현재 페이지의 방명록 목록
	@Override
	public List<Message> selectList(Connection con, int firstRow, int endRow) throws SQLException {
		PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      String  sql = " select *                                                     ";
	      sql+=     " from (                                                       ";
	      sql+=   "     select rownum no, t.*                                    ";
	      sql+=   "     from (                                                   ";
	      sql+=   "         select  *      ";
	      sql+=   "         from guestbook_message                                     ";
	      sql+=   "         order by message_id desc                                    ";
	      sql+=   "     ) t                                                      ";
	      sql+=   " ) b                                                          ";
	      sql+=   " where b.no between ? and ?                  ";   

	      try {
	         pstmt = con.prepareStatement(sql);   
	         // where b.no between ? and ?  
	         pstmt.setInt(1, firstRow);
	         pstmt.setInt(2, endRow);

	         rs = pstmt.executeQuery();
	         if ( rs.next() ) {
	            List<Message> list = new ArrayList<Message>();
	            do {
	               Message message = new Message();
	               message.setMessage_id(rs.getInt("message_id"));
	               message.setGuest_name( rs.getString("guest_name"));      
	               message.setPassword(rs.getString("password"));
	               message.setMessage(rs.getString("message"));
	               list.add(message);
	            }while( rs.next() );
	            return list;
	         } // if
	      } catch (Exception e) {
	         System.out.println("> MessageImpl.selectList -" + e.toString());
	         // 예외 객체 발생....
	      } finally {
	         try {
	            pstmt.close();
	            rs.close();
	         }catch(Exception e) {            
	         }
	      }   
	      return null;
	} // selectList

	// 해당 방명록 번호의 글 정보를 반환하는 메서드
	@Override
	public Message select(Connection con, int message_id) throws SQLException { 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(
					"select * from guestbook_message "
							+ " where message_id = ?");
			pstmt.setInt(1, message_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// makeMessageFromResultSet() 프로젝트 선언해서 사용.
				return makeMessageFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	} // select
	// 
	private Message makeMessageFromResultSet(ResultSet rs) throws SQLException {
		Message message = new Message();
		message.setMessage_id(rs.getInt("message_id"));
		message.setGuest_name( rs.getString("guest_name"));      
		message.setPassword(rs.getString("password"));
		message.setMessage(rs.getString("message"));
		return message;
	} // makeMessageFromResultSet


	// 해당 방명록 번호 => 삭제 메서드 
	@Override
	public int delete(Connection con, int message_id) throws SQLException { 
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(
					"delete from guestbook_message "
							+ " where message_id = ?");
			pstmt.setInt(1, message_id);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	} // delete

	// 방명록 수정 메서드 
	@Override
	public int update(Connection con, Message message) throws SQLException { 
		PreparedStatement pstmt = null;

		String sql="update guestbook_message "
				+ "set message=?, guest_name = ?"
				+ "where message_id=? and password=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, message.getMessage());
			pstmt.setString(2, message.getGuest_name() );
			pstmt.setInt   (3, message.getMessage_id());
			pstmt.setString(4, message.getPassword());
			return pstmt.executeUpdate(); 
		} finally{
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
	}

}
