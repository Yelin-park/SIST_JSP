<%@page import="java.util.ArrayList"%>
<%@page import="days02.DeptDTO"%>
<%@page import="java.util.Iterator"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 16. - 오후 4:49:39</title>

</head>
<body>
<h3>test01.jsp</h3>
<%
	String contextPath = request.getContextPath();
	int pdeptno = Integer.parseInt(request.getParameter("selDept"));
%>
<select name="selDept" id="selDept">
	<!-- <option>선택하세요..</option> -->
	<c:forEach items="${deptList}" var="dto">
		<option value="${dto.deptno }">${dto.dname}</option>	
	</c:forEach>
</select>

<script>
	$("#selDept").wrap("<form></form>").change(function (event) { // 옵션 태그를 선택해서 바뀔 때 마다 일어나는 이벤트 = change
		if($(this).val()){
			$(this).parent() // select 태그의 부모 = form
					.attr({
						action: "<%= contextPath %>/test/test00.htm",
						method: "get"
					})
					.submit();
		}else{
			alert("부서를 선택하세요.");
		} // if
	});
	
	 $("#selDept option").each(function (i, element) {
	        if(element.value == <%= pdeptno %>){
	            element.selected=true;
	        }
	    });

</script>	

</body>
</html>