<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
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
<title>2022. 6. 17. - 오후 3:42:34</title>
<style>
	div{
		border: 1px solid gray;
		padding: 5px;
		margin-top: 10px;
		max-height: 500px;
		overflow: auto;
	}
</style>
</head>
<body>
<h3>ex05_05.jsp</h3>

<%
// 이클립스의 실제 배포 경로 찾기 -> 물리적인 경로(서버가 있는 경로)
// String realPath = application.getRealPath("");
// C:\Class\JSPClass
//	\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspPro\
%>
<%
	String filePath = application.getInitParameter("filePath");	
	String realPath = application.getRealPath(filePath);
	// C:\Class\JSPClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspPro\days03
%>

<%
	File dir = new File(realPath); // realPath라는 경로에 있는 파일들을 가져오겠다.
	File[] fileList = dir.listFiles(); // 파일들을 파일배열에 담겠다.
%>

<form action="">
 <select name="file" id="file">
<%
	for(int i = 0; i < fileList.length; i++){
%>
	<option><%= fileList[i].getName() %></option>
<%		
	}
%>
 </select>
</form>

<%
	FileReader in = null;
	BufferedReader br = null;
	
	// ex05_05.jsp?file=ex03.jsp
	String pfname = request.getParameter("file");
	if(pfname == null){
		pfname = fileList[0].getName();
	}
	String fileName = String.format("%s\\%s", realPath, pfname);
	
	// fileName 잘 찍히는지 한번 확인해보기!
	
	StringBuffer sb = new StringBuffer();
	try{
		in = new FileReader(fileName);
		br = new BufferedReader(in);
		
		String line = null;
		
		while( (line = br.readLine()) != null ){
			sb.append(line + "\r\n");
		} // while
			
	}catch(Exception e){
		e.printStackTrace(); // JSP에서 꼭 넣기 에러 확인하기 위해서
	}finally{
		try{
			in.close();
			br.close();
		}catch(Exception e){
			e.printStackTrace();
		} // try
	} // finally
	
	String content = sb.toString();
	content = content.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>");
%>

<div>
 <code>
 <%= content %>
 </code>
</div>

<script>
	// 옵션 태그 하나를 선택하면 아래와 같이 파라미터가 날아감
	// http://localhost/jspPro/days04/ex05_05.jsp?file=ex03.jsp
	$("#file").change(function (event) {
		// $("form")
		$(this).parent().submit();
		
	});
	
	// 상태관리
	$("#file").val("<%= pfname %>");
</script>
</body>
</html>