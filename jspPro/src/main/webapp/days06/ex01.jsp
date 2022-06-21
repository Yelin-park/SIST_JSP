<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include.jspf"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 21. - 오전 9:02:50</title>
</head>
<body>
<h3>ex01.jsp</h3>

<a href="<%= contextPath %>/cstvsboard/list.htm">게시판 글 목록</a>

<pre>
	1조 : 게시글 선행 작업 + 글 목록 구현 순차적 정리
	
	2조 : 글목록 + 글쓰기 버튼 클릭 순차적 정리
	 write.html GET 요청 -> Write.java 서블릿
	 doGet() write.jsp 포워딩
	
	 작성완료 버튼 클릭 POST 요청 -> doPost() -> write.html + POST
	 입력받은 파라미터 BoardDTO dto 생성
	 BoardDAOImpl dao
	 int rowCount = dao.insert(dto)
	 list.htm 요청 -> List.java 서블릿 -> list.jsp
	 리다이렉트		list	포워딩
	
	3조 : 페이징 처리 관련 구현 순차적 정리
	 현재 페이지 번호, 한 게시글에 출력한 글 수, 페이징 블럭 수 정보 필요
	 ArrayList list = dao.select(currentPage, numberOfPage) -> select 변경
	 페이징 블럭 시작 값, 페이징 블럭 끝 값, 이전 버튼, 다음 버튼 정보 필요
	 PageBlock.java 클래스 선언하여 위의 정보를 담고 있음
	 request.setAttribute("pageblock", pageblock)으로 정보를 포워딩
	 list.jsp에서 JSTL로 뿌리는 작업 구현
	 c:forEach begin = 1 end = 10 step = 1 var = i
	 i == 현재페이지 active 클래스 href=# 주고 그렇지 않으면 a href="list.htm?currentpage=${i }>${i } /a
	 
	 질문) 왜 포워딩 방식이 아닌 리다이렉트?
	 	포워딩 방식으로 하게 되면 브라우저 url은 write.htm, 화면은 list.jsp
</pre>
<pre>
	- 새 게시글 작성한 후 목록 보기 화면 출력될 때 경고창을 띄워서 '새글 작성 완료' 보여주기
		ㄴ list.jsp에서 script 태그 안에 jquery 코딩	
</pre>
<pre>
	1. [게시글 상세보기]
		글 목록에서 하나의 게시글 제목을 클릭하면..
		http://localhost/jspPro/cstvsboard/view.htm?seq=365
		위와 같은 요청이 일어나고
		1) /cstvsboard/view.htm 요청 URL로 호출할 View.java 서블릿 생성, a링크태그 이기 때문에 doGet() 메서드 호출
		
		2) 글 번호를 주면 내용을 돌려주는 함수 생성 dto = dao.???(seq) + 해당 게시글 조회수 1증가하는 코딩
			BoardDAO 인터페이스 메서드 추가 : 조회수 증가
			BoardDAOImple 
			
		3) view.jsp 생성
		  request.setAttribute("dto", dto)로 담아서 view.jsp 포워딩
		  
		4) view.jsp에서 게시글 정보 출력 코딩	
		
	2. [게시글 수정하기]
		/cstvboard/edit.html?seq=364 -> 링크 태그 GET 방식 요청
		1) Edit.java 서블릿 요청하여 doGet(){
											입력받은 파라미터 값을 가지고 dto 생성
											dto <- seq=364
											request.setAttribute("dto", dto) 포워딩하여 edit.jsp
											}
		2) edit.jsp
			이름 : []
			제목 : [안녕 / hello] -> 수정할 수 있도록
			내용 : []
			등 출력
			[작성완료][취소]
			
		3) 작성완료 버튼을 눌렀을 때
			/cstvsboard/edit.htm 요청으로 Edit.java 서블릿 호출 -> form태그 action 없어서 자기 자신 호출
			method post이므로 POST 방식 요청 doPost() 메서드 호출
			/cstvsboard/edit.htm?seq=342
			넘겨져오는 파라미터를 가지고 새로운 dto 생성하여 dao.update(dto) -> 글목록 또는 상세보기 보여주는 포워딩 작업
	
	3. [게시글 삭제하기]
		1) view.jsp 글 상세보기 페이지의 삭제 버튼 클릭
		 	/cstvsboard/delete.htm?seq=${ dto.seq } 이 요청URL로 인해서 Delete.java 서블릿 호출 doGet(){} 메서드 호출해서 delete.jsp 포워딩 작업
			삭제 권한이 있어야 삭제 가능 - 관리자, 작성자 => 로그인 인증을 받아서 권한 처리를 해야함
			인증 + 권한 처리를 안배워서 
			
			
		2) delete.jsp에서 비밀번호 입력받아서 삭제 버튼을 클릭
			삭제 버튼 클릭시 /cstvsboard/delete.htm?seq=${ dto.seq } 가지고
			Delete.java 서블릿의 doPost(){
											dao.삭제메서드(seq, pwd);
											list.htm 리다이렉트 - 목록보기 }
											
		3) BoardDAO와 BoardDAOImpl에 delete() 생성 및 구현
		
		**
		요즘은 삭제할 때 삭제 페이지로 이동하는 코딩 안함(delete.jsp X)
		삭제 모달창을 띄워서 삭제 처리함
		view.jsp -> jQuery UI의 모달창 스크립트 코드 추가 후 수정함
	
	4. [게시글 검색하기]
		http://localhost/jspPro/cstvsboard/list.htm
		?
		searchCondition=2	=> 검색 조건 2번 content
		&
		searchWord=%EA%B2%8C%EC%8B%9C%EA%B8%80 	=> 게시글이라는 단어로
		
		List.java의 doGet() 호출
		
		문제) writer = 검색으로 검색후
			1 2 3 4 페이지 나옴
			2 페이지 선택을 하면 검색 결과의 2페이지가 출력되도록(현재 전체 결과의 2번째 페이지 출력)
	
	
	5. 부가적인 코딩 추가	
			
</pre>

</body>
</html>