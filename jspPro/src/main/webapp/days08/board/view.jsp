<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<!-- 모달창 띄우는 jQuery UI -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>2022. 6. 21. - 오전 10:32:06</title>
<style>
  table{
     border-spacing: 3px;
     border-collapse: separate; 
   }
   table,  tr, td {
      border:solid 1px gray;
      /* border-radius: 3px;  
      padding:3px;   */ 
   }
   
 #tblContent{
   width:600px;
 } 
</style>
</head>
<body>
<h3>view.jsp</h3>

<div align="center">
  <h2>내용보기</h2>
  <!-- <table id="tblContent" class="table"> -->
  <table id="tblContent">
   <tr>
       <td>이름</td>
       <td>${ dto.writer }</td>
       <td>등록일</td>
       <td>${ dto.writedate }</td>
   </tr>
   <tr>
       <td>Email</td>
       <td><a href="mailto:${ dto.email }">${ dto.email }</a></td>
       <td>조회</td>
       <td>${ dto.readed }</td>
   </tr>
   <tr>
        <td>제목</td>
        <td colspan="3">${ dto.title }</td>
   </tr>
   <tr>
       <td colspan="4" style="padding:15px;height: 200px;text-align: left;vertical-align: top">
       ${ dto.content }
       </td>
   </tr>
   <tr>
       <td colspan="4" align="center">
           <a class="btn btn-secondary"  href="<%= contextPath %>/board/edit.do?seq=${ dto.seq }" id="editLink">수정하기</a>
           <a class="btn btn-secondary"  href="<%= contextPath %>/board/delete.do?seq=${ dto.seq }" id="deleteLink">삭제하기</a>
           <a class="btn btn-secondary"  href="<%= contextPath %>/board/list.do" id="homeLink">Home</a>
           
           <input class="btn btn-secondary" type="button" id="btnModalDelete" value="모달창으로 글삭제">
       </td>
   </tr>
</table>
</div>

<!-- 삭제 모달창 div 태그 -->
<div id="dialog-form" align="cneter" title="삭제">
  <h2>삭제하기</h2>
  <!-- form 태그에 action 속성을 주지 않으면 삭제 클릭하면 http://localhost/jspPro/cstvsboard/view.htm?seq=343 이렇게 요청되어져서 View.java doPost 요청됨 -->
  <form action="<%= contextPath %>/board/delete.do?seq=${param.seq }" method="post">
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
         <!-- form태그에서 seq 파라미터 값을 action으로 주지 않을 경우 input 태그의 hidden 타입으로 파라미터 값을 가져가기 -->
         <%-- <input type="hidden" name="seq" value="${param.seq }"> --%>
       </td>
     </tr>
   </table>
  </form>
</div>

<script>
  // 1. 
  dialog = $("#dialog-form").dialog({
     autoOpen: false,
      height: 400,
      width: 350,
      modal: true,
      buttons:{},
      close: function (){
         form[0].reset();
      }
  });
  
  //2.
  form = dialog.find("form");
  
 // 3. 모달창 열기
  $("#btnModalDelete").on("click", function(event) {
     dialog.dialog("open" ); 
  });
 
  // 4. 모달창 닫기
  $("#cancel").on("click", function(event) {
     dialog.dialog("close" ); 
  });
</script>

<script>
	if('<%= request.getParameter("edit") %>' == "success"){
		alert("글 수정 완료!!!");
	}else if('<%= request.getParameter("edit") %>' == "fail"){
		alert("글 수정 실패...(비밀번호 오류 등)");
	}
</script>
</body>
</html>