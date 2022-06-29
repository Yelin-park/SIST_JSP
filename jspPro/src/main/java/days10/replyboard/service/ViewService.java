package days10.replyboard.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import days10.replyboard.domain.ReplyBoardDTO;
import days10.replyboard.persistence.ReplyBoardDAO;

public class ViewService {

	// 1. 싱글톤
	private ViewService() {}
	private static ViewService instance = new ViewService();
	public static ViewService getInstance() {
		return instance;
	}

	// 
	public ReplyBoardDTO selectOne(int num){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ReplyBoardDAO dao = ReplyBoardDAO.getInstance();
			// 1 + 2  트랜잭션 처리 또는 로그 서비스
			con.setAutoCommit(false);         
			// 1. 조회수 증가
			dao.updateReadCount(con, num);
			// 2. 해당 게시글 정보
			ReplyBoardDTO dto = null;
			dto = dao.selectOne(con, num);
			con.commit();         
			return dto;
		} catch (NamingException | SQLException e) { 
			JdbcUtil.rollback(con);         
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
}

