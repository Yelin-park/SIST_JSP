<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 23. - 오전 9:34:03</title>
</head>
<body>
<h3>ex03.jsp</h3>
<!-- Spring + mybatis 프레임워크를 배워야 아래 코딩을 사용할 수 있음 오늘은 이런게 있다 알고가기 -->

<!-- 
	쿼리를 실행시켜 rs란 변수에 담겠다.
	dataSource DB 연동 -> web.xml 확인(커넥션 풀 설정)
-->
<sql:query var="rs" dataSource="jdbc/myoracle">
	SELECT deptno, dname, loc
	FROM dept
</sql:query>
<!-- rs의 하나행을 가져와 dto 변수에 담고
rows 대신 다른 이름 사용해도됨(사용자 정의) -->
<c:forEach items="${rs.rows }" var="dto">
 <li>
  ${dto.deptno }-${dto.dname }-${dto.loc }
 </li>
</c:forEach>
</body>
</html>