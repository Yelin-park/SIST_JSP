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
<h3>ex03_05.jsp</h3>

<!-- jsp 액션태그 중 useBean 사용 -->
<!-- 자바 코딩이기 때문에 value='' 홑따옴표 사용하고 그 안에 쌍따옴표 사용하기 -->
<jsp:useBean id="info" class="days05.MemberInfo" scope="page"></jsp:useBean><!-- MemberInfo 자바빈즈 객체 생성 MemberInfo info = new MemberInfo() 동일 -->
<!-- 클래스의 필드명과 input태그의 name 속성 값이 동일하면 아래와 같이 사용할 수 있음 -->
<jsp:setProperty property="*" name="info"/> <!-- info 클래스의 모든 파라미터 값을 가져오겠다. -->
<jsp:setProperty property="registerDate" name="info" value='<%= new Date() %>'/>


<h3>MemberInfo 정보 출력</h3>
<!-- 3. 자바빈즈 정보 출력 -->
아이디 : <%= info.getId() %><br>
이름 : <%= info.getName() %><br>
비밀번호 : <%= info.getPasswd() %><br>
등록일 : <%= info.getRegisterDate() %><br>
이메일 : <%= info.getEmail() %><br>

</body>
</html>