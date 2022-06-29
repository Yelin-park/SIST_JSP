<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 28. - 오전 9:04:20</title>
</head>
<body>
<h3>ex01.jsp</h3>
<pre>
	p697 Chapter 부록B 파일 업로드
	
	1. 파일 업로드 : 클라이언트 -> 서버
	   파일 다운로드 :  서버 -> 클라이언트
	
	2. 파일 업로드
		- 게시판 + 첨부 파일
		- 자료실
		- 쇼핑사이트 : 상품 목록
		- 문서 파일 또는 이미지 파일 등을 서버에 올리는 작업(업로드)
	3. 실제 파일 업로드 하려면 아래 꼭 기억 *** 
		ㄱ. form 태그에 스트림 기반의 전송 방식인 method="post"로 설정
		ㄴ. 인코딩
			기본값은 application/x-www-form-urlencoded 이거인데 아래와 같이 변경 필요
			=> enctype="multipart/form-data"
	
	4. 예제
		ex02.jsp
		ex02_ok.jsp
		ex02_ok_02.jsp
	
	5. 파일 업로드( 서버에서 파일을 저장 )
		1) sis InputStream을 사용해서 개발자가 직접 구현 -> 잘 쓰지 않음
			ex) ex02_ok_02.jsp
		
		2) 외부 라이브러리 제공
			ㄱ. http://www.servlets.com
			
			ㄴ. cos-22.05.zip 다운로드 (version은 바뀜)
				압축을 푼 뒤에 lib 폴더 안에 있는 cos.jar 파일을 WEB-INF/lib 폴더 안에 저장
				더 많은 예제는 doc 폴더 참조
				
			ㄷ. request 객체로는 name, upload 파라미터 값이 null로 나옴
				[MultipartRequest] 클래스 제공 => 객체 생성해서 파라미터값 첨부파일 처리
				MultipartRequest mrequest = new MultipartRequest(ㄱ, ㄴ, ㄷ, ㄹ, ㅁ); 
                      ㄱ - request 객체
                      ㄴ - 서버에 저장될 위치(경로)
                      ㄷ - 최대 파일 크기
                      ㄹ - 파일의 인코딩 방식
                      ㅁ - 파일 중복 처리위한 인자(클래스 제공)
                      			a.txt
                      			a_1.txt
                      			
            ㄹ. 실습
            	1) days11 폴더 안에 upload 폴더 생성
            		ㄴ 배포했을 때의 경로를 봐야함(upload말고 metadate 어쩌구 저쩌구..)
            	2) ex03.jsp
            		ex03_ok.jsp
                      		
			
		3) 서블릿 3.0 또는 3.1 이상에서 기본적으로 제공하는 라이브러리 사용
			ㄱ. HttpServletRequest의 getPart() 메서드를 이용해서 업로드된 데이터에 접근하고
			ㄴ. 서블릿이 multilpart 데이터를 처리할 수 있도록 설정(2가지 방법)
				- @MultipartConfig 어노테이션 사용해서 설정
				- web.xml에 <multipart-config> 태그를 사용해서 설정
			  ex) p701 ~ p707 => ex04.jsp + UploadServlet / web.xml 설정
</pre>

<form action="" method="post" enctype="application/x-www-form-urlencoded">
	첨부파일 : <input type="file"/>
</form>


</body>
</html>