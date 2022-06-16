package days03;

import java.io.IOException;
import java.sql.Connection;
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

@WebServlet("/scott/dept")
public class ScottDept extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ScottDept() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> ScottDept 서블릿의 doGet() 호출 O");
		
		// DB 연동 작업하여 부서정보를 담음
		ArrayList<DeptDTO> list = null;
		Connection conn = DBconn.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "SELECT deptno, dname, loc"
					+ " FROM dept";
		
		int deptno;
		String dname, loc;
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				list = new ArrayList<DeptDTO> ();
				do{
					deptno = rs.getInt("deptno");
					dname = rs.getString("dname");
					loc = rs.getString("loc");
					DeptDTO dto = new DeptDTO(deptno, dname, loc);
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
		// String path = "ex06_dept.jsp"; // 파일명만 주면 http://localhost/jspPro/scott/dept 이렇게 나옴
		// String path = "/days03/ex06_dept.jsp";
		String path = "/days03/ex06_dept_jstl.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response); // POST 방식으로 요청해도 doGet() 함수를 호출하겠다.
	}

}
