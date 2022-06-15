<%@page import="java.util.Iterator"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="days02.DeptDTO"%>
<%@page import="com.util.DBconn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 15. - 오후 3:17:35</title>
</head>
<body>
<h3>ex05_dept.jsp</h3>
<select name="selDept" id="selDept">
	<option>선택하세요..</option>
<%
	Iterator<DeptDTO> ir = list.iterator();
	while(ir.hasNext()){
		DeptDTO dto = ir.next();
%>
	<option value="<%= dto.getDeptno() %>"><%= dto.getDname() %></option>
<%		
	} // while
%>
</select>
</body>
</html>