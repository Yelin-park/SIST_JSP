<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2022. 7. 1. - 오전 11:18:48</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<h3>ex05.jsp</h3>

<form action="" method="get">
    deptno : <input type="text" name="deptno" value="10" /><br>
    <!-- ID( empno ) 가정   scott.emp 테이블의 empno 중복 체크 -->
    empno : <input type="text" name="empno" value="7369" />
    <input type="button" id="btnEmpnoCheck" value="empno 중복체크 - jquery ajax" />
    <p id="notice"></p>
    <br>
    ename : <input type="text" name="ename" value="" /><br>
    job : <input type="text" name="job" value="" /><br>
    <input type="submit" value="회원(emp) 가입" />
 </form>

<script>

$(function (){
    $("#btnEmpnoCheck").on("click", function(event) {
       // ?empno=7369
       var params = $("form").serialize();
       // jquery ajax 함수 :  [$.ajax()]   - get/post      json/xml/js 등등
       // ㄱ.  get    : getJSON(), getScript(), get()
       // ㄴ.  post  : post()
       //                  load()
       
       $.ajax({
          url:"ex05_idcheck.jsp",  // 프로젝트         MVC  idcheck.do -> 컨트롤러 -> 모델
          dataType:"json",            // text, html, xml, script, 등등
           type:"GET",
           data: params, 
           cache:false,  // cache는 반드시 false로 !! 지정안해주면 DB 변동되어도 과거 데이터를 계속 가져옴
           success:function (data, textStatus, jqXHR){
               // jqXHR == js  xhr객체
               // textStatus 상태
               // data ==   this.reponseText, this.reponseXML
               // JSON -> js Object 변환 ( JSON.parse() ) X
               if( data.count == 0){
                  $("#notice").css("color","black").text("사용 가능한 ID 입니다.");
               }else{
                  $("#notice").css("color","red").text("이미 사용 중인 ID 입니다.");
               }
              
           }, 
           error:function (){
              alert("에러~~");
           }
       });
    });
});

</script>


</body>
</html>







