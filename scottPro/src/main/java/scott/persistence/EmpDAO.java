package scott.persistence;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import scott.domain.EmpDTO;

public class EmpDAO{

   // 1. 싱글톤
   private EmpDAO() {}
   private static EmpDAO instance = new EmpDAO();
   public static EmpDAO getInstance() {
      return instance;
   }
 
   // 2. 부서 정보 반환하는 메서드   
   public List<EmpDTO> selectEmpList(Connection conn, int deptno) throws SQLException, NamingException {
      ArrayList<EmpDTO>  empList = null; 
      PreparedStatement pstmt = null;

      String sql = "SELECT *  "
    		  	+"   FROM emp "
    		  	+ "  WHERE deptno = ? "
    		  	+ "  ORDER BY ename ASC ";

      try{

         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1,   deptno  );         
         ResultSet rs =  pstmt.executeQuery();

         int empno;
         String ename, job;
         int mgr;
         Date hiredate;  // java.sql.Date            String
         double sal, comm;
         //int deptno;
         
         if( rs.next() ){
            empList = new ArrayList<EmpDTO>();
            do{
               empno = rs.getInt("empno");
               ename = rs.getString("ename");
               job = rs.getString("job");
               mgr = rs.getInt("mgr");
               hiredate = rs.getDate("hiredate");
               sal = rs.getDouble("sal");
               comm = rs.getDouble("comm");
               deptno = rs.getInt("deptno");

               EmpDTO dto = new EmpDTO(empno, ename, job
                                            , mgr, hiredate, sal, comm, deptno);
               empList.add(dto);
            }while( rs.next() );
         } // if

         pstmt.close();
         rs.close();
         // conn.close();
      }catch(Exception e){
         e.printStackTrace();
      }
       
      return empList;
   }  // 

} // class