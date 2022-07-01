<%@page import="java.util.Iterator"%>
<%@page import="scott.domain.EmpDTO"%>
<%@page import="java.util.List"%>
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
	// JSON 객체 생성
	JSONObject jsonData = new JSONObject();
	JSONArray jsonEmpArray = new JSONArray();

	List<EmpDTO> list = (List<EmpDTO>) request.getAttribute("empList");
	Iterator<EmpDTO> ir = list.iterator();
	
	while (ir.hasNext()) {
		EmpDTO dto = ir.next();
		int empno = dto.getEmpno();
		String ename = dto.getEname();
		
	    JSONObject jsonEmp = new JSONObject();
	    jsonEmp.put("empno", empno);
	    jsonEmp.put("ename", ename);
	    
	    jsonEmpArray.add(jsonEmp);
	} 

   jsonData.put("emp", jsonEmpArray);
%>
<%= jsonData  %>