package days03;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test/test00.htm")
public class TestDeptEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public TestDeptEmp() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// java코딩 - JDBC - DeptDTO와 EmpDTO를 가지고 와서 서블릿에서 처리하고 test01.jsp에서 출력하겠다.
		
		String path = "days03/test/test01.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

}
