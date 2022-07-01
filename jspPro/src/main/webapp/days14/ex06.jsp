<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2022. 7. 1. - 오전 11:51:40</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<h3>ex06.jsp</h3>

<h3><%= new Date().toLocaleString() %></h3>
<input type="button" id="btn1" value="jquery ajax + emp + json" />
<p id="demo"></p>          

 <script>
    $(function (){
        $("#btn1").on("click", function(event) {
           $.ajax({
                 // url:"ex06_emp_json.jsp",  
                 url:"ex06_emp_json_lib.jsp",  
                 dataType:"json",            // text, html, xml, script, 등등
                  type:"GET",
                  cache:false,                     // 꼭 기억
                  success:function (data, textStatus, jqXHR){ 
                     // data.emp            js Object 변환     
                     // {  "emp" : [ {},{},{},]}
                     // var empArray = data.emp;
                     $( data.emp ).each( function ( i , elem ){
                        $("#demo").append( $("<li></li>").text( elem.empno +" / " + elem.ename ) );
                     } ) ;
                     
                  }, 
                  error:function (){
                     alert("에러~~");
                  }
              });
        }) // click
    }); // ready
 </script>

</body>
</html>