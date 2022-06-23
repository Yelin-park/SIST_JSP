<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 23. - 오후 2:14:13</title>
</head>
<body>
<h3>ex09.jsp</h3>

<a href="<%= contextPath %>/board/list.do">MVC jspPro/board/list.do</a>

<pre>
	[# 모델 2 구조의 MVC패턴 게시판 구현하는 순서] [days05.borad 게시판 구현]
	1. days08 폴더 안에 board 폴더 생성
	
	2. 기존의 web.xml 사용 X 새로운 web.xml 사용
		ㄴ 기존의 web.xml을 web_days07.xml으로 이름 변경 - 7일 수업까지 사용한 web.xml
		ㄴ 새로운 web.xml은 DBCP 설정 부분만 남아있음
		
	3. 모든 요청을 받는 것은 '단 하나의 서블릿' = MVC의 C(컨트롤러)
		url-pattern으로 서블릿을 호출하기 때문에 모든 요청을 받을 수 있는 패턴 설정
		 url-pattern="/"	->
		 url-pattern="*.확장자" -> *.do 사용 -> days08.mvc.controller.DispatcherServlet.java 서블릿 생성		스프링MVC
		  list.do		  write.do		  edit.do		  view.do  ->  XXX.do
		  
	4. web.xml에 서블릿(컨트롤러) 등록
		<load-on-startup>1</load-on-startup>
		원래는 1개의 요청 -> 서블릿 객체 생성 -> 응답
		load-on-startup 설정한 이유?
		 - 요청이 없어도 톰캣(WAS) 서버가 시작될 때 서블릿 객체를 생성해서 바로 응답할 수 있도록 하기 위해서
		 - 서버를 시작될 때 미리 1개의 서블릿 객체를 생성
		 
	5. DispatcherServlet 코딩
	 a 링크 태그 요청 -> GET 방식 요청
	 브라우저 주소창에 입력해서 요청 -> GET 방식 요청
		
	6. 설정 파일 선언(추가) -> WEB-IFN 폴더 안에 commandHandler.properties(확장자가 프로퍼티) 생성 (New -> File)
		요청URL에 따라서 어떤 모델 객체를 찾아오는지 알려주는..
		요청URL -> 모델 객체(커맨드 핸들러)
		요청URL -> 모델 객체(커맨드 핸들러)
	
	7. CommandHandler 가 implements CommandHandler 인터페이스 오버라이딩
		ListHandler
		WriteHandler
		
		days08.mvc.command.CommandHandler.interface 선언		
		days08.mvc.command.ListHandler.java
		days08.mvc.command.WriteHandler.java
		days08.mvc.command.EditHandler.java
		
	8. DispatcherServlet.init() 구현 + DispatcherServlet.doGet() 구현
	
	9. /board/list.do 요청 -> ListHandler.process() 구현
		days05.board.List.java 코딩 복사해서 붙여넣기함
		
	10. days08/board/list.jsp -> days05.board.list.jsp 복사 붙여넣기
	
	11. list.jsp 에서
		ㄱ. <a href="<%= contextPath %>/board/write.do">글쓰기</a> 요청URL 수정
		ㄴ. board/wirte.do (GET) 방식
			WriteHandler.java 코딩 수정
			doGet()에서 write.jsp 포워딩
		ㄷ. days08/board/write.jsp 복붙
		DispatcherServlet에 doPost() 구현
		
	12. list.jsp에서 하나의 게시글 제목을 클릭하면 상세보기 view.htm => view.jsp
	ㄱ. list.jsp
		<td><a href="<%= contextPath %>/board/view.do?seq=${dto.seq}">${dto.title }</a></td> 수정
	ㄴ. commandHandler.properties 확인 후 /board/view.do=days08.mvc.command.ViewHandler 추가
		ViewHandler.java 생성 -> View.java 코딩 복사 붙이기
	ㄷ. view.jsp 복사 붙이기
	
	13. 수정하기, 삭제하기 과제 내주심
	프로퍼티 파일에 
	/board/edit.do=days08.mvc.command.EditHandler 있는거 확인함
	/board/delete.do=days08.mvc.command.DeleteHandler 추가
	
	view.jsp에서
	htm을 do로 수정
	delete.jsp에서
	location.href = "<%= contextPath %>/board/view.do?seq=${param.seq}";  수정
</pre>
</body>
</html>