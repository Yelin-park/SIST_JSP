<%@page import="java.util.Iterator"%>
<%@page import="days02.DeptDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 포워딩될 때 list -> request.setAttriubute()
	// 가져오는 코딩
	ArrayList<DeptDTO> list = (ArrayList<DeptDTO>)request.getAttribute("list");
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 16. - 오전 10:45:14</title>
</head>
<body>
<h3>ex06_dept.jsp</h3>

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

<script>
	// 부서를 선택하면 URL이 아래와 같이 날아오고 있음
	// http://localhost/jspPro/scott/emp?selDept=10
	$("#selDept").wrap("<form></form>").change(function (event) { // 옵션 태그를 선택해서 바뀔 때 마다 일어나는 이벤트 = change
		// alert($(this).val()); // 선택한 부서의 부서번호를 가져옴(ex. 10)
		if($(this).val()){
			$(this).parent() // select 태그의 부모 = form
					.attr({
						action: "<%= contextPath %>/scott/emp",
						method: "get"
					})
					.submit();
		}else{
			alert("부서를 선택하세요.");
		} // if
	});
</script>
</body>
</html>