package scott.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import scott.domain.EmpDTO;
import scott.persistence.EmpDAO;

public class ListEmpJsonService {

	// 1. 싱글톤
	private ListEmpJsonService() {}
	private static ListEmpJsonService instance = null;
	public static ListEmpJsonService getInstance() {
		if(instance == null) {
			instance = new ListEmpJsonService();
		}
		return instance;
	}

	public List<EmpDTO> selectEmpList() {
		//
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			EmpDAO dao = EmpDAO.getInstance();
			List<EmpDTO> list = null;
			list = dao.selectEmpList(con);
			return list;
		} catch (NamingException | SQLException e) { 
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

}