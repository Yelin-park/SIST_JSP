package practice;

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

@WebServlet("/practice/page00.htm")
public class PracticeDeptEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PracticeDeptEmp() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection conn = DBconn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<DeptDTO> deptList = null;
		
		String sql = "SELECT deptno, dname, loc"
				+ " FROM dept";
	
		int deptno;
		String dname, loc;
		
		try {
			rs = pstmt.executeQuery(sql);
			if (rs.next()) {
				deptList = new ArrayList<DeptDTO>();
				do {
					deptno = rs.getInt("deptno");
					dname = rs.getString("dname");
				} while (rs.next());
			}

		} catch (Exception e) {
			
		} 
		
		
		DBconn.close();
		String path = "/practice/page00.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
