<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 17. - 오전 11:22:41</title>
</head>
<body>
<h3>ex02.jsp</h3>

<a href="/jspPro/days04/ex02.htm">사원 등급 보기</a>

<pre>
 days04.SalgradeEmp.java 서블릿 파일 생성
 a 링크 태그를 클릭 -> 서블릿 호출
 
 
 JDBC days03.ex05_03.java
 
<!-- 	LinkedHashMap<SalgradeDTO, ArrayList<EmpDeptSalDTO>>
	[실행결과]
	deptno dname empno ename sal
	1등급   (     700~1200 ) - 2명 					> SalgradeDTO(KEY 값으로 사용)
	    20   RESEARCH   7369   SMITH   800	 		> ArrayList<EmpDeptSalDTO> list (VALUE 값으로 사용)
	    30   SALES         7900   JAMES   950
	2등급   (   1201~1400 ) - 2명
	 30   SALES   7654   MARTIN   2650
	 30   SALES   7521   WARD      1750   
	3등급   (   1401~2000 ) - 2명
	 30   SALES   7499   ALLEN      1900
	 30   SALES   7844   TURNER   1500
	4등급   (   2001~3000 ) - 4명
	  10   ACCOUNTING   7782   CLARK   2450
	 20   RESEARCH   7902   FORD   3000
	 20   RESEARCH   7566   JONES   2975
	 30   SALES   7698   BLAKE   2850
	5등급   (   3001~9999 ) - 1명   
	 10   ACCOUNTING   7839   KING   5000 -->

</pre>
</body>
</html>