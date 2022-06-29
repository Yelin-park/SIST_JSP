package scott.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;

import scott.domain.DeptDTO;

public class DeptDAO{

	// 1. 싱글톤
	private DeptDAO() {}
	private static DeptDAO instance = new DeptDAO();
	public static DeptDAO getInstance() {
		return instance;
	}

	// 2. 부서 정보 반환하는 메서드
	public List<DeptDTO> selectDeptList(Connection con) throws SQLException, NamingException {

		ArrayList<DeptDTO>  deptList = null;
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement pstmt = null;

		String sql = "SELECT deptno, dname, loc  "
					+" FROM dept";
		int deptno;
		String dname, loc;

		try{

			pstmt = conn.prepareStatement(sql);
			ResultSet rs =  pstmt.executeQuery();

			if( rs.next() ){
				deptList = new ArrayList<DeptDTO>();
				do{
					deptno =  rs.getInt("deptno");
					dname = rs.getString("dname");
					loc = rs.getString("loc");

					DeptDTO dto = new DeptDTO(deptno, dname, loc);
					deptList.add(dto);
				}while( rs.next() );
			} // if

			pstmt.close();
			rs.close();
			// conn.close(); 여기서 커넥션을 닫지 않아도 서비스에서 닫기 때문에 상관없음
		}catch(Exception e){
			e.printStackTrace();
		}

		return deptList;
	}  // 

} // class