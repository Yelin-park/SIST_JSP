<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 29. - 오전 9:16:01</title>
</head>
<body>
<h3>ex01.jsp</h3>

<pre>
	1. MVC 패턴 왜 구현?
		- 모델 1구조 [] -> 요청 -> [jspXservlet]
					  <- 응답 <-
					  물건 진열, 계산, 청소를 1명이 다함
		
		- 모델 2구조(MVC 패턴)
			유지/보수 관리 쉬움
			
	2. 서비스와 핸들러를 왜 따로 만드는가?
		현업		컨트롤러 -> 핸들러 -> 서비스 -> DAO ->
			write.do 요청URL을 가지고 map에서 커맨드 핸들러를 찾음
				커맨드 핸들러 .process(){
								int rowCount = dao.insert(con, dto)
							}
							
							서비스 안에서 로그 기록과 글 조회, 조회 수 증가 처리
							만약 동시다발적 처리가 안되었으면 트랙잭션 처리
	
	3. get과 post 방식의 차이?
	form 태그의 method 방식 기본은 get
	get 
	
	write.do -> 컨트롤러 						-> 커맨드 핸들러
	post 방식	write.do 					-> WriteHandler
	게시판 글 작성	GET								ㄴ> process(){ request.getMethdo(); 메서드로 get인지 post인지 파악							
	새글쓰기			POST
				String viewPage = WriteHandler.process(){}
				포워딩(viewPage)
					
	WriteHandler.process(){
		if(GET){
			새 게시글을 작성할 수 있도록 write.jsp 응답
			request.setAttribute();
			return write.jsp // 포워딩 사용
		}else if(POST){
			서 + D -> dao.insert(dto) = 새로 작성된 글(dto)
			새로 저장된 글을 가지고 list.do 요청(클라이언트에게) 글목록 페이지로 이동
			String loaction = list.do
			requset.sendRedirect(location)
			이 안에서는 리다이렉트
		}else{
			response.sendError(요청 메서드는 X)
		}	
	}
	
야리니	-> A편의점
		x과자
		A편의점에 x과자가 없어서 B편의점으로 가라고 하는 것이 리다이렉트
야리니 -> B편의점
	  <-
요청URL은 B편의점으로 보임

A편의점에 x과자가 없어서 A편의점주가 B편의점에서 x과자를 가져와서 야리니에게 판매 -> 포워딩
요청URL은 A편의점이 보임



controller 패키지 - 컨트롤러 유지/보수 관리
domain 패키지 - DTO
persistenct 패키지 - DB처리 (DAO, DAOImpl)
service 패키지 - 서비스
command 패키지 - 커맨드 핸들러



싱글톤
private ListServie() {} // private 생성자 선언 이유? 외부에서 new ListService로 객체 생성 못하게
private static ListService instance = null; // private static 객체 변수
public static ListService getInstance() { // public static 메서드
	if(instance == null){ // instance가 null일 경우에는
		instance = new ListService(); // 새롭게 객체를 생성하고
	}
	return instance; // 있다면 그냥 돌려줘라
}

MessageListView 클래스는 = ArrayList<DTO> + PageBlock 클래스


- DAO 인터페이스 만드는 이유?
	인터페이스를 만든 후 mybatis, 스프링 JDBC을 사용하면 DAOImpl 만들지 않아도 알아서 만들어줌
	

init 메서드 부분에서
web.xml에서 설정한 init-param을 가져와 path 변수 초기화 시켜주고
realpath도 초기화를 하는 과정이 있는데
여기서 realpath 부분 코드를 잘 이해못하겠습니다.

이클립스에서 개발 + 톰캣 서버를 플러그인 = 개발 목적으로 사용
배포 경로 : realpath 폴더 
ㄴ 서버가 플러그인 되었을 때 실제 배포 경로


톰캣 웹서버 실행 중인 서버에 배포(게시)
jar
war

현재 웹서버도 우리 PC
</pre>

<pre>
	1. scottPro 웹 프로젝트 설정
	
	2. 초기화 설정
		- 커넥션 풀(DBCP)
		- lib 추가
		- web.xml
		- com.uitl, filter, listener
		등등
		
	2-2. MVC 패턴에 필요한 5가지 패키지 생성
		
		컨트롤러 생성
		
		.properties 파일 생성(WEB-INF에)
		
		핸들러 - CommandHandler 인터페이스 및 클래스 생성
		
		DTO
		 DeptDTO, EmpDTO 복붙
		 
		DAO 2개 생성(인터페이스 생성 생략)
		 DeptDAO 부서정보 반환하는 메서드 1개
		 EmpDAO 해당부서의 해당 사원 반환 메서드 1개
		
		Service 생성
		 ListDeptService
		 ListEmpService
		
	3. /scottPro/deptemp.do 요청 -> /days12/scott/list.jsp 만들어서
		contextPath가 프로젝트 명으로 잡히기 때문에 프러퍼티 파일에는 scottPro 빼야함
		
		select 태그를 만들어서 
			value = 부서번호(10)
			text = 부서명 있고
			기본 10번 부서 선택한 상태로 (옵션값 바뀌면 상태관리도 시킴)
			table 생성
		[v] 전체선택
		[] 1111
		[] 2222
		[] 3333
		
days04/ex01_forward
days04.TestDeptEmp.java + 서비스, DAO, 핸들러 만들기
</pre>
</body>
</html>