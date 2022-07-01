<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 7. 1. - 오전 8:29:46</title>
</head>
<body>
<h3>ex01.jsp</h3>
<pre>
	[jquery ajax + json] ***
	
	파일 추가
	ex02.jsp
	ex02_cd_catalog.xml = 보유하고 있는 CD
	
	XML ex) 가족사항 <가족사항><아버지><이름><나이> 이렇게 태그로 설정하던
			<어머니 이름="" 나이=""> 속성으로 설정하던
			
	------
	JSON
	ex03.jsp
	ex03_02.jsp (JSON과 js Object 변환)
	
	------
	[xml 데이터와 json 데이터 가져와서 테이블 만들기]
	ex04.jsp
	ex04_dept.xml
	ex04_dept.json - New -> File 생성 확장자 .json 주기
	
	------
	회원가입
	이름 : 홍길동
	나이 : 20
	주민등록번호 :
	우편번호 : 
	주소 : 
	아이디 : [yaliny] [아이디 중복 체크 버튼]  jquery ajax 처리 + DB 연동 ***
	ex05.jsp
	ex05_idcheck.jsp
	
	------
	[버튼을 클릭하면 사원 정보를 JSON으로 ajax 처리 + json_lib.jar 사용 예제]
	ex06.jsp
	ex06_emp_json.jsp
	ex06_emp_json_lib.jsp
	
	https://sourceforge.net/projects/json-lib/files/json-lib/json-lib-2.4/
	* json-lib-2.4-jdk15.jar 다운로드 받아서 lib 폴더에 추가
	
	JSON 라이브러리를 사용하기 위해서는 아래 파일도 lib에 추가해야함
	* https://mvnrepository.com/ 사이트에서 찾아서 다운 받으면 됨
		https://mvnrepository.com/artifact/net.sf.json-lib/json-lib/2.4
	- jakarta commons-lang 2.5
	- jakarta commons-beanutils 1.8.0
	- jakarta commons-collections 3.2.1
	- jakarta commons-logging 1.1.1
	- ezmorph 1.0.6
</pre>
<pre>
	jquery ajax + json + MVC + json_lib 패턴에 어떻게 적용?
	회원가입 ID 중복체크 예제로 다뤄볼 예정
	
	scottPro + 체크/확인
	emp -> json_lib.jar -> jquery ajax li 출력
</pre>
<pre>
	어제 오늘 수업 내용..
	ajax 개념
	어떤 곳에 ajax 사용?
	js, jquery로 ajax 처리 방법
	xml / json 형식 등등
	예제
</pre>
</body>
</html>