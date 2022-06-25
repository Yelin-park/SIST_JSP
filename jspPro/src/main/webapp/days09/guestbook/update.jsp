<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 24. - 오후 5:14:19</title>
</head>
<body>
<h3>update.jsp</h3>

<!-- 수정하고자 하는 입력 받은 값이 http://localhost/jspPro/days09/guestbook/updateMessage.do 이렇게 넘어감 -->
<form action="updateMessage.do" method="post">
      <div
         style="text-align:center;border: solid 1px gray; width: 270px; margin: 0 auto; padding: 10px">
         <h3>방명록 수정<span class="glyphicon glyphicon-heart-empty"></span></h3>
         ID : <input type="text" name="message_id" value="${ msg.message_id}" disabled="disabled" class="in"><br><!-- ID 값이 안넘어가서 -->
         이름 : <input type="text" name="guest_name" value="${ msg.guest_name }" class="in"><br>
         암호 : <input type="text" name="password" class="in"><br>
         메시지 :<br>
         <textarea rows="3" style="width:75%" name="message" class="in">${ msg.message }</textarea>
         <br> <input type="submit" value="메시지 수정하기">
      </div>
      
      <input type="hidden" name="h_id" value="${ msg.message_id }"/><br><!-- input 태그에 id를 담음  -->
      <input type="hidden" name="h_guestName" value="${ msg.guest_name }"/><br>
</form>

</body>
</html>