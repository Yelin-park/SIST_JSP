<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 20. - 오전 11:25:21</title>
</head>
<body>
<h3>ex03.jsp</h3>
<pre>
 p190 Chapter08 자바빈과 jsp:useBean 액션태그 -> 스프링할 때 도움
 
 1. 자바빈 == 자바빈즈 == JavaBeans
  - JSP 기반 웹 어플리케이션에서 정보를 표현하는 객체(클래스) 중 하나 == 정보를 담는 객체
   ex) 회원 정보, 게시판 글 등등
 
 2. 자바빈이 되기 위한 자바빈 규약
  1) private 필드 선언
  2) getter, setter(private에 접근할 수 있도록) 메서드
  3) 직렬화 (implements Serializable)
  
  정보를 담고는 전달할 때 사용되어지면 DTO가 될 수도 있다.
  == DTO == VO
  
  ex)
   1. days05 패키지 안에 MemberInfo.java 자바빈즈 선언
   2. ex03_02.jsp 추가
</pre>
</body>
</html>