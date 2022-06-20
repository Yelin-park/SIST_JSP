<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.jspf" %><!-- 일일히 이렇게 추가하는 것 보다는.. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 20. - 오전 11:02:56</title>
</head>
<body>
<h3>ex02_03.jsp</h3>
<pre> 
 p173 코드 조각 자동 포함 기능
 include file="/include.jspf" 이렇게 지시자로 붙이지 말고
 web.xml에 추가하자.
 ex) include.jspf 이 jsp 파일을 /days05 폴더 안의 모든 jsp 파일에 추가하기 위해서 web.xml에 jsp-config 태그를 사용해 추가
 
 
<%-- 
  <jsp-config>
   <jsp-property-group>
   	days05 폴더 안의 모든 파일한테
    <url-pattern>/days05/*</url-pattern>
    jsp 파일 맨 상단에다가 붙이겠다.
    <include-prelude>/common/header.jspf</include-prelude>
    jsp 파일 맨 아래에 붙이겠다.
    <include-coda>/common/footer.jspf</include-coda>
   </jsp-property-group>
  </jsp-config> --%>
</pre>
</body>
</html>