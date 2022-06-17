package days04;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBconn;

@WebServlet("/days04/ex02.htm")
public class SalgradeEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SalgradeEmp() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		  // 등급을 가져오는 쿼리
		  String sql =   "SELECT  grade ,    losal ,   hisal  , COUNT(*) cnt "
	            + "FROM salgrade s JOIN emp e ON  sal BETWEEN losal AND hisal "
	            + "GROUP BY grade ,    losal ,   hisal "
	            + "ORDER BY grade ASC";
	      
		  // 해당 등급의 사원 정보를 가져오는 쿼리
	      String empSql = "SELECT   d.deptno, dname,  empno, ename,  sal "
	            + "        , grade "
	            + "FROM dept d RIGHT JOIN emp e ON d.deptno = e.deptno "
	            + "            JOIN salgrade s ON sal BETWEEN losal AND hisal "
	            + "WHERE grade = ? ";
	      
	      PreparedStatement pstmt = null, empPstmt = null;
	      ResultSet rs = null, empRs = null;
	      Connection conn = null;
	      
	      LinkedHashMap<SalgradeDTO, ArrayList<DeptEmpSalgradeDTO>> map = null;
	      SalgradeDTO dto = null;   // key
	      ArrayList<DeptEmpSalgradeDTO> list = null;  // value
	      
	      DeptEmpSalgradeDTO empDto = null;
	      
	      conn = DBconn.getConnection();
	      try {
	         // Map 객체 생성
	         map = new LinkedHashMap<>();
	         
	         pstmt =  conn.prepareStatement(sql); 
	         rs = pstmt.executeQuery();

	         if( rs.next() ) {
	            list = new ArrayList<>();
	            do { 
	               int grade = rs.getInt("grade");
	               int losal = rs.getInt("losal");
	               int hisal = rs.getInt("hisal");
	               int cnt = rs.getInt("cnt");

	               dto =  new SalgradeDTO(grade, losal, hisal, cnt); // key
	               

	               // [START] 
	               empPstmt = conn.prepareStatement(empSql);
	               // ?
	               empPstmt.setInt(1, grade);
	               empRs =  empPstmt.executeQuery();
	               
	               if ( empRs.next() ) {
	                  
	                  list = new ArrayList<DeptEmpSalgradeDTO>();
	                  
	                  do {
	                     // d.deptno, dname,  empno, ename,  sal
	                     int deptno = empRs.getInt(1);
	                     String dname = empRs.getString(2);
	                     int empno = empRs.getInt(3);
	                     String ename = empRs.getString(4);
	                     double sal = empRs.getDouble(5);
	                     
	                     empDto = new DeptEmpSalgradeDTO();
	                     empDto.setDeptno(deptno);
	                     empDto.setDname(dname);
	                     empDto.setEmpno(empno);
	                     empDto.setEname(ename);
	                     empDto.setSal(sal);
	                     
	                     list.add(empDto);
	                     
	                  } while (empRs.next());
	               } else {
	                  System.out.println("\t\t 사원 존재 X ");
	               }
	               
	               empPstmt.close();
	               empRs.close();
	               
	               map.put(dto, list);  // 
	               
	               // [END]
	            } while (rs.next());
	         } // if

	      } catch (SQLException e) { 
	         e.printStackTrace();
	      } finally {
	         try {
	            rs.close();
	            pstmt.close();
	         } catch (SQLException e) { 
	            e.printStackTrace();
	         }
	      }

	      DBconn.close();
	      
	      // 포워딩 작업
	      request.setAttribute("map", map);
	      // String path = "/days04/ex02_ok.jsp";
	      String path = "/days04/ex02_ok_jstl.jsp";
	      RequestDispatcher dispatcher = request.getRequestDispatcher(path);
	      dispatcher.forward(request, response); // 포워드로 map 객체가 날아감
	      
	} // doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
