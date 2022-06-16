<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 16. - 오전 10:35:33</title>
</head>
<body>
<h3>ex06.jsp</h3>
<pre>
	MVC 패턴
	M 로직 처리
	V 화면 출력
	C 컨트롤
</pre>
<pre>
	1. a 링크 태그 선언
	2. 서블릿 생성 - GET 방식 요청하기 때문에 doGet() 메서드만 오버라이딩
		ㄴ days03.ScottDept 서블릿 등록
			등록 2가지 방법
			1) web.xml - 수정된다면 이걸 수정
			2) @WebServlet 어노테이션 - 수정된다면 자바 수정
		
		doGet(){
			부서 정보를 ArrayList 저장(DB 데이터를 저장만 함)
			// 로직 처리
			ex06_dept.jsp에 포워딩시킴..
			
			// 화면 출력
			ex06_dept.jsp
		}
		
		프로젝트 진행할 때 모든 경로는 상대경로 X, /jspPro라고 하는 context Path부터 경로 설정
		웹의 경로 구분자는 /
		요청URL : /jspPro/scott/dept => 서블릿 선언 url pattern = ??? 
	
		ScottDept 서블릿 실행되고 난 다음에 아래 진행
	3. ex06_dept.jsp 포워딩 되어져서 부서정보가 select 태그로 출력되어짐
	
	4. ex06_dept.jsp -> select 태그에서 부서를 선택(이 작업을 ex06_dept.jsp에서 script 태그 안에 코딩)
	
	5. ScottEmp.java 서블릿 호출
		ㄴ 선택한 부서의 사원 정보를 ArrayList 저장 후
	
	6. ex06_emp.jsp 포워딩을 시켜서 해당 부서원 정보를 출력
</pre>
<%
	String contextPath = request.getContextPath();
%>
<a href="<%= contextPath %>/scott/dept">scott.dept(부서정보)</a>
</body>
</html>