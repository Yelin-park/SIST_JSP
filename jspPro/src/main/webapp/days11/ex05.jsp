<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 28. - 오전 10:48:30</title>
</head>
<body>
<h3>ex05.jsp</h3>
<pre>
	[파일업로드(1개라고 가정) + 게시판 == 자료실]  MVC 패턴 X
	
	1. 테이블 + 시퀀스 생성
	create table filetest(          
     num number not null primary key  
     , subject varchar2(50) not null     
     
     , filesystemname varchar2(100) -- 실제 저장되는 파일명       a1.txt
     , originalfilename varchar2(100) -- 저장할 때 파일명             a.txt
     , filelength number  -- 파일크기
    );
    
  	create sequence seq_filetest;
  	
  	Table FILETEST이(가) 생성되었습니다.
	Sequence SEQ_FILETEST이(가) 생성되었습니다.
	
	2. days11 패키지 안에..
		FileTestDTO.java
		FileTestDAO.java
		FileTestServlet.java
</pre>
</body>
</html>