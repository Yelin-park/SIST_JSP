<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2022. 6. 24. - 오후 3:33:09</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">

<!-- 모달창(삭제하기) -->
<link rel="stylesheet"   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

body, * {
   font-size: 12px;
}

input[type=text], textarea {
   border: solid 1px gray;
}

.in {
   /* color: green; */
}

a {
   text-decoration: none;
}

a:hover {
   color: black;
}
</style>

<script>
    // window.onload = function (){}
   $(function() {
      // 방명록 열기 닫기 버튼을 클릭
      $("#btnWrite").click(function (){
         $("#write_box").slideToggle("slow"
               , function (){    // 열기, 닫기 작업 된 후에 function() 호출 
             $("#btnWrite").val(
                   $("#btnWrite").val().indexOf("열기") != -1
                   ?"방명록 쓰기 닫기":"방명록 쓰기 열기");
         });
      });
      
      $('tr:even').css({
         'background' : 'gray',
         'color' : 'white'
      });
      
      $(':input').first().focus();

      // 클래스명이 btnDelete 을 클릭할 때.....
      $(".btnDelete").click(function(){
         // 삭제 게시글의 실제 비밀번호를 js 변수 
         del_password = $(this).attr('alt');  // 비밀번호
         del_messageId = $(this).attr('name'); // 메시지 ID 값 PK
         
         // 모달창 띄우는 함수 : modal()
           $("#myModal").modal({backdrop: "static"});
           $("#myModal").on('shown.bs.modal', function () {
              $('#password').focus();
           });
       });
      
      $('#myModal > div').css({
         "width":"400px"
         ,"top":'150px'
         ,"margin":'0 auto'
      });
      
      // 
      var del_messageId, del_password ;
      
      $('#btnDeleteGo').click(function (){ // 60 라인에 비밀번호 가져옴
         // 삭제하기 위해 입력한 비밀번호  $('#password').val() 
         if( $('#password').val() != del_password){
            alert(' 비밀번호 틀림!!!');
            return;
         }
         
         location.href="deleteMessage.do?messageId="+del_messageId+"&password="+del_password;
      });
      
      // 수정하기
      $('.btnEdit').click(function (){         
         //alert($(this).parents('tr').prev().css({"display":"none"}));
         alert( $(this).parents('tr').prev().find(".m_message").html());
         
      });
   });
</script>

</head>
<body>

<h3>방명록 list.jsp</h3>


<div style="text-align: center">
<input type="button" id="btnWrite" value="방명록 쓰기 열기"   />
</div>
<hr>

<div id="write_box" style="display: none;">   
   <form action="/jspPro/days09/guestbook/write.do" method="post">
      <div
         style="text-align:center;border: solid 1px gray; width: 270px; margin: 0 auto; padding: 10px">
         <h3>방명록<span class="glyphicon glyphicon-heart-empty"></span></h3>
         이름 : <input type="text" name="guest_name" class="in"><br>
         암호 : <input type="text" name="password" class="in"><br>
         메시지 :<br>
         <textarea rows="3" style="width:75%" name="message" class="in"></textarea>
         <br>
         <input type="submit" value="메시지 남기기">
      </div>
   </form>
</div>   


<hr> 
   <div id="gm_box"
      style="border: solid 1px gray; width: 270px; margin: 0 auto; padding: 10px">
      <c:if test="${ empty viewData.messageList   }">
        등록된 메시지가 없습니다. 
      </c:if>
      <c:if test="${ not viewData.isEmpty() }">
         <table border="1" width="250px">
            <c:forEach items="${ viewData.messageList }" var="message">
               <tr>
                  <td>
                     <div style="position: relative;">
                       메시지ID : <span class="m_id">${message.message_id }</span> <br>
                      손님 이름 : <span class="m_name">${message.guest_name }</span>
                     <img src="./images/${message.guest_name }.gif" alt="" style="height:100%;position:absolute;right:0;top:0;" />
                      <br>
                     메시지 : <span class="m_message">${ message.message }</span><br> 
                     </div>                     
                  </td>
               </tr>
               <tr>
                  <td align="center">
                  <!-- alt 속성에 실제 그 글의 비밀번호 숨겨... -->
                  <input type="button" class="btnDelete"
                     name="${ message.message_id }" value="[삭제하기]" 
                     alt="${ message.password }"><!-- 삭제하고자 하는 방명록의 비밀번호가 들어가있음 -->
                  <input type="button" class="btnEdit"
                     name="${ message.message_id }" value="[수정하기]" 
                     alt="${ message.password }">
                        
                  <a href="updateMessage.do?messageId=${ message.message_id }">
                  [수정하기]
                  </a>   
                 </td>
               </tr>

            </c:forEach>
         </table>
         <%-- 현재페이지 : ${ viewData.currentPageNumber }<br> --%>
         <div style="text-align: center">
            <c:forEach var="pageNum" begin="1"   end="${ viewData.pageTotalCount }">
               <c:if test="${ pageNum eq viewData.currentPageNumber }">
                  <span style='color: red'>${ pageNum }</span>
               </c:if>
               <c:if test="${ not (pageNum eq viewData.currentPageNumber) }">
                  <a href="list.do?page=${ pageNum }">${ pageNum }</a>
               </c:if>
            </c:forEach>
         </div>
      </c:if>
   </div> 
   
   <!-- Modal -->
   <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog">

         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">방명록 삭제</h4>
            </div>
            <form action="deleteMessage.do" method="post">
               <div class="modal-body">               
                  <%-- <input type="hidden" name="messageId" value='${ param.messageId }'> --%>
<input type="hidden" name="message_id" value='${ param.message_id }'>
                  메시지를 삭제하시려면 암호를 입력하세요 : <br> 
                  암호 : <input type="password" id="password" name='password'><br>
               </div>
               <div class="modal-footer">
                  <!-- <input type="submit" class="btn btn-default" value="메시지 삭제하기" alt=""> -->
<input type="button" id="btnDeleteGo" class="btn btn-default" value="메시지 삭제하기" alt="" style="font-size:10px">
                  <input type="button" class="btn btn-default" data-dismiss="modal" value="닫기" style="font-size:10px">
               </div>
            </form>
         </div>
      </div>
   </div>

   <!-- list.jsp -->
   <script>
     var error = <%= request.getParameter("error") %>;
     if( error != null && error == 0){
        alert("비밀번호가 잘못되어서 수정 못했습니다. ");
     }
   </script>

</body>
</html>