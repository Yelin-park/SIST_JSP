package scott.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import scott.domain.EmpDTO;
import scott.persistence.EmpDAO;

public class ListEmpService {

	// 1. 싱글톤
	private ListEmpService() {}
	private static ListEmpService instance = null;
	public static ListEmpService getInstance() {
		if(instance == null) {
			instance = new ListEmpService();
		}
		return instance;
	}

	public List<EmpDTO> selectEmpList(int deptno){
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			EmpDAO dao = EmpDAO.getInstance();
			List<EmpDTO> list = null;
			list = dao.selectEmpList(con, deptno);
			return list;
		} catch (NamingException | SQLException e) { 
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

}