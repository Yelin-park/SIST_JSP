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
<style>
	table{
		width: 100%;
	}
	table, th, td{
		border: 1px solid gray;
	}
</style>
</head>
<body>
<h3>test01.jsp</h3>
<% 
	String contextPath = request.getContextPath(); 
	// ArrayList<DeptDTO> deptList = (ArrayList<DeptDTO>)request.getAttribute("deptList");
%>

<select name="deptno" id="deptno">
	<c:forEach items="${deptList }" var="dto">
		<option value="${dto.deptno }">${dto.dname}</option>
	</c:forEach>
</select>

<table>
	<thead>
		<tr>
			<th><input type="checkbox" id="ckbAll" name="ckbAll" />전체선택</th>
			<th>empno</th>
			<th>ename</th>
			<th>job</th>
			<th>mgr</th>
			<th>hiredate</th>
			<th>sal</th>
			<th>comm</th>
			<th>deptno</th>
		</tr>
	</thead>
	<tbody>
		<!-- tr>td*9 -->
		<c:choose>
			<c:when test="${not empty empList }">
				<c:forEach items="${empList }" var="empDto">
					<tr>
					 <td><input type="checkbox"  value="${empDto.empno}" name=""/></td>
					 <!--<td style="text-align: center;">  체크박스 가운데 정렬-->
					 <td>${empDto.empno}</td>
					 <td>${empDto.ename }</td>
					 <td>${empDto.job }</td>
					 <td>${empDto.mgr }</td>
					 <td>${empDto.hiredate}</td>
					 <td>${empDto.sal}</td>
					 <td>${empDto.comm}</td>
					 <td>${empDto.deptno}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="9">해당 부서에는 사원이 존재하지 않습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
	</tbody>
	<tfoot>
		<tr>
			<td colspan="9" style="text-align: center;">
				<button id="checked_empno">확인</button>
			</td>
		</tr>
	</tfoot>
</table>

<script>
$(document).ready(function (){   
	//select로 부서 선택시 부서번호 달아서 url 수정
   $("#selDept").change(function(event) {
   		location.href="<%= contextPath %>/days03/test/test01.jsp?deptno=" + $(this).val(); 
   });
   
   //체크박스 가운데 정렬
   //tbody tr 첫번째 td
  // $("table tbody tr td:first-child").css({
   $("table tbody tr").find("td:first-child").css({
	   //backgroundColor: "yellow",
	   textAlign: "center"
   });
   
	//select 초기값 10, 선택시 그 값 유지
  $("#deptno").val("${empty param.deptno ? 10 : param.deptno}"); //쌍따옴표 필수
  //EL 안에서도 삼항 연산자가 사용 가능하다

  //test01_ok.jsp로 넘기기
  $("#checked_empno").on("click", function(event) {
	  //?deptno=7499&deptno=7698 &...
		var deptnos = [];
	  
	  //jQuery에서만 사용하는 선택자 :checked (체크된 체크박스를 가져오는 선택자)
	  //jQuery 메소드 - each (하나하나 돌겠다)	
	  $("table tbody :checked").each(function(i, element) {
	  		var deptno = $(this).parent().next().html();
	  		//console.log(deptno);
	  		//체크박스의 부모의 다음 형제 노드 ==td.html()
	  		deptnos.push(deptno);
	  		//alert(deptnos.join("&deptno="));
	  	});
	  	
  		location.href= "<%= contextPath %>/days03/test/test01.jsp?deptno=" + deptnos.join("&deptno=");
  });
  
  //체크박스 전체선택
  $("#ckbAll").change(function(event) {
	   $("table tbody tr").find("td:first-child :checkbox")
       		.prop("checked", $(this).prop("checked"));
   });
});
</script>


<%-- <script>
	// 부서를 선택하면 URL이 아래와 같이 날아오고 있음
	// http://localhost/jspPro/scott/emp?selDept=10
	$("#selDept").wrap("<form></form>").change(function (event) { // 옵션 태그를 선택해서 바뀔 때 마다 일어나는 이벤트 = change
		// alert($(this).val()); // 선택한 부서의 부서번호를 가져옴(ex. 10)
		if($(this).val()){
			$(this).parent() // select 태그의 부모 = form
					.attr({
						action: "<%= contextPath %>/test/test01.jsp",
						method: "get"
					})
					.submit();
		}else{
			alert("부서를 선택하세요.");
		} // if
	});
</script> --%>
</body>
</html>