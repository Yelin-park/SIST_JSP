<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 15. - 오전 9:57:07</title>
</head>
<body>
<h3>ex02.jsp</h3>
<pre>
	p498
	1. 서블릿(Servlet)
	- java 언어를 사용하는 웹 기술(서블릿, jsp)
	- JSP 표준이 나오기 전에 만들어진 표준
	
	2. 서블릿 구현 방법(과정)
		1) [서블릿 규약]을 따르는 자바 클래스 선언
			ㄱ. 자바 클래스의 접근 지정자 : public
			ㄴ. javax.servlet.http.HttpServlet 클래스 상속 받아야함
			ㄷ. service(), get(), post() 메서드 오버라이딩
		
		2) 자바 코드를 컴파일해서 클래스 파일 생성
		3) 클래스 파일(.class)을 반드시 WEB-INF/classes 폴더 안에 넣어둬야 한다.
			2) + 3) 작업을 이클립스 툴을 사용하면 자동으로 컴파일 + classes 폴더에 넣기 때문에 안해도 된다.
		
		4) web.xml(DD파일)에 서블릿 등록하는 작업
		5) 톰캣 등의 웹 서버 실행
		6) 요청URL를 통해 서블릿 응답
	
	3. 예제 다루기(ex02.jsp와 Now.java / web.xml)
	
	4. 서블릿 ver 2.5까지는 서블릿을 web.xml에 등록해야 서블릿 클래스 사용 가능 p504
	   서블릿 ver 3.0부터는 @WebServlet 어노테이션을 사용하면 웹 컨테이너(톰캣)이 자동으로 서블릿 등록한다.
	   현재 사용하고 있는 서블릿 version?
	   		WAS 서버 version에 따라서 달라지고(톰캣은 각 버전의 Reference 확인)
	   		tomcat 8.5는 서블릿 4.0 version 
</pre>

<!-- /days01/now와 같은 요청URL 패턴으로 요청하여 Now.java 서블릿 클래스를 호출 -->
<a href="http://localhost/jspPro/days01/now">/days01/now</a><br>
<a href="http://localhost/jspPro/test/now">/test/now</a><br>
<a href="http://localhost/jspPro/test/today">/test/today</a><br>
<a href="http://localhost/jspPro/now.html">/now.html</a><br>
<a href="http://localhost/jspPro/now.htm">/now.htm</a><br>
</body>
</html>