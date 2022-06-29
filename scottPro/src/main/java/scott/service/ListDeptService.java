package scott.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import scott.domain.DeptDTO;
import scott.persistence.DeptDAO;

public class ListDeptService {

	// 1. 싱글톤
	private ListDeptService() {}
	private static ListDeptService instance = null;
	public static ListDeptService getInstance() {
		if(instance == null) {
			instance = new ListDeptService();
		}
		return instance;
	}

	public List<DeptDTO> selectDeptList(){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			DeptDAO dao = DeptDAO.getInstance();
			List<DeptDTO> list = null;
			list = dao.selectDeptList(con);
			return list;
		} catch (NamingException | SQLException e) { 
			//e.printStackTrace(); // 예외의 메세지를 출력하겠다.
			throw new RuntimeException(e); // 예외를 호출한 곳에 떠넘기겠다.
		} finally {
			JdbcUtil.close(con);
		}
	}

}