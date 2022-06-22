<%@page import="days07.Member"%> <%@ page contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>2022. 6. 22. - 오후 2:39:55</title>
  </head>
  <body>
    <h3>ex07.jsp</h3>

    <pre>
	*** 세션 ***
	인증정보 : auth 세션 저장 -> 읽기
	장바구니 정보
	권한 정보
	기타 여러 가지의 정보를 세션에 저장할 때도 있다.
	이럴 때는 어떻게 사용하나?
	
	하나의 클래스를 선언해서 여러 가지 필드(정보)를 가지고 있는 객체 -> 세션 저장
	예) 로그인 한 회원의 ID, 이름, 나이, 주소, 연락처 등등 로그인 정보를 '세션에 저장' 하고 싶다.
		클래스를 선언 하지 않았다면 아래와 같이 저장했을 것
		 session.setAttribute("id", "admin");
		 session.setAttribute("name", "익순이");
		 session.setAttribute("age", "20");
		 
		Member m = new Member();
		session.setAttribute("member", m); 세션에 멤버라는 객체를 저장
</pre
    >

    <% Member member = new Member("admin", "관리자", 20, "서울시",
    "010-1234-5678"); session.setAttribute("user1", member); %>

    <h3>세션에서 member 객체인 user를 얻어와서 출력</h3>
    <% Member user = (Member)session.getAttribute("user1"); %> id = <%=
    user.getId() %><br />
    name = <%= user.getName() %><br />

    <!-- EL 안에서 세션에 있는 user 객체를 바로 사용할 수 있다. -->
    <!-- session.setAttribute에 담아놓은 Member 객체를 getAttribute로 가져와서 설정한 이름으로 사용 -->
    age = ${user1.age }<br />
    addr = ${user1.addr }<br />
    tel = ${user1.tel }<br />
  </body>
</html>
