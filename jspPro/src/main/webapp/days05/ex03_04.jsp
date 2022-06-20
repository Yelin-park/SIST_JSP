<%@page import="java.util.Date"%>
<%@page import="days05.MemberInfo"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 20. - 오전 11:45:11</title>
</head>
<body>
<h3>ex03_04.jsp</h3>

<!-- jsp 액션태그 중 useBean 사용 -->
<!-- 자바 코딩이기 때문에 value='' 홑따옴표 사용하고 그 안에 쌍따옴표 사용하기 -->
<jsp:useBean id="info" class="days05.MemberInfo" scope="page"></jsp:useBean><!-- MemberInfo 자바빈즈 객체 생성 MemberInfo info = new MemberInfo() 동일 -->
<jsp:setProperty property="id" name="info" value='<%= request.getParameter("id") %>'/><!-- ex03_02의 파라미터값을 가져와서 자바빈즈에 담기 -->
<jsp:setProperty property="name" name="info" value='<%= request.getParameter("name") %>'/>
<jsp:setProperty property="passwd" name="info" value='<%= request.getParameter("passwd") %>'/>
<jsp:setProperty property="registerDate" name="info" value='<%= new Date() %>'/>
<jsp:setProperty property="email" name="info" value='<%= request.getParameter("email") %>'/>


<h3>MemberInfo 정보 출력</h3>
<!-- 3. 자바빈즈 정보 출력 -->
아이디 : <%= info.getId() %><br>
이름 : <%= info.getName() %><br>
비밀번호 : <%= info.getPasswd() %><br>
등록일 : <%= info.getRegisterDate() %><br>
이메일 : <%= info.getEmail() %><br>

</body>
</html>