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
<title>2022. 6. 20. - 오후 12:43:15</title>
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

tbody tr  td:nth-of-type(2) {
   text-align: left;
}

a {
   text-decoration: none;
   color: black;
}

a:hover {
   color: red;
}
</style>
<!-- 페이징 처리 style -->
<style>
.pagination {
   margin: 0 auto;
   display: flex;
   justify-content: center;
}

.pagination a {
   color: black;
   float: left;
   padding: 4px 8px;
   text-decoration: none;
   transition: background-color .3s;
}

.pagination a.active {
   background-color: dodgerblue;
   color: white;
}

.pagination a:hover:not (.active ) {
   background-color: #ddd;
}
</style>
<style>
.searchWord {
   background-color: yellow;
   color: red;
}
</style>
<style>
.title {
   display: inline-block;
   white-space: nowrap;
   width: 90%;
   overflow: hidden;
   text-overflow: ellipsis;
}
</style>
</head>
<body>
<h3>days05/board/list.jsp</h3>

<div align="center">
 <h2>목록 보기</h2>
 <a href="<%= contextPath %>/cstvsboard/write.htm">글쓰기</a>
 <table style="width: 600px;">
  <thead>
   <tr>
    <td width="10%">번호</td>
    <td width="45%">제목</td>
    <td width="17%">작성자</td>
    <td width="20%">등록일</td>
    <td width="10%">조회</td>
   </tr>
  </thead>
  <tbody>
  <!-- empty | not empty 연산자는 EL에서 사용하는 연산자 -->
   <c:if test="${empty list }">
    <tr>
     <td colspan="5">등록된 게시글이 없습니다.</td>
    </tr>
   </c:if>
   <c:if test="${not empty list }">
   <c:forEach items="${list }" var="dto"><!-- list를 dto 변수에 담아서 반복하겠다. -->
    <tr>
     <td>${dto.seq }</td>
     <td>${dto.title }</td>
     <td>${dto.writer }</td>
     <td>${dto.writedate }</td>
     <td>${dto.readed }</td>
    </tr>
   </c:forEach>
   </c:if>
  </tbody>
  <tfoot>
   <tr><!-- 페이징 처리하는 부분 -->
    <td colspan="5" align="center">
     <div class="pagination">
     
<%--       
<!-- <a href="#" class="active">1</a> -->
      <a class="active" href="<%= contextPath%>/cstvsboard/list.htm?currentpage=1">1</a>
      <a href="<%= contextPath%>/cstvsboard/list.htm?currentpage=2">2</a>
      <a href="<%= contextPath%>/cstvsboard/list.htm?currentpage=3">3</a>
      <a href="<%= contextPath%>/cstvsboard/list.htm?currentpage=4">4</a>
      <a href="<%= contextPath%>/cstvsboard/list.htm?currentpage=5">5</a>
      <a href="<%= contextPath%>/cstvsboard/list.htm?currentpage=6">6</a>
      <a href="<%= contextPath%>/cstvsboard/list.htm?currentpage=7">7</a>
      <a href="<%= contextPath%>/cstvsboard/list.htm?currentpage=8">8</a>
      <a href="<%= contextPath%>/cstvsboard/list.htm?currentpage=9">9</a>
      <a href="<%= contextPath%>/cstvsboard/list.htm?currentpage=10">10</a>
      <a href="<%= contextPath%>/cstvsboard/list.htm?currentpage=11">&raquo;</a> --%>
      <!-- request.setAttribute("pageBlock", pageBlock) -->
      <c:if test="${pageBlock.prev }"><!-- prev가 true이면 이전 버튼 생성 -->
      <!-- 페이징 블럭 시작하는 값의 -1로 돌아가기 -->
       <a href="<%= contextPath%>/cstvsboard/list.htm?currentpage=${pageBlock.startOfPageBlock-1}">&laquo;</a>
      </c:if>
      <c:forEach begin="${pageBlock.startOfPageBlock }" end="${pageBlock.endOfPageBlock }" step="1" var="i">
      <!-- 파라미터가 currentpage=? 넘어가기 때문에 pageBlock.currentPage 대신에 currentpage 사용 가능 -->
        <c:if test="${i == pageBlock.currentPage  }">
         <a href="#" class="active">${i }</a>
        </c:if>
        <c:if test="${i != pageBlock.currentPage }">
         <a href="<%= contextPath%>/cstvsboard/list.htm?currentpage=${i}">${i }</a>
        </c:if>
      </c:forEach>
      <c:if test="${pageBlock.next }"><!-- next가 true이면 다음 버튼 생성 -->
       <!-- 페이징 블럭 끝나는 값의 +1로 돌아가기 -->
       <a href="<%= contextPath%>/cstvsboard/list.htm?currentpage=${pageBlock.endOfPageBlock+1}">&raquo;</a>
      </c:if>
     </div>
    </td>
   </tr>
   <tr><!-- 검색하는 부분 -->
    <td colspan="5" align="center">
     <form action="">
      <select name="searchCondition" id="searchCondition">
        <option value="1">title</option>
        <option value="2">content</option>
        <option value="3">writer</option>
        <option value="4">title+content</option>
      </select>
      <input type="text" name="searchWord" id="searchWord" />
      <input type="submit" value="search" />
     </form>
    </td>
   </tr>
  </tfoot>
 </table>
</div>
</body>
</html>