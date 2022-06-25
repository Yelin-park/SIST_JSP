<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 24. - 오후 12:17:01</title>
</head>
<body>
<h3>ex04.jsp - ServletContextListener</h3>
<pre>
	p570 ServletContextListener
	
	리스너 = 이벤트를 처리?하는..
	
	서블릿은 다양한 시점에서 발생하는 이벤트와 이벤트를 처리하기 위한 인터페이스를 정의하고 있다.
	웹 어플리케이션에서 필요로 하는 데이터의 초기화나 요청 처리등을 추적할 수 있게 된다.
	ServletContextListener 인터페이스 => 서블릿이 발생시키는 이벤트를 처리하거나 요청 추적을 할 수 있는 인터페이스
	
	ServletContextListener를 이용한 이벤트 처리
	웹 컨테이너는 웹 어플리케이션이 시작되거나 종료되는 시점에 특정 클래스의 메서드를 실행할 수 있는 기능을 제공
	이 기능을 사용하면 웹 어플리케이션을 실행할 때 필요한 초기화 작업이나 웹 어플리케이션이 종료된 후 사용된 자원을 반환하는 등의 작업 수행
	
  1. 
   웹 컨테이너(==톰캣==WAS)가 시작/종료할 때 발생하는 이벤트를 처리할려고
   한다면 ServletContextLister를 구현한 클래스에서 처리를 하면 된다. 

  2. 방법
    ㄱ. ServletContextLister 인터페이스를 구현한 클래스 작성
        1) contextInitialzied() 웹 컨테이너(==톰캣==WAS)가 시작
                                웹 애플리케이션이 시작( 초기화 )   
        2) contextDestroyed()   웹 컨테이너(==톰캣==WAS)가 종료
                                웹 애플리케이션이 종료
    ㄴ. 위의 클래스를 web.xml 에 등록
    
  3. 
     SeverletContext  sc = getServletContext()
     SeverletContext == JSP의 application 기본 객체
     
     web.xml
     <context-param> 태그 설정

  4. 실습
  	ServletContextListener 인터페이스를 구현한 클래스 : DBCPinitListener 클래스
    com.listener.DBCPinitListener.java
	
</pre>
</body>
</html>