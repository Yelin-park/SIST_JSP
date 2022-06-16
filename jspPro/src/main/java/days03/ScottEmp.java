package days03;

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

@WebServlet("/scott/emp")
public class ScottEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ScottEmp() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> ScottEmp 서블릿의 doGet() 호출 O");
		
		// http://localhost/jspPro/scott/emp?[selDept=10]
		String pdeptno = request.getParameter("selDept");
		
		// DB 연동 작업하여 부서정보를 담음
		ArrayList<EmpDTO> list = null;
		Connection conn = DBconn.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "SELECT *"
					+ " FROM emp"
					+ " WHERE deptno = ?"
					+ " ORDER BY ename ASC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(pdeptno));
			
			ResultSet rs = pstmt.executeQuery();
			
			int empno;
			String ename, job;
			int mgr;
			Date hiredate; // java.sql 자료형
			double sal, comm;
			int deptno;
			
			if(rs.next()){
				list = new ArrayList<EmpDTO> ();
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
					list.add(dto);
				} while(rs.next());
			} // if
			pstmt.close();
			rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		DBconn.close();
		
		// 포워딩 할 때 가지고 갈 DB 데이터
		request.setAttribute("list", list); // 이름을 주고 담고자 하는 정보를 매개변수로 줌
		
		// 포워딩
		// String path = "ex06_emp.jsp"; // 파일명만 주면 http://localhost/jspPro/scott/emp 이렇게 나옴
		// String path = "/days03/ex06_emp.jsp";
		String path = "/days03/ex06_emp_jstl.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response); // POST 방식으로 요청해도 doGet() 함수를 호출하겠다.
	}

}
