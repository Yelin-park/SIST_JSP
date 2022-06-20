<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 20. - 오후 2:48:46</title>
<style>
table, td, th {
   border: solid 1px gray;
}

table {
   border-spacing: 3px;
   border-collapse: separate;
}

table, tr, td {
   /* border-radius: 3px; */
   /* padding:3px;  */
   
}
</style>
</head>
<body>
<h3>days05/board/write.jsp</h3>

<div align="center">
 <h2>글쓰기</h2>
 <!-- action 속성 값을 안줬기 때문에 자기 자신을 호출 -->
 <!-- method가 post 이기 때문에 Write.java 서블릿에서 doPost() 메서드 호출 -->
 <form method="post">
  <table style="padding: 2px; width: 600px">
         <tr>
            <td colspan="2" align="center"><b>글을 적어주세요</b></td>
         </tr>
         <tr>
            <td align="center">이름</td>
            <td><input type="text" name="writer" size="15"
               autofocus="autofocus" required="required"></td>
         </tr>
         <tr>
            <td align="center">비밀번호</td>
            <td><input type="password" name="pwd" size="15" required="required"></td>
         </tr>
         <tr>
            <td align="center">Email</td>
            <td><input type="email" name="email" size="50" ></td>
         </tr>
         <tr>
            <td align="center">제목</td>
            <td><input type="text" name="title" size="50" required="required"></td>
         </tr>
         <tr>
            <td align="center">내용</td>
            <td><textarea name="content" cols="50" rows="10"></textarea></td>
         </tr>
         <tr>
            <td align="center">HTML</td>
            <td>
              <input type="radio" name="tag" value="1" checked>적용
              <input type="radio" name="tag" value="0">비적용
            </td>
         </tr>
         <tr>
            <td colspan="2" align="center">
              <input type="submit" value="작성 완료">
              &nbsp;&nbsp;&nbsp; 
              <input type="reset" value="다시 작성">
              &nbsp;&nbsp;&nbsp; 
              <a href="<%= contextPath %>/cstvsboard/list.htm">Home</a>
            </td>
         </tr>
   </table>
 </form>
</div>
</body>
</html>