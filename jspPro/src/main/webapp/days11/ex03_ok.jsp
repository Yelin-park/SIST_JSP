<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%><!-- con.jar로 임포트 되어짐 -->
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 28. - 오전 9:49:25</title>
</head>
<body>
<h3>ex03_ok.jsp</h3>
<pre>
	MultipartRequest 객체가 에러 없이 생성이 되면
	'ㄴ'이라는 경로에 첨부된 파일은 업로드(저장) 완료한 상태
	
	MultipartRequest mrequest = new MultipartRequest(ㄱ, ㄴ, ㄷ, ㄹ, ㅁ); 
                      ㄱ - request 객체
                      ㄴ - 서버에 저장될 위치(경로)
                      ㄷ - 최대 파일 크기
                      ㄹ - 파일의 인코딩 방식
                      ㅁ - 파일 중복 처리위한 인자(클래스 제공)
                      			a.txt
                      			a_1.txt
                      			
                      DB 테이블에 파일 경로 있으면
                      <image src="파일 상품 경로">
                    
</pre>
<%
	//실제 물리적인 경로 생성하여 days11/upload에 저장
	String saveDirectory = pageContext.getServletContext().getRealPath("/days11/upload"); 
	System.out.println("> 실제 업로드 경로 : " + saveDirectory);
	File saveDir = new File(saveDirectory);
	if(!saveDir.exists()){ // 만들어지지 않았다면
		saveDir.mkdirs(); // 폴더를 만들겠다.
	} // 
	
	int maxPostSize = 5 * 1024 * 1024; // 5MB로 설정 / 단위는 byte이 
	String encoding = "UTF-8";
	
	FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	MultipartRequest mrequest = new MultipartRequest(
	      request , 
	      saveDirectory ,
	      maxPostSize ,
	      encoding , 
	      policy   
	);
	
	// 에러없이 완료됐다면 벌써 upload 폴더에 첨부된 파일이 모두 저장 완료되어짐
	
%>

<%
	String msg = mrequest.getParameter("msg");
%>
> 전송된 메시지 : <%= msg %><br>

<%
	Enumeration en = mrequest.getFileNames(); // getFileNames() 메서드가 첨부된 파일의 정보들을 가져옴
	while(en.hasMoreElements()){
		String name = (String)en.nextElement(); // 첨부된 파일 이름 file1, file2, file3으로 부터
		File uploadFile = mrequest.getFile(name); //  실제 파일 객체를 얻어옴
		String fileName = uploadFile.getName(); // 실제 파일명
		long fileLength = uploadFile.length(); // 파일크기
		
		// 클라이언트가 a.txt를 올렸는데 서버에 a.txt가 있다면 a_1.txt로 저장
		// 원래 파일명과 저장된 파일명이 달라지는 경우 발생
		String originalFileName = mrequest.getOriginalFileName(name); // 실제 클라이언트가 올린 파일 이름
		String fileSystemName = mrequest.getFilesystemName(name); // 서버에 저장된 파일 이름
%>
  > 첨부된 파일명 : <%= fileName %><br>
  > 첨부된 파일크기 : <%= fileLength  %> <br>
  > 첨부된 원래 파일명 : <%=  originalFileName%> <br>
  > 실제 저장된 파일명 : <%=  fileSystemName %><br>
  
<%		
	}
%>


</body>
</html>