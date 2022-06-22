<%@page import="com.util.ConnectionProvider"%>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 22. - 오전 10:54:30</title>
</head>
<body>
<h3>ex03.jsp</h3>
<pre>
	1. 커넥션 풀(pool) p415 ***중요***
	2. 세션(Session) p232 Chapter10 클라이언트와의 대화2 : 세션
	3. JSTL
	4. EL
	5. MVC
</pre>
<pre>
 커넥션 풀(pool) p415 ***중요***
	JSP 요청 + DB 연동 처리 + Connection 객체 생성, 닫기
	ㄴ DB 작업이 필요할 때 커넥션을 생성해서 사용.
	ㄴ JSP 페이지를 실행할 때 마다 커넥션을 생성하고 닫는데 시간이 소모 -> 동시 접속자가 많으면 성능이 낮아짐(떨어짐) -> 응답 늦어짐
	=> 이러한 이유로 커넥션 풀을 사용한다.

	커넥션 풀이란?
	 - DB와 연결된 커넥션을 미리 만들어서 풀 속에 저장해 두고 있다가 필요할 때에 커넥션을 풀에서 가져다 쓰고 다시 풀에 번환하는 기법
	 
	특징
	 - 풀 속에 미리 커넥션이 생성되어 있기 때문에 커넥션을 생성하는데 드는 연결 시간을 줄일 수 있음
	 - 커넥션을 계속해서 재사용하기 때문에 생성되는 커넥션 수가 일정하게 유지됨
	
	
	ㄱ. DBCP를 이용해서 커넥션 풀 이용하기(p417부터..)
		https://commons.apache.org 에서 3개의 파일을 다운로드하여 lib에 추가
	
	ㄴ. 톰캣이 제공해주는 WAS를 이용한 커넥션 풀 사용하는 방법 ***
		1) 사용하고 있는 아파치 톰캣 경로 안에서 lib 폴더 안에 tomcat-dbcp.jar 파일을 복사해서 WEB-INF/lib 안에 붙여넣기
		2) 톰캣 서버를 시작할 때 커넥션 풀 초기화 설정(생성하라는 설정 작업)
			ㄴ https://tomcat.apache.org 에서 설정 메뉴얼 찾아서 사용
				좌측 Documentation 메뉴에서 Tomcat 8.5 클릭 -> 좌측 User Guide의 10) JDBC DataSources 클릭
				-> Database Connection Pool (DBCP 2) Configurations 중 4.Oracle 클릭
				최종경로 : https://tomcat.apache.org/tomcat-8.5-doc/jndi-datasource-examples-howto.html#Oracle_8i,_9i_&_10g
				
		  a. META-INF 폴더 안에 context.xml 파일 추가하여 <Context> 태그 안에 1. Context cconfiguration 코드 추가
			
			<Context>
 				<Resource name="jdbc/myoracle"
			 	  auth="Container"
		          type="javax.sql.DataSource"
		          
		          driverClassName="oracle.jdbc.OracleDriver"
		          url="jdbc:oracle:thin:@127.0.0.1:1521:xe"
		          username="scott"
		          password="tiger"
		          
		          p423 커넥션 설정 관련 메서드 참고
		          maxTotal="20" -> 커넥션 풀 안에 최대 생성할 커넥션 객체 수(대기 + 일하는 객체)
		          maxIdle="10" -> 커넥션 풀이 보관할 수 있는 최대 유휴 객체 수 == 일을 안하고 있는 객체 == 대기하고 있는 객체
		          maxWaitMillis="-1"/> -> 최대 대기 시간을 설정 ms 단위, -1이면 커넥션 풀에 커넥션이 올때까지 무한정 기다림
		          	ㄴ 5000을 주면 5초만 기다렸다가 커넥션이 없으면 응답 못한다고 함 
			</Context>
		
		  b. web.xml에 코드 추가
		  	 <resource-ref>
  				<description>Oracle Datasource example</description>
  				<res-ref-name>jdbc/myoracle</res-ref-name>
  				<res-type>javax.sql.DataSource</res-type>
  				<res-auth>Container</res-auth>
 			</resource-ref>
 			
 		  c. Servers Restart를 하면 커넥션 풀 객체가 만들어짐
 	  
 	ㄹ. com.util.ConnectionProvider.java 생성 후 DBCP 커넥션 객체 반환하는 메서드 생성
		
</pre>
<%
	// 커넥션 풀 예제
	Context initContext = new InitialContext();
	Context envContext  = (Context)initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
	
	Connection conn = ds.getConnection();
//etc.
%>

<!-- DBCP conn = 606447381, URL=jdbc:oracle:thin:@127.0.0.1:1521:xe, Oracle JDBC driver -->
<!-- 새로고침하면 커넥션 달라짐! -->
DBCP conn = <%= conn %><br>

<%
	conn.close(); // 자동으로 커넥션 풀로 반환
%>

DBCP conn2 = <%= ConnectionProvider.getConnection() %><br>
</body>
</html>