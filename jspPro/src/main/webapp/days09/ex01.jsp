<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 24. - 오전 8:54:44</title>
</head>
<body>
<h3>ex01.jsp</h3>
<pre>
	글목록 페이지에서 글쓰기 버튼 -> 글쓰기 완료 과정
	
	1. jspPro 웹 프로젝트 생성 -> contextPath는 /jspPro
	웹 어플리케이션을 찾아가기 위한 경로 == contextPath
	
	2. WEB-INF/lib/ojdbc6.jar - JDBC 연동
				  /jstl-1.2.jar - JSTL
				  /tomcat-dbcp.jar - 커넥션 풀 설정
	
	3. DBCP 설정
		ㄱ. META-INF/context.xml 
		ㄴ. web.xml <resource-ref>
		ㄷ. com.util.ConnectionProvider.java getConnection()
		    conn.close() -> 커넥션을 닫는 것이 아니라 커넥션 풀 반환(재사용)
	
	4. MVC 패턴 구현
		1) 모든 요청을 받는 컨트롤러(C) 구현 == 단 하나의 서블릿
			DispatcherServlet.java 
				[컨트롤러(서블릿)의 역할]
			- 요청을 분석 후..				
				doGet(){
					String requestURI = "/jspPro/board/wirte.do";
					requestURI = "/board/wirte.do"
					
					// WriteHandler가 인터페이스로 업캐스팅 되어짐
					CommandHandelr model = map.get("/board/wirte.do")
				}
				doPost(){}
				
		2) web.xml에 서블릿 등록 -> 모든 요청을 받을 수 있도록 url-pattern을 설정 (*.do로 설정)
		
		3) 커맨드 핸들러 객체
		  - CommandHandler 인터페이스 생성 -> String process(request, response) 함수 생성
			> 컨트롤러에서 request와 response를 전달하기 때문에 그 놈의 객체를 전달하기 위해 매개변수에 request와 resopnse를 준 것
			ListHandler.java	
			WriteHandler.java
			{
				// GET 방식
				return "/jspPro/board/write.jsp"
				
				// POST 방식
				 dto
				 int rowCount = dao.insert(dto)
				 // 리다이렉트
				 String loaction = "list.do?write=success"
				
				// 그 외 방식은 에러 띄움
			}	
			ViewHandler.java	
			EditHandler.java	
			DeleteHandler.java
		
		4) commandHandler.properties -> init() 메서드를 통해 key와 value를 Map에 put하기 위헤서
			/board/list.do=...ListHandler
			Properties prop.load(fr)
			while(){
				k = /board/list.do
				v = 객체 생성
				map.put(k, v)
			}	
