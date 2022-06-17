<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#accordion" ).accordion();
    $( "#tabs" ).tabs();
  } );
</script>
<title>2022. 6. 17. - 오전 11:39:28</title>
</head>
<body>

<h3>ex02_ok_jstl.jsp</h3>
<div id="accordion">
<!-- map을 얻어와서 entry를 반복하겠다. items로 map가져와서 var 변수에 담아서 반복 -->
<c:forEach items="${map }" var="entry">
 <h3>${entry.key }</h3><!-- entry의 key 값(SalgradeDTO dto)을 가져와서 1등급(700~1200) - 3명 형식을 뿌려줌 -->
 
 <!-- entry의 value 값이 ArrayList(사원 정보) -->
 <div>
  <p>
  	<!-- entry의 value 값(ArrayList)를 list라는 변수에 담겠다. -->
 	<c:set value="${entry.value }" var="list"></c:set>
 	<c:if test="${empty list }">
 	 <li>사원 정보가 존재하지 않습니다.</li>
 	</c:if> 
 	<c:if test="${not empty list }">
 	 <c:forEach items="${list }" var="dto">
 	 	<li>${dto.deptno } - ${dto.empno }/${dto.ename }/${dto.sal }</li>
 	 </c:forEach>
 	</c:if> 
  </p>
 </div>
</c:forEach>
</div>

<hr>

<div id="tabs">
  <ul>
<!--   
    <li><a href="#tabs-1">1등급 - (700~1200) - 2명</a></li>
    <li><a href="#tabs-1">1등급 - (700~1200) - 2명</a></li>
    <li><a href="#tabs-1">1등급 - (700~1200) - 2명</a></li> -->
    <c:forEach items="${map }" var="entry" varStatus="status">
     <li><a href="#tabs-${status.count }">${entry.key }</a></li>
    </c:forEach>
  </ul>
<!--
  <div id="tabs-1">
    <p>ec orci tincidunt interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>
  </div> -->
  <c:forEach items="${map }" var="entry" varStatus="status">
     <div id="tabs-${status.count }">
      <p>
       <c:set value="${entry.value }" var="list"></c:set>
       <c:if test="${empty list }">
 	      <li>사원 정보가 존재하지 않습니다.</li>
 	   </c:if>
 	   <c:if test="${not empty list}">
	       <c:forEach items="${list }" var="dto">
	        <li>${dto.empno }/${dto.ename }/${dto.sal }</li>
	       </c:forEach>
       </c:if>
      </p>
     </div>
   </c:forEach>
</div>

<!--
<div id="accordion">
  <h3>Section 1</h3>
  <div>
    <p>
    Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer
    ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit
    amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut
    odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
    </p>
  </div> 
</div>
-->

<!-- <div id="tabs">
  <ul>
    <li><a href="#tabs-1">Nunc tincidunt</a></li>
    <li><a href="#tabs-2">Proin dolor</a></li>
    <li><a href="#tabs-3">Aenean lacinia</a></li>
  </ul>
  <div id="tabs-1">
    <p>Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec arcu. Donec sollicitudin mi sit amet mauris. Nam elementum quam ullamcorper ante. Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>
  </div>
  <div id="tabs-2">
    <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
  </div>
  <div id="tabs-3">
    <p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p>
    <p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.</p>
  </div>
</div> -->
</body>
</html>