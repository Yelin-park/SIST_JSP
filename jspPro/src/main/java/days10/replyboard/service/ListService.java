package days10.replyboard.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import days10.replyboard.domain.ReplyBoardDTO;
import days10.replyboard.persistence.ReplyBoardDAO;

public class ListService {

	// 1. 싱글톤
	private ListService() {}
	private static ListService instance = new ListService();
	public static ListService getInstance() {
		return instance;
	}

	public List<ReplyBoardDTO> select(){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ReplyBoardDAO dao = ReplyBoardDAO.getInstance();
			List<ReplyBoardDTO> list = null;
			list = dao.selectList(con);
			return list;
		} catch (NamingException | SQLException e) { 
			//e.printStackTrace();  syso("ListService.select() 에러 : ")
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

}