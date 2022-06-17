package days04;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

@WebServlet("/test/test00.htm")
public class TestDeptEmp2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TestDeptEmp2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> TestDeptEmp.java doGet() 호출됨");
		
		// dept 정보 가져오는 코딩
		ArrayList<DeptDTO> deptList = null;
		Connection conn = DBconn.getConnection();
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

		
		// 포워딩 할 때 가지고 갈 DB 데이터
		request.setAttribute("deptList", deptList); // 이름을 주고 담고자 하는 정보를 매개변수로 줌
				
		
		// deptno(부서정보)가 넘어오면 해당 부서의 사원 정보를 뿌리고 아니면 10번 부서를 뿌리자
		// 제일 처음 넘어올 때는 아무것도 안넘어오는 상태
		// 넘겨져온다면 다음과 같이 넘어옴 -> /jspPro/test/tset00.htm?deptno=20
		// /jspPro/test/tset00.htm?deptno	=> ""(빈문자열)
		// /jspPro/test/tset00.htm		=> null
		String pdeptno = request.getParameter("deptno"); // 넘겨져오는 부서번호를 가져와서..
		if(pdeptno == null || pdeptno.equals("")) {
			pdeptno = "10";
		} else {
			pdeptno = request.getParameter("deptno");
		}
		
		// DB 연동 작업하여 부서정보를 담음
		ArrayList<EmpDTO> empList = null;
		
		sql = "SELECT *"
			  + " FROM emp"
			  + " WHERE deptno = ?"
			  + " ORDER BY ename ASC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(pdeptno));
			
			rs = pstmt.executeQuery();
			
			int empno;
			String ename, job;
			int mgr;
			Date hiredate; // java.sql 자료형
			double sal, comm;
			// int deptno;
			
			if(rs.next()){
				empList = new ArrayList<EmpDTO> ();
				do{
					empno = rs.getInt("empno");
					ename = rs.getString("ename");
					job = rs.getString("job");
					mgr = rs.getInt("mgr");
					hiredate = rs.getDate("hiredate");
					sal = rs.getDouble("sal");
					comm = rs.getDouble("comm");
					deptno = rs.getInt("deptno");
					
					EmpDTO dto = new EmpDTO(empno, ename, job, mgr, hiredate, sal, comm, deptno);
					empList.add(dto);
				} while(rs.next());
			} // if
			pstmt.close();
			rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		DBconn.close();
		
		// 포워딩 할 때 가지고 갈 DB 데이터
		request.setAttribute("empList", empList);
		
		
		// 포워딩 하는 작업
		// 서블릿 요청이 /jspPro/test/test00.htm 으로 왔기 때문에 ex01_forward.jsp로 하면 404 에러 뜸
		String path = "/days04/ex01_forward.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
