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
<title>2022. 6. 21. - 오후 12:14:20</title>
<style>
 table , td, th {
   border:solid 1px gray;
 }
 table{
     border-spacing: 3px;
     border-collapse: separate;
   }
   table,  tr, td {
    /* border-radius: 3px; */
    /* padding:3px;  */
   }
 table{
    width: 600px;
 }
</style>
</head>
<body>
<h3>delete.jsp</h3>

<div align="center">
  <h2>삭제하기</h2>
  <form method="post">
   <table>
     <tr>
       <td colspan="2" align="center"><b>글을 삭제합니다</b></td>
     </tr>
     <tr>
       <td align="center">비밀번호</td>
       <td>
         <input type="password" name="pwd" size="15" autofocus="autofocus">
       </td>
     </tr>
     <tr>
       <td colspan="2" align="center">
         <input type="submit" value="삭제">&nbsp;&nbsp;
         <input type="button" id="cancel" value="취소">
       </td>
     </tr>
   </table>
  </form>
</div>

<%	
	// Delete.java에서 error 값이 넘어왔다면..
	String error = (String)request.getAttribute("error");
	if(error != null){
%>
	<script>
		alert("<%= error %>");
	</script>
<%		
	}
%>

<script>
	// 취소 버튼을 클릭하면 view.htm 요청URL로 View.java 서블릿 호출하여 
	$("#cancel").on("click", function() {
		// hitory.go(-1); // 이게 맞는 코딩
		location.href = "<%= contextPath %>/cstvsboard/view.htm?seq=${param.seq}"; // 이렇게 하면 조회수 증가시키고 게시글 보여짐
	});
</script>
</body>
</html>