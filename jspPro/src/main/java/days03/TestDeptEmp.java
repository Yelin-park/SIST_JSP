package days03;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBconn;

import days02.DeptDTO;
import days02.EmpDTO;

/*@WebServlet("/test/test00.htm")*/
public class TestDeptEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public TestDeptEmp() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// java코딩 - JDBC - DeptDTO와 EmpDTO를 가지고 와서 서블릿에서 처리하고 test01.jsp에서 출력하겠다.
		Connection conn = DBconn.getConnection();
		
		ArrayList<DeptDTO> deptList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT deptno, dname, loc"
					+ " FROM dept";
		
		int deptno;
		String dname, loc;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				deptList = new ArrayList<DeptDTO> ();
				do{
					deptno = rs.getInt("deptno");
					dname = rs.getString("dname");
					loc = rs.getString("loc");
					DeptDTO dto = new DeptDTO(deptno, dname, loc);
					deptList.add(dto);
				} while(rs.next());
			} // if
			pstmt.close();
			rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}		
		
		 ArrayList<EmpDTO> empList = null;
	     String pDeptno = request.getParameter("selDept");
	     deptno = pDeptno == null ? 10 : Integer.parseInt(pDeptno); 

	     sql = "SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno"
	            + " FROM emp"
	            + " WHERE deptno = ?";
	     
	     try {
	         	pstmt = conn.prepareStatement(sql);
	         	pstmt.setInt(1,  deptno);
	         	rs = pstmt.executeQuery();
	         	EmpDTO empDto = null;
	         	
				int empno;
				String ename, job;
				int mgr;
				Date hiredate; // java.sql 자료형
				double sal, comm;
				int eDeptno;

				if (rs.next()) {
					empList = new ArrayList<EmpDTO>();
					do {
						empno = rs.getInt("empno");
						ename = rs.getString("ename");
						job = rs.getString("job");
						mgr = rs.getInt("mgr");
						hiredate = rs.getDate("hiredate");
						sal = rs.getDouble("sal");
						comm = rs.getDouble("comm");
						eDeptno = rs.getInt("deptno");
					
						EmpDTO dto = new EmpDTO(empno, ename, job, mgr, hiredate, sal, comm, eDeptno);
					} while (rs.next());
				} // if
				
				pstmt.close();
				rs.close();
			
	      } catch (SQLException e) { 
	         e.printStackTrace();
	      }
	     
	     DBconn.close();
		
		// 포워딩 할 때 가지고 갈 DB 데이터
		request.setAttribute("deptList", deptList);
		request.setAttribute("empList", empList);
		
		// 포워딩		
		String path = "/days03/test/test01.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

}
