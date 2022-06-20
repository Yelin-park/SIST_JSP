<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%!  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 20. - 오후 12:17:14</title>
</head>
<body>
<h3>ex04.jsp</h3>

<!-- include.jspf로 인해서 contextPath 사용 가능 -->
<a href="<%= contextPath %>/cstvsboard/list.htm">게시판 글 목록</a>

<pre>
 1. sqldeveloper 실행 후 scott 계정 접속
 2. tbl_cstvsboard 테이블 존재 확인 후 SEQ_TBL_CSTVSBOARD 시퀀스 361번까지 사용 확인
 3. days05 폴더 안에 board 폴더 생성
 4. days05 패키지 안에 days05.board 패키지 생성
  	days05.board 패키지 안에
  	BoardDTO 클래스 생성
    BoardDAO 인터페이스 생성
    BoardDAOImpl 클래스 생성
    ㄴ DAO는 목록보기, 글쓰기 등에 맞춰서 코딩 추가하기
  
 5. /jspPro/cstvsboard/list.htm 요청URL에 해당하는 List.java 서블릿 생성하여 days05/board/list.jsp 포워딩 (게시판 글이 list.jsp 뿌려짐)
 
 6. /jspPro/cstvsboard/write.htm 글쓰기 링크 태그 클릭 
 	 Write.java의 doGet() 포워딩 -> write.jsp
 6-2. write.jsp에 새 게시글 정보를 입력한 후 '작성 완료' 버튼을 누르면
     /jspPro/cstvsboard/write.htm 요청URL로 POST 방식으로 요청이 일어나서
 	  Write.java 서블릿의 doPost() { dao.새게시글 쓰기() 메서드 호출}호출
 	  새 글 쓰는 작업이 완료되면 새 글을 가지고 리다이렉트 요청 -> 요청에 의해서 List.java 호출 -> 새 글 포함하여 포워딩하여 list.jsp
 
 7. 동적으로 페이징 처리하기
 		< 			1 2 3 4 5 6 7 8 9 10 		>
 		이전버튼, 시작번호				  끝번호 , 다음버튼
 	위와 같은 정보를 담는 PageBlock.java 클래스 선언하여 list.jsp에서 사용
 	
 	
 	내일 수업..
 	1) 글 목록에서 글 번호의 제목을 클릭하면 글 상세보기
 	2) 상세보기한 글을 수정, 삭제, 홈
</pre>
</body>
</html>
<!--  
1. 게시판
2. 테이블 생성 + 시퀀스 생성
3. BoardDTO
4. BoardDAO
	ArrayList<BoardDTO> list select()
5. BoardDAOImpl
	ArrayList<BoardDTO> list select() 구현
6. ex04.jsp
	<a href="/jspPro/cstvsboard/list.htm">글 목록</a>
	List.java 서블릿 생성 후 위의 URL로 요청시 호출
	ArrayList<BoardDTO> list = dao.select();
	request.setAttribute("list", list);
	포워딩 하여 list.jsp
	
	list.jsp 페이지 추가
	글 목록 보는 table 생성
	
	....
	
	페이징 처리하기 위해서
	BoardDAO에서 getTotalRecords 와 같은 함수 추가하여 Impl에 구현
	PageBlock 클래스 선언
	List.java 서블릿에서 페이징 정보를 담는 것을	request.setAttribute("pageBlock", pageBlock)로
	포워딩시 list.jsp에 가져가기
	list.jsp에서 페이징 처리하기
	
-->