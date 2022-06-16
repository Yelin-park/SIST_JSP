<%@page import="java.util.Iterator"%>
<%@page import="days02.EmpDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
	// ArrayList<EmpDTO> list = (ArrayList<EmpDTO>) request.getAttribute("list");
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
	<!-- empty list는 list가 null이니? 라고 물어보는 것과 같음 -->
	<c:if test="${empty list}">
		<tr>
			<td colspan="5" style="heigth:200px;">사원이 존재하지 않습니다.</td>
		</tr>
	</c:if>
	<c:if test="${not empty list}">
		<c:forEach items="${list}" var="dto">
				<tr>
				 <td>${dto.deptno }</td>
				 <td>${dto.empno }</td>
				 <td>${dto.ename }</td>
				 <td>${dto.job }</td>
				 <td>${dto.hiredate }</td>
				</tr>
		</c:forEach>
	</c:if>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5">
				${param.selDept}번 부서원은 총 ${list.size()}명 입니다.
			</td>
		</tr>
	</tfoot>
	
</table>
<a href="<%= contextPath %>/scott/dept">다시하기</a>
</body>
</html>