</pre>
<pre>
[p544 Chapter19 필터(Filter)]
	1. 필터란?
	   정의 ? http 요청할 때 올바른 요청+ 요청 권한 체크
             응답할때 응답데이터를 변경(암호화) 등등을 할 수 있는 클래스
	
		- 필터는 HTTP 요청과 응답을 변경할 수 있는 '재사용 가능한 클래스'
		- 필터는 개체의 형태로 존재하며 클라이언트에서 오는 요청(request)과 최종 자원(JSP, 서블릿) 사이에 위치하여 클라이언트의 요청 정보를 알맞게 변결할 수 있다.
		- 힐터는 최종 자원과 클라이언트로 가는 응답 사이에 위치하여 최종 자원의 요청 결과를 알맞게 변경할 수도 있다.
		- 여러 개의 필터가 모여 하나의 필터 체인을 형성할 수도 있음
		- 필터는 웹 컨테이너 안에서 일어남
		
		ex) 로그인을 했으면 A 페이지로 안했으면 B 페이지를 보여주기 전에 필터를 통해 로그인이 되었는지 확인
		
			(UTF-8 인코딩)
		요청 -> 필터 -> 응답
		
		클라이언트 <- 필터 <- 응답
				   (보안)
				   
	 2. 필터 체인( chain )           
                    필터1            필터2
  클 ->   요청  -> [인증 확인]   -> [권한 확인] ->        자원( JSP/서블릿 등)
                                           %@ include file=".jspf"
                   list.html
                                                            currentPage=1 설정
                   currentPage=1                                        
          응답  <-  필터2       <-        중요한 데이터
                   [암호화]
	
	3. 필터 구현 방법 3가지		
      ㄱ. javax.servlet.Filter 인터페이스 구현
          1)  init()    필터 초기화 역할(필터를 초기화할 때 호출 )
          2)  destory() 필터 웹컨테이너에서 소멸(삭제)될때 호출되는 메서드
          3)  ***** doFilter() **** 필터 기능 수행, chain을 이용해서 체인의 다음 필터로 처리를 전달할 수 있음
              - 필터링할 작업( 코딩 ) : 인증, 권한 등등
              - 체크된 후에는   다음 필터 또는 자원에게  chain 을 이용해서 전달.
                                                         chain.doFilter()
      ㄴ. 요청 - javax.servlet.ServeltRequestWrapper 클래스
             필터가 요청을 변경한 결과를 저장하는 래퍼 클래스
             currentPage=1 파라미터를 가공(변경) 초기화  
             
      ㄷ. 응답 - javax.servlet.ServletResponseWrapper 클래스     
             필터가 응답을 변경하기 위해 사용하는 래퍼클래스
             원본데이터 -> 암호화데이터  


    4. 필터 클래스를 사용하려면 톰캣\lib\servlet-api.jar 파일을 추가해야하지만
       [이클립스]로 개발할 경우에는 추가할 필요가 없다. 
                
    5. init(  FilterConfig  객체  config )   
       FilterConfig  객체의 메서드
       ㄱ. String getFilterName() : 설정파일에서 <filter-name> 필터이름을 반환. 
       ㄴ. String getInitParameter(name) :       <init-param>
       ㄷ. getInitParameterNames()
       ㄹ. ServletContext  getServletContext() :  서블릿 컨텍스트 객체     
	
	6. 필터 설정하는 2가지 방법
		1) web.xml
			- dispatcher 태그를 사용하면 필터가 적용되는 시점 설정 가능
				ㄴ REQUEST(기본값) : 클라이언트의 요청인 경우 필터 적용
				ㄴ FORWARD : forward()를 통해 제어 흐름을 이동하는 경우 필터 적용
				ㄴ INCLUDE : include()를 통해 포함되는 경우 필터 적용
		2) @WebFilter 어노테이션
	
	7. 필터 사용하는 곳
		[요청]
		ㄱ. 인증/권한 체크하고자 할 때
			/admin/*
		ㄴ. 어떤 자원(JSP, 서블릿, 특정 이미지, 동영상 등등)에 로깅할 때
		
		[응답]
		ㄱ. 응답하고자 하는 데이터를 변환할 때(암호화, xml 변환, html 변환)
		ㄴ. 공통적인 부분이 있다면 필터로 만들어서 재사용 가능
	
	
	8. 필터 실습1
		ex02.jsp	form 태그 POST 방식으로 ex02_ok.jsp 한글 서브밋
		ex02_ok.jsp 한글 깨짐
			ㄴ [한글이 안깨지도록 필터를 추가하고 설정하기]
				(모든 페이지마다 request.setChar해도 되고
				공통모듈화 해도 되지만 필터를 사용하는 것이 더 좋음)
				
			1) 인코딩 필터 클래스 추가
				com.filter.CharacterEncodingFilter.java
				src 우클릭 New -> Filter도 있지만 이번에는 class로 만듦
			2) 필터 등록 - web.xml
				days08에서 썼던 web.xml을 복붙해서 web_days08_MVC.xml 이름 변경
				web.xml에는 서블릿 등록한 코딩 삭제하고 커넥션 풀 설정만 남겨두기
				모든 요청을 할 때 CharacterEncodingFilter.doFilter() 호출됨
				
	8-2. 필터 실습2
		1) days09 폴더 안에 아래 파일과 폴더 생성
			ㄴ ex03.jsp
			ㄴ admin 폴더 : admin 관리자로 로그인을 해야지만 사용할 수 있는 폴더
				-> 인증 + 권한 필요
			ㄴ board 폴더 : 반드시 로그인을 해야만 사용할 수 있다. (member 세션 값으로 로그인 정보가 들어가있음, 인증 처리는 세션을 사용)
				ㄴ ex03_list.jsp - 글 목록 페이지
				ㄴ ex03_write.jsp - 글 쓰기 페이지
			ㄴ member 폴더
				ㄴ ex03_logon.jsp
				ㄴ ex03_logout.jsp
				ㄴ ex03_logon_ok.jsp
		
		2) 필터 추가
			com.filter.LoginCheckFilter.java
			필터 등록하는 작업을 @WebFilter 어노테이션 사용 -> 수업 끝나고 어노테이션 주석처리하긔~
			
			문제점) ex03.jsp에서 글쓰기 클릭
				-> LoginCheckFilter 거쳐서 로그인 X
				-> ex03_logon.jsp 리다이렉트
				-> id/passwd 로그인 성공
				
				무조건 메인페이지로 이동 X -> 원래 요청URL 이동
				-> 지금은 메인페이지로 리다이렉트
				-> 글쓰기 페이지로 리다이렉트로 처리 *****
				
	
	[교재] 응답 필터 암호화 / xml -> html 변환 응답 예제
	
</pre>
</body>
</html>