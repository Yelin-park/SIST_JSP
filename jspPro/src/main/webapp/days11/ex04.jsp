<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 28. - 오전 10:27:50</title>
</head>
<body>
<h3>ex04.jsp - 서블릿 3.0 또는 3.1 이상에서 제공하는 라이브러리 사용</h3>
<!-- action 속성 추가 -->
<form 
     action="/jspPro/days11/upload"
     method="post" 
     enctype="multipart/form-data" >
 
    message : <input type="text" name="msg" value="hello world~" /><br>
    
    <button type="button">첨부 파일 추가</button>
    
    <!-- C:\Temp 폴더에 저장 -->
    <div id="demo">    
        첨부 파일 1 : <input type="file" name="file1" ><br>    
    </div>
    <input type="submit" value="전송" />
 
 </form>

<script>
   $(document).ready(function (){     
      $("button").on("click", function(event) {         
             var n = $("#demo :file").length + 1;
             $("#demo").append(  "첨부 파일 "+n+" : <input type='file' name='file"+n+"'><br>");           
      });//  click
      
   }); // ready
</script>

</body>
</html>