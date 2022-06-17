<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 17. - 오전 9:34:09</title>
<style>
	table{
		width: 100%;
		min-width: 700px;
	}
	
	table, th, td{
		border: 1px solid gray;
	}
</style>
</head>
<body>
<h3>ex01_forward.jsp</h3>

<select name="deptno" id="selDept">
	<c:forEach items="${deptList}" var="dto">
		<option value="${dto.deptno }">${dto.dname}</option>	
	</c:forEach>
</select>

<br>
<br>

<table>
 <thead>
  <tr>
   <th><input type="checkbox" id="ckbAll" name="ckbAll">전체 선택</th>
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
  <c:if test="${not empty empList }">
   <c:forEach items="${empList }" var="dto" varStatus="status"> <!-- varStatus 속성을 주고 -->
    <tr>
    		<!-- data-속성명="속성값" 또는 id="empno-${dto.empno } 이렇게 주어서 데이터를 숨겨도 됨 -->
     <td><input type="checkbox" data-empno="${dto.empno }" id="empno-${dto.empno }">${status.count }</td><!-- ${status.count}를 하면 자동으로 순번이 매겨진다 -->
     <td>${dto.empno }</td>
     <td>${dto.ename }</td>
     <td>${dto.job }</td>
     <td>${dto.mgr }</td>
     <td>${dto.hiredate }</td>
     <td>${dto.sal }</td>
     <td>${dto.comm }</td>
     <td>${dto.deptno }</td>
    </tr>
   </c:forEach>
  </c:if> <!-- 사원 정보가 있는 경우 -->
  <c:if test="${empty empList }">
   <tr>
    <td colspan="9">사원 정보가 존재하지 않습니다.</td>
   </tr>
  </c:if> <!-- 사원 정보가 없는 경우 -->
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
	// 옵션 태그를 선택하면 다음과 같이 URL이 날아가야한다.
	// http://localhost/jspPro/test/test00.htm?deptno=30
	$("#selDept").change(function () {
		// BOM
		location.href = "<%= contextPath %>/test/test00.htm?deptno=" + $(this).val();
	});
	
	// /jspPro/test/test00.htm?deptno=30 처럼
	// deptno가 안넘어오면 10, 넘어오면 넘어온 값으로 상태유지(상태관리)
	$("#selDept").val("${ empty param.deptno ? 10 : param.deptno }"); // 쌍따옴표 또는 홑따옴표 필수
	
	// 전체선택 처리 작업
	$("#ckbAll").change(function (event) {
		$("table tbody tr")
				.find("td:first-child :checkbox")
				.prop("checked", $(this).prop("checked"))
	});
	
	$(":checkbox:not(#ckbAll)").click(function (event) {
		$("#ckbAll").prop("checked", $(":checkbox:not(#ckbAll):checked").length == $(":checkbox:not(#ckbAll)").length ? "checked" : ""); 
	});

	// 확인 버튼을 눌렀을 때
	$("#checked_empno").on("click", function () {
		
		var empnos = [];
		
		// 페이지를 이동시키자 -> ex01_finish.jsp
		$("table tbody :checked").each(function (i, element) { // 체크된 체크박스만 가져옴
			// element.id - id 값으로 줬을 때 사용
			var empno = $(this).parent().next().html();
			empnos.push(empno); // 배열에 체크된 empno를 담음
		});

        location.href = "<%=contextPath%>/days04/ex01_finish.jsp?empno=" + empnos.join("&empno=");
	});
</script>

<%--     
	$("#okbtn").click(function (event) {
        let form = $("<form>");
        $("[name=empchk]:checked").each(function (i, element) {
            form.append("<input type='hidden' name= 'empno' value="+element.parentElement.nextElementSibling.innerText+">");
        })
        form.attr({
                id:"empsubmit",
                method:"get",
                action:"<%=contextPath%>/days03/test/test02.jsp"
            });
        $("body").append(form);
        $("#empsubmit").submit();
    }); --%>

</body>
</html>