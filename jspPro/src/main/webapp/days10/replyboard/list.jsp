<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2022. 6. 27. - 오전 11:14:14</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
a {
   text-decoration: none;
   color: black;
}

table, tr, td {
    border:solid 1px gray;
   border-radius: 3px;
   padding: 5px;
   font-size: 12px;
}
/*  
   tr.data:nth-last-child(odd) {
    background: gray;
   }
   
   tr.data:nth-last-child(even) {
       background: #EFEFEF;
   }
    */
tr.data:hover {
   background: #EFEFEF;
}
select , input{
  vertical-align:middle;
}
</style>

<script>
 $(function (){    
   $('#searchBtn').click(function (){
      // jquery 사용하는 선택자   :first
      // attr() 속성을 설정하거나 가져오는 함수
      $('form:first').attr('action','list.do');
      $('form:first').attr('method','get');
      $('form:first').submit();
   });
 });
</script> 

</head>
<body>

<h3>days10 - list.jsp</h3>

<h3 style="text-align: center">계층형 게시판</h3>
<table style="width:700px;margin:50px auto" border="1" >
   <tr>
     <td align="right" colspan="6">
         <a href="write.do">글쓰기</a>
     </td>
   </tr>
   <tr style="background:gray;color:white;font-weight:bold">
     <td width="50" align="center">번호</td>
     <td width="280" align="center">제 목</td>
     <td width="100" align="center">작성자</td>
     <td width="120" align="center">작성일</td>
     <td width="50" align="center">조회</td>
     <td width="100" align="center">IP</td>
   </tr>
   <tbody>
   <!-- request.setAtttribute("list", ??); -->
   <c:if test="${ empty list }">
     <tr class="data">
       <td align="center" colspan="6">
        <h3>작성된 게시글이 없습니다.</h3>
       </td>
     </tr>
   </c:if>
   <c:if test="${ not empty list }">
    <c:forEach items="${ list }" var="dto">
       <tr class="data">
         <td align="center">${ dto.num }</td>
         <td>          
           <c:if test="${ dto.depth gt 0 }">
             <img width="${ dto.depth*15 }px" >
             <img src="/jspPro/days10/replyboard/images/arr.gif" alt="" />
           </c:if>
           <a href="view.do?num=${ dto.num }&page=${ param.page }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }">${ dto.subject }</a>
           <c:if test="${ dto.newImg }">
             <img src="/jspPro/days10/replyboard/images/ico-new.gif" alt="" />
           </c:if>
         </td>
         <td>
           <c:if test="${ dto.writer eq 'kenik' }">
             <img src="/jspPro/days10/replyboard/images/star.gif" alt="" />
           </c:if>
           <a href="mailto:${ dto.email }">${ dto.writer }</a> 
         </td>
         <td>${ dto.regdate }</td>
         <td>${ dto.readcount }</td>
         <td>${ dto.ip }</td>
       </tr>
    </c:forEach>    
    <tr>
     <td align="center" colspan="6">
      <!-- request.setAttribute("pageBlock", "[1] 2 3 4 5 6 7 8 9 10 > ");-->
       ${ pageBlock }
     </td>
    </tr>
   </c:if>
    
   </tbody>
<form>
   <tr>
      <td colspan="6" align="center" style="padding:3px;">
        <select id="searchCondition" name="searchCondition" 
        style="font-size: 15px;">
          <option value="subject" ${ param.searchCondition eq "subject" ? "selected" : "" }>제목</option>       
          <option value="writer"  ${ param.searchCondition eq "writer" ? "selected" : "" }>작성자</option>
          <option value="subject+content">제목+내용</option>
        </select>
        <input type="text" name="searchWord"   value='${ param.searchWord }'>
        <input type="button" style="height:22px;width:50px"
        value="검색" id="searchBtn">
      </td>
    </tr>   
 </form>
</table>


</body>
</html>