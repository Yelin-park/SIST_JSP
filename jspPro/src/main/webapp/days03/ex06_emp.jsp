<%@page import="java.util.Iterator"%>
<%@page import="days02.EmpDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	ArrayList<EmpDTO> list = (ArrayList<EmpDTO>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 16. - 오전 11:58:10</title>
</head>
<body>
<h3>ex06_emp.jsp</h3>

<table border="1" style="witdh:100%">
	<thead>
		<tr>
			<th>deptno</th>
			<th>empno</th>
			<th>ename</th>
			<th>job</th>
			<th>hiredate</th>
		</tr>
	</thead>
	<tbody>
	<%
		if(list == null){
	%>
		<tr>
			<td colspan="5" style="heigth:200px;">사원이 존재하지 않습니다.</td>
		</tr>
	<%		
		}else{
	%>
	<%
			Iterator<EmpDTO> ir = list.iterator();
			while(ir.hasNext()){
				EmpDTO dto = ir.next();
	%>
				<tr>
				 <td><%= dto.getDeptno() %></td>
				 <td><%= dto.getEmpno() %></td>
				 <td><%= dto.getEname() %></td>
				 <td><%= dto.getJob() %></td>
				 <td><%= dto.getHiredate() %></td>
				</tr>
	<%	
			} // while
		} // if
	%>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5">
				${param.selDept }번 부서원은 총 <%= list == null ? 0 : list.size() %>명 입니다.
			</td>
		</tr>
	</tfoot>
</table>
<a href="<%= contextPath %>/scott/dept">다시하기</a>
</body>
</html>