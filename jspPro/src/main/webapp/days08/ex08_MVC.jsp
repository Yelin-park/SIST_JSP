<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 23. - 오후 12:08:28</title>
</head>
<body>
<h3>ex08_MVC.jsp</h3>
<pre>
	Part4의 MVC 패턴
	Chapter16 p516 MVC 패턴 *****
	그 후에..
	Chapter19 필터(p544)
	Chapter15 방명록 + MVC 패턴(p426)
	Chapter16 커스텀 태그 만들기(p469) 건너뜀		
	
	p368 MEMBER 테이블 생성
	CREATE TABLE member(
  	  	memberid VARCHAR2(10) NOT NULL PRIMARY KEY,
   	 	password VARCHAR2(10) NOT NULL,
   	 	name VARCHAR2(20) NOT NULL,
    	email VARCHAR2(80)
	)
</pre>
<pre>
	Chapter16 p516 MVC 패턴 *****
	- Java 개발자라면 반드시 모델2구조 기반의 MVC 패턴 이해 및 구현 -> 그래야 스프링 MVC 이해 가능
	
	1. JSP 웹 프로그램밍의 구조는 모델 1구조와 모델 2구조로 나뉜다.
		1) 모델 1구조 : JSP를 요청하면 바로 응답하는 구조
		 ex01.jsp 구현					 웹 컨테이너[서블릿 클래스 -> 서블릿 객체]	
		 클라이언트(웹 브라우저) ex01.jsp 요청 -> ex01.jsp 응답
		 
		2) 모델 2구조 : 웹 브라우저의 요청을 하나의 서블릿이 받는다.
			서블릿은 웹 브라우저의 요청을 알맞게 처리한 후 그 결과를 보여줄 JSP 페이지로 포워딩
			포워딩을 통해 요청 흐름을 받은 JSP 페이지는 결과 화면을 클라이언트에 전송
			이 과정에서 서블릿이 로직을 처리
		
		write.htm ->
		list.htm ->
				 ->		모든 요청을 하나의 서블릿이 요청을 받음(서블릿 1개) **
		view.htm ->
		delete.htm ->
		
		* 모든 요청을 받는 서블릿을 MVC의 C(컨트롤러)라고 한다.
		
		* 일처리는 클래스(서블릿이 아님)가 함 == MVC의 M 모델(model) 객체(==로직 클래스)라고 한다. == CommandHandler
			-> 우리가 만든 .java 서블릿은 모델 객체임
		  ex) write.htm으로 요청을 해서 1개의 서블릿이 요청을 받아 Write.java에게 로직을 처리하라고 함
		  	  list.htm으로 요청을 해서 1개의 서블릿이 요청을 받아 List.java에게 로직을 처리하라고 함
		  	  처리 결과를 서블릿이 받아서 아래 처럼 포워딩
		  	  
		* request.setAttribute("list", list) 포워딩하여 list.jsp에서 출력
			화면을 출력하는 list.jsp, write.jsp, view.jsp JSP 페이지를 MVC의 V(view) 출력 객체라고 한다.
			
	2. MVC 패턴의 핵심
	 - 로직을 처리하는 모델과 결과 화면을 보여주는 뷰를 분리
	 - 어플리케이션의 흐름 제어나 사용자의 처리 요청은 컨트롤러에 집중된다.
	 
	3. p520 표18.4 이해하고 암기 ***
	[1~5번이 서블릿의 역할]
	클라이언트(웹 브라우저)												서버
	주소[http://....]									[ 하나의 서블릿(컨트롤러) ]							클래스(자바빈 포함) CommandHandler
		/list.htm
		/write.htm		-> 요청 ->  1. 모든 http 요청을 받음												ListHandler.java
		/edit.htm					2. 받은 요청을 분석(ex. edit.htm : 게시글 수정)		  ->				EditHandler.java
		/view.htm					3. 로직 처리를 담당하는 클래스(모델 객체 == CommandHandler)를 찾아서 로직 처리를 시키라고 함
										ex. EditModel.java(모델)
									4. 모델 객체가 처리한 결과를 서블릿(컨트롤러)에게 돌려줌(받음)
									   -> 화면에 출력하기 위한 request / session / application 객체 등 저장공간에 저장을 함
									5. 화면 출력을 담당하는 뷰(view)가 누군지 파악
										edit.jsp로 포워딩 또는 리다이렉트 시킴
										
										edit.jsp로 화면에 출력(jsp 파일이 클라이언트에게 응답하는 것)
										
	4. p528 웹 브라우저를 통해서 명령을 전달하는 방법 2가지
	 1) 특정 파라미터를 이용해서 명령을 전달
	   ex) http://loacalhost/jpsPro/board/view.htm?seq=641
	 		> 글번호가 641번인 게시글의 내용을 상세보기 하겠다.
	   ex) http://loacalhost/jpsPro/board/list.htm?currentpage=28&searchCondition=2&searchWord=test
	   		> 현재페이지 2번 검색 조건 2(writer), 검색어(test)에 해당하는 글목록을 보겠다.
	   		
	 2) 요청 URL 자체를 명령어로 사용(요청 URL 자체에 명령어가 있음)
	   ex) http://loacalhost/jpsPro/board/view/641
	   		> 글번호가 641번인 게시글의 내용을 상세보기하겠다.
	
	* CommandHandler는 로직을 처리하는 모델 객체를 뜻함	
</pre>
</body>
</html>