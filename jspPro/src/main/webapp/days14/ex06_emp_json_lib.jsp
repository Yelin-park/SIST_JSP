<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page trimDirectiveWhitespaces="true"
   contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="com.util.JdbcUtil"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "select empno, ename, sal " 
                   + " from emp "
                 + " order by sal desc";

JSONObject jsonData = null;

try{      
   con = ConnectionProvider.getConnection();
   pstmt = con.prepareStatement(sql);
   rs = pstmt.executeQuery(); 
   
   // JSON 객체를 만들어서
   // JSON { } 객체 만들기
   jsonData = new JSONObject();
   
   // JSON [] => emp
   JSONArray jsonEmpArray = new JSONArray();	   
		   
   // {"empno":7839,"ename":"KING"},
   while( rs.next() ){ 
      int empno = rs.getInt("empno");
      String ename = rs.getString("ename");
      // jsonEmpArray [] <- {"empno":7839, "ename":"KING"},
      JSONObject jsonEmp = new JSONObject();
      jsonEmp.put("empno", empno);
      jsonEmp.put("ename", ename);
      
      jsonEmpArray.add(jsonEmp);
   } // while 
   
	// {"emp":[]}
   jsonData.put("emp", jsonEmpArray);
   
}catch(Exception e){
   e.printStackTrace();
}finally{
   JdbcUtil.close(rs);
   JdbcUtil.close(pstmt);
   JdbcUtil.close(con);
} // try


%>
<%= jsonData  %>

<%--
 {
   "emp":[
            {"empno":7839,"ename":"KING"},
            {"empno":7902,"ename":"FORD"},
            {"empno":7566,"ename":"JONES"},
            {"empno":7698,"ename":"BLAKE"},
            {"empno":7782,"ename":"CLARK"},
            {"empno":7499,"ename":"ALLEN"},
            {"empno":7844,"ename":"TURNER"},
            {"empno":7934,"ename":"MILLER"},
            {"empno":7654,"ename":"MARTIN"},
            {"empno":7521,"ename":"WARD"},
            {"empno":7900,"ename":"JAMES"},
            {"empno":7369,"ename":"SMITH"}
        ]
} 
 --%>