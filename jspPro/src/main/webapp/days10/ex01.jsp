<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 27. - 오전 9:06:35</title>
</head>
<body>
<h3>ex01.jsp</h3>

<pre>
	[계층형(답변형) 게시판 - MVC 패턴]
	1. web.xml 복붙 web_days09_pm.xml 만든 후 web.xml은 커넥션 풀과 필터 등록하고 삭제
	
	2. days10 폴더
		ㄴ replyboard 폴더 생성
			ㄴ emotion 폴더
			ㄴ images 폴더
			
	3. MV[C] 컨트롤러 역할 -> (1) DispatcherServlet.java = 단 하나의 서블릿
								(2) init() 메서드 안에서 commandHandler.properties 파일
														ㄴ> list.do=ListHandler 생성
		모든 요청을 받아서 요청URL인 Key 값에 해당하는 커맨드 핸들러를 Map안에서 찾아옴
		커맨드 핸들러(M[V]C) = 로직 처리 객체 -> 이 안에서 .process() 메서드
														ㄴ> Service 클래스 -> Dao 메서드 호출 -> DB처리
														request.setAttribute() 저장(4가지 영역 중 1개에 저장하면됨)
														return "XXX.jsp"(뷰페이지)
														포워딩 또는 리다이렉트
								(3) CommandHandler. java 인터페이스
								(4) ListHandler.java 커맨드 핸들러
								(5) ListService.java
								(6) DAO/DAOImpl
								(7) 테이블 생성 + 시퀀스 생성
								(8) DTO 객체 생성
								(9) list.jsp 뷰 페이지 생성
								
	4. 답변형(계층형) 게시판 로직 이해 - http://taeyo.net/Columns/View.aspx?SEQ=100&PSEQ=9&IDX=1
	
		1) 오라클 DB안에 게시판 테이블 생성 후 아래 게시글 데이터 저장
			- 글번호는 시퀀스로 자동 증가
			글번호(seq:PK)	제목(subject)	그룹(REF)	순번(STEP)	깊이(DEPTH) ...
				1			 첫 번째 게시글		1			1			0
				2			 두 번째 게시글		2			1			0
				3			 세 번째 게시글		3			1			0
				4			 2-1 답글			2		(23)4			1
				5			 2-2 답글			2		 (2)3			1	***
				6			 2-3 답글			1			2			1	***
				
		1-2) list.jsp 글 목록 출력 페이지에서 아래와 같이 출력
			- ORDER BY ref DESC, step ASC
			글번호(seq:PK)	제목(subject)	그룹(REF)	순번(STEP)	깊이(DEPTH) ...
				3			세 번째 게시글		3			1			0
				2			두 번째 게시글		3			1			0
				6				 ㄴ 2-3 답글			1			2			1	***(DEPTH로 1만큼 들여쓰기)
				5				 ㄴ 2-2 답글			2		 (2)3			1	***
				4			 	 ㄴ 2-1 답글			2		(23)4			1
				1			첫 번째 게시글		3			1			0

				
	5. 이해 -> 코딩(해결방법1)
		1) 첫 번째 게시글(새글) 쓰기
			ㄱ. 글 그룹(REF)는 게시글번호(seq)랑 동일한 값으로 설정한다.
			ㄴ. 새글의 순번(STEP)은 0 또는 1로 설정한다.(예시는 1로 설정)
			ㄷ. 새글의 깊이(DEPTH)는 0 또는 1로 설정한다.(예시는 0로 설정)
		
		2) 답글 쓰기
			*** 어떤 부모글에 답글을 다는지를 알아야함
		  글번호(seq:PK)					그룹(REF)	순번(STEP)	깊이(DEPTH) ...
			2			 두 번째 게시글		2			1			0
			
			ㄱ. 글 번호(seq)는 부모글의 그룹(REF)과 동일한 값으로 설정한다.
			ㄴ. 1) 동일한 글그룹(REF)에서 부모 순번(STEP)보다 큰 것(STEP)들의 값을 1증가 시킴
				2) 그 후 새글의 순번(STEP)은 부모 순번(STEP) + 1 값으로 설정한다.
			ㄷ. 1) 동일한 글그룹(REF)에서 부모 깊이(DEPTH)
				2) 새글의 깊이(DEPTH)는 부모 깊이(DEPTH) + 1 값으로 설정한다.
	
	6. 테이블 + 시퀀스 생성
	
	7. DTO 생성
		days10.replyboard.controller	- MVC의 C 컨트롤러
			ㄴ DispatcherServlet.java (4) days09 복붙 후 수정
			ㄴ days10/replyboard/commandHandler.properties (6) days09 복붙 후 수정
		days10.replyboard.command 		- MVC의 M 모델
			ㄴ CommandHandler.java (5) days09 복붙 후 수정
			ㄴ ListHandler.java (7)
			ㄴ WriteHandler.java (8)
		days10.replyboard.domain 		- DTO
			ㄴ ReplyBoardDTO.java (1)
		days10.replyboard.persistence 	- DAO
			ㄴ IReplyBoard.java 인터페이스 (2)
			ㄴ ReplyBoardDAO.java (3)
		days10.replyboard.service 		- SERVICE
	
	8. 글쓰기 작업
		1) list.jsp에서 글쓰기 버튼을 클릭
			/days10/replyboard/write.do=days10.replyboard.command.WrtieHandler	+ GET 방식 요청
			새글 write.jsp 페이지로 포워딩
			write.jsp는 아래와 같은 입력 폼이 있음
			[] 입력
			[] 입력
			[] 입력
			[저장] 버튼
			
			입력 후 저장 버튼 클릭
			/days10/replyboard/write.do=days10.replyboard.command.WrtieHandler  + POST 방식 요청
			ㄴ WriteService
				ㄴ ReplyBoardDAO.insert() 호출
			list.do 리다이렉트
	
	9. 글 목록에서 보고자하는 게시글의 제목을 클릭 -> View.do -> ViewHandler.java -> view.jsp
		
	  [답글달기] 버튼을 클릭하면 write.do?num=?&ref=?&step=?&depth=? 요청으로 write.jsp로 뿌려지고 (GET 방식)
	  write.jsp에서 답글 값을 입력하고 저장하기 버튼을 클릭하면 write.do 요청 POST 방식 요청 -> WriteHandler 답글 부분 코딩 추가 -> WriteService 답글 다는 부분 수정
	  DAO의 insert() 메서드에 답글 다는 부분 추가 수정
	 	-> list.do 또는 view.do 
	 	
	10. 답글
		/write.do?num=2&ref=2&step=0&depth=0	-> write.jsp 이동
		[]입력
		[]입력
		[]입력
		[]입력
	 	write.jsp에서 답글 값을 입력하고 저장하기 버튼을 클릭하면 write.do 요청 POST 방식 요청 -> WriteHandler 답글 부분 코딩 추가 -> WriteService 답글 다는 부분 수정
	 	DAO의 insert() 메서드에 답글 다는 부분 추가 수정
	 	-> list.do 또는 view.do 
		
	  
			
			
			
		

