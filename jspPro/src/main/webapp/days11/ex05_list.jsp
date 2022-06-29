<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 28. - 오전 11:21:11</title>
</head>
<body>

<h3 style="text-align:center">FileList - ex05_list.jsp</h3>
<table style="width:600px" border="1" align="center">
  <tr>
    <td align="right" colspan="4">
       <a href="write.ss">WRITE</a>
    </td>
  </tr>
  <tr>
    <td align="center" width="50">글번호</td>
    <td align="left" >제목</td>
    <td align="center" width="200">첨부파일</td>
    <td align="center" width="50">삭제</td>
  </tr>  
  <c:forEach items="${ list }" var="dto">
     <tr>
       <td align="center" width="50">${ dto.num }</td>
       <td align="left" >${ dto.subject }</td>
       <td align="center" width="200">   <!-- 실제 파일명 -->          
         <a href="/jspPro/days11/upload/${ dto.filesystemname }"> ${ empty dto.originalfilename ? "없음" :  dto.originalfilename}</a>
         </td>
       <td align="center" width="50">
          <a href="delete.ss?num=${ dto.num }&filesystemname=${ dto.filesystemname}">삭제</a>
          <a href="update.ss?num=${ dto.num }&filesystemname=${ dto.filesystemname}">수정</a>
       </td>
     </tr>
  </c:forEach>
</table>


</body>
</html>