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
<h3>ex03_03.jsp</h3>

<%
// 1. ex03_02.jsp에서 가져온 파라미터 값을 변수에 저장
 String id = request.getParameter("id");
 String name = request.getParameter("name");
 String passwd = request.getParameter("passwd");
 String email = request.getParameter("email");
 
 // 2. 자바빈즈 객체 생성 후 자바빈즈에 담기
 MemberInfo info = new MemberInfo();
 info.setId(id);
 info.setName(name);
 info.setPasswd(passwd);
 info.setRegisterDate(new Date());
 info.setEmail(email);
%>

<h3>MemberInfo 정보 출력</h3>
<!-- 3. 자바빈즈 정보 출력 -->
아이디 : <%= info.getId() %><br>
이름 : <%= info.getName() %><br>
비밀번호 : <%= info.getPasswd() %><br>
등록일 : <%= info.getRegisterDate() %><br>
이메일 : <%= info.getEmail() %><br>

</body>
</html>