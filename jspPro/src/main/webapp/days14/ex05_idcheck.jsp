<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="com.util.ConnectionProvider"%>
<%@page import="com.util.JdbcUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
     // 중복 체크할 ID(empno) 파라미터 받아서.
     String empno = request.getParameter("empno");
     //  0(사용가능)             1(사용불가능)
     String sql = " select count(*) cnt " + 
                    " from emp  " + 
                    " where empno =  ?";
     Connection conn = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null; 
     
     String jsonResult =  null;  //   "{ "count":1 }";
     
     try{
        conn = ConnectionProvider.getConnection();   // DBCP
        pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, empno);
      rs = pstmt.executeQuery();
         
      rs.next();
         int cnt = rs.getInt("cnt");  // 1      0
         // jsonResult  = "{ \"count\":  "+ cnt +" }";
         jsonResult  = String.format("{ \"count\":%d }", cnt) ;
     }catch(Exception e){
        e.printStackTrace();
     }finally{
        JdbcUtil.close(pstmt);
        JdbcUtil.close(rs);
        JdbcUtil.close(conn);
     }
     
%> 
<%= jsonResult  %>