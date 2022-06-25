<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 24. - 오후 12:41:53</title>
</head>
<body>
<h3>ex05.jsp</h3>

<a href="/jspPro/days09/guestbook/list.do">방명록 목록</a>

<pre>
	p444 - MVC 패턴 방명록(guest) 구현
	// 코딩 교재 참조 (교재는 MVC 패턴이 아니라서 MVC 패턴으로 구현할 것)
	
	1. web.xml 복사 붙여넣기하여 web_days09.xml
	
	2. 테이블 생성 + 시퀀스 생성
	 ㄱ. 
       create table guestbook_message
     	(
          message_id number not null primary key
          , guest_name varchar2(50) not null
          , password varchar2(10) not null
          , message clob not  null
     	 ) ;    
      ㄴ.
   		create sequence seq_guestbook_message; 
   		
   		> Table GUESTBOOK_MESSAGE이(가) 생성되었습니다.
		> Sequence SEQ_GUESTBOOK_MESSAGE이(가) 생성되었습니다.
		
	3. ex05.jsp에 <a href="/jspPro/days09/guestbook/list.do">방명록 목록</a> 생성
	   days09 폴더 안에 guestbook 폴더 생성 + images 폴더 추가(압축집)
	
	4. 요청URL=커맨드핸들러
		기존에 있던 commandhandler.properties 파일 복붙해서 days09/guestbook 폴더 안에 넣고 수정
	
	5. 패키지 추가
		1) days09.guestbook.command 패키지 - MVC의 M == 모델 객체 == 커맨드 핸들러
			days08.mvc.command에 있는 CommandHandler 인터페이스 복붙
			GetMessageListHandler.java 클래스 추가
			WriteMessageHandler.java 클래스 추가
			
		2) days09.guestbook.controller 패키지 - MVC의 C == 컨트롤러이자 단 하나의 서블릿
			ㄴ DispatcherServlet 복붙
			GetMessageListHandler.java와 WriteMessageHandler.java에 implements 하고 오버라이딩하기 
						
		3) days09.guestbook.domain 패키지 - DTO
			ㄴ Message.java 생성 후 테이블 컬럼명과 동일하게 필드 추가
				ㄴ 비밀번호 관련 함수 2개 추가
				
		4) days09.guestbook.persistence 패키지 - DAO
			ㄴ IMessage.java 인터페이스
			ㄴ MessageImpl.java 클래스 DAO 
			
		5) days09.guestbook.service 패키지 - 자바,JDBC 서비스 클래스가 왜 필요한지??
			ㄴ ServiceException.java  - 서비스 함에 문제가 발생하면 ServiceException 예외 발생 시킬 예정
			ㄴ InvalidPasswordException.java - 비밀번호가 틀릴 경우 예외를 발생 시키기 위해서 선언
			ㄴ MessageNotFoundException.java - 메시지를 찾을 수 없을 경우에 예외를 발생시키겠다.
			ㄴ MessageListView.java 
				ArrayList<> list; 에 담아서
				게시판 글 목록가져오는 곳에서 PageBlock 클래스 만들었음
										ㄴ> 페이징블럭처리를 위한 정보..
			ㄴ GetMessageListService.java 서비스 객체 생성
				ㄴ public MessageListView getMessageList( int pageNumber ) 구현하려고 하니..
				MessageImpl.java에 아래 2가지 메서드 구현
					ㄴ public int selectCount(Connection con)
					ㄴ public List<Message> selectList(Connection con, int firstRow, int endRow)
										
		6) 확인
			a 링크 태그 클릭
			 ㄱ. /jspPro/days09/guestbook/list.do -> 방명록 list.do
			 ㄴ. DispatcherServlet.doGet() 호출
			 ㄷ. commandHandler.properties 파일 안에
				 /jspPro/days09/guestbook/list.do 요청에 맞는 GetMessageListHandler 모델 객체(커맨드 핸들러) 호출
			 ㄹ. GetMessageListHandler.process(){
			 		// 메서드 구현
			 		// 파라미터를 받아서 dao.XXX() 호출 했었는데 이렇게 구현하지 않고..
			 		목록을 가져오는 서비스 클래스를 호출 -> 호출하기 위해서 서비스 클래스 생성
			 		서비스 클래스에서 dao 호출하고 DB 처리를 해서 결과물을 가져옴
			 		
			 		MessageListView 객체로 저장해서
			 		
			 		return "list.jsp"
			 	} 
			 
			  - GetMessageListHandler.process() 구현
			  - 서비스 생성
			  - dao 구현
			  - list.jsp 생성
		
		6. WriteMessageHandler
			서비스
			DAO 메서드 코딩
			
		7. 방명록 삭제하기 - delete.do
			프로퍼티에 추가하기
			DeleteMessageHandler 구현
			DeleteMessageService 구현
			dao.select() 구현
			dao.delete() 구현
			com.uti.JdbcUtil.java 생성 및 구현
		
		8. 방명록 수정하기 - updateMessage.do?messageId=3 이렇게 요청되어짐
			프로퍼티에 추가하기
			UpdateMessageHandler 구현
			UpdateMessageService 구현
			dao.update() 구현
			
			
			MVC 패턴으로 구현하면 개발시간이 더 많이 걸리지만, 유지/보수 관리가 쉬움
			
			계층형..
										
</pre>
</body>
</html>