--------------------------------------------------------------------------------------------------------------------
	[답변형(계층형) 게시판 로직]
		1) 오라클 DB안에 게시판 테이블 생성 후 아래 게시글 데이터 저장
			글번호(seq:PK)	제목(subject) 등등..
			1. 첫 번째 게시글
			2. 두 번째 게시글
			3. 세 번째 게시글
			4. 두 번째 게시글의 첫 번째 답글
			5. 두 번째 게시글의 두 번째 답글
			6. 두 번째 게시글의 두 번째 답글의 첫 번째 답글
			7. 세 번째 게시글의 첫 번째 답글
		
		1-2) list.jsp 글 목록 출력 페이지에서 아래와 같이 출력
			- 최신 글이 먼저 출력(ORDER BY seq DESC)
			
			글번호(seq:PK)	제목(subject) 등등..
			7. 세 번째 게시글의 첫 번째 답글 (이렇게 뿌려지는데 이렇게 보이면 안되고)
			6. 두 번째 게시글의 두 번째 답글의 첫 번째 답글 (이렇게 뿌려지는데 이렇게 보이면 안되고)
			5. 두 번째 게시글의 두 번째 답글 (이렇게 뿌려지는데 이렇게 보이면 안되고)
			4. 두 번째 게시글의 첫 번째 답글 (이렇게 뿌려지는데 이렇게 보이면 안되고)
			3. 세 번째 게시글
				ㄴ 7. 세 번째 게시글의 첫 번째 답글 (이렇게 보이는 작업을 해야함)
			2. 두 번째 게시글
				ㄴ 4. 두 번째 게시글의 첫 번째 답글 (이렇게 보이는 작업을 해야함)
				ㄴ 5. 두 번째 게시글의 두 번째 답글 (이렇게 보이는 작업을 해야함)
					ㄴ 6. 두 번째 게시글의 두 번째 답글의 첫 번째 답글 (이렇게 보이는 작업을 해야함)
			1. 첫 번째 게시글
						
		답글을 달기 위한 선행 조건)
			ㄱ. 하나의 보고자 하는 게시글 클릭 view.do -> view.jsp (2번 게시글 클릭) 
				2번 게시글 내에서 [수정][삭제][답글][Home] 버튼이 있고 답글 버튼을 클릭해야함
		
		답글을 list.jsp에서 아래와 같이 출력하기 위해서(관련된 게시글에 답글의 답답글..)
			3. 세 번째 게시글
				ㄴ 7. 세 번째 게시글의 첫 번째 답글
			2. 두 번째 게시글 (1)
				ㄴ 4. 두 번째 게시글의 첫 번째 답글 (2)
				ㄴ 5. 두 번째 게시글의 두 번째 답글 (3)
					ㄴ 6. 두 번째 게시글의 두 번째 답글의 첫 번째 답글 (4)
			1. 첫 번째 게시글
			
			 => 해결 방법1 : 하나의 게시글을 묶어줄 수 있는 그룹화 컬럼을 추가(REF)
			 			   그룹 안에서도 순서를 지정할 수 있는 컬럼 추가(STEP)
			 			   새 글? 답글? 답답글? 답답답글? 인지 파악이 되어야 들여쓰기 가능 구분을 할 수 있는 컬럼 추가(DEPTH)
			 		DEPTH : 0	  1		2		3 ...

			 => 해결 방법2 : 하나의 게시글을 묶어줄 수 있는 그룹화 컬럼 + 그룹 안에서 순서 컬럼 추가 (THREAD = REF + STEP)
			 			   새 글? 답글? 답답글? 답답답글? 인지 파악이 되어야 들여쓰기 가능 구분을 할 수 있는 컬럼 추가(DEPTH)
			 		DEPTH : 0	  1		2		3 ...			 		
			
		- THREAD로 ORDER BY를 하면	
		글번호(seq:PK)	제목(subject) 				THREAD			DEPTH
			1 			첫 번째 게시글				1000			0		(1~1000) 하나의 그룹
			2 			두 번째 게시글				2000			0		(1001~2000)
			3 			세 번째 게시글				3000			0		(2001~3000)
			4 			2-1							1998			0
			5 			2-2							1999			0			
			6 			2-2-1						1999			1
			7 			3-1
		
		
		
		
		
		
		
		
</pre>
</body>
</html>