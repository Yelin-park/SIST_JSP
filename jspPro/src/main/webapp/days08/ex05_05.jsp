<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 23. - 오전 10:54:41</title>
</head>
<body>
<h3>ex05_05.jsp</h3>
<pre>
	c:out 태그 == JspWriter 데이터를 출력하는 태그
</pre>

<%
	FileReader fr = null;
	String path = "days08/ex02.jsp";
	String realPath = request.getRealPath(path); // jspPro/days08/ex02.jsp 잡힘
	try{
		fr = new FileReader(realPath);
%>
	<pre>
		실제 배포 리얼 패스 <%= realPath %><br>
		escaoeXml 속성 true 설정을 하면 < 을 &lt; 로 바꿔서 HTML에서 인식하도록함<br>
		<c:out value="<%= fr %>" escapeXml="true"></c:out>
	</pre>	
<%
	}catch(Exception e){
%>
	에러 : <%= e.getMessage() %>
<%
	}finally{
		if(fr != null){
			try{
				fr.close();
			} catch(IOException ex){ }
		}
	}
%>

<hr />
<%
	try{
		
	}catch(Exception e){
		
	}finally{
		
	}
%>
<!-- 위의 자바 예외처리 코딩과 동일한 것 -->
<c:catch var="ex">
// 예외가 발생할 것 같은 코딩
</c:catch>
<c:if test="${ex != null }">
	${ex }
</c:if>

</body>
</html>