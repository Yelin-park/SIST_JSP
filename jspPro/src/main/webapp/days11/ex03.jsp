<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 28. - 오전 9:49:13</title>
</head>
<body>
<h3>ex03.jsp - 외부 라이브러리(cos.jar) 사용하여 파일 업로드</h3>

<form 
     action="ex03_ok.jsp" 
     method="post" 
     enctype="multipart/form-data" >  <!-- 철자 틀린 경우 -->
 
    message : <input type="text" name="msg" value="hello world~" /><br>
    
    <button type="button">첨부 파일 추가</button>
    
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