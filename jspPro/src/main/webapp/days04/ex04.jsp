<!-- autoFlush="true" => 버퍼가 가득차면 자동으로 전송해라 / false는 자동으로 전송 X -->
<!-- buffer="8kb" => 기본 8kb이고, 8kb가 차면 autoFlush = true로 인해서 자동 전송 -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" autoFlush="true" buffer="1kb"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 17. - 오후 2:27:48</title>
</head>
<body>
<h3>ex04.jsp</h3>
<!-- 
	버퍼가 가득찼는데 전송을 하지 않아서 아래와 같은 에러 발생
	java.io.IOException: 오류: JSP 버퍼 오버플로우
-->
<%
	for(int i=1; i <= 11; i++){
		// 그 동안 1~9 버퍼에 1234 제거
		if(i == 10) out.clear(); // i가 10이라면 출력버퍼를 깨끗하게 지우겠다.
%>
1234	
<%		
	}
%>


<!-- 
버퍼 제거가 되어서 이것만 찍혔음
1234
1234

</body>
</html>
 -->
 
<pre>
 p110 웹 어플리케이션 배포
 톰캣의 webapps -> 안에 복붙
 
 war 파일로 만들기
 프로젝트 우클릭 export war 파일 만든 후 톰캣의 webapps 안에 추가하면 자동으로 압축이 풀림
</pre>
</body>
</html>


