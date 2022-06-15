<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 14. - 오후 3:51:42</title>
</head>
<body>
<h3>ex04_02.jsp</h3>

<pre>
스크립트릿 : 서버에서 실행하는 스크립트
Jasper  컴파일
</pre>

<% 
	int sum = 0;
	for(int i = 1; i <= 10; i++){
		// out.append(i+"");
%>
<%= i %>
<%
		if(i != 10){
%>+<% // out.append("+");
		} // if
		sum += i;	
	} // for
	
%>
=<%= sum %> <!-- out.append("=" + sum); -->

<%--
1번
 <%
	int sum = 0;
	for(int i = 1; i <= 10; i++){
		out.append(i+"");
		if(i != 10){
			out.append("+");
		} // if
		sum += i;	
	} // for
	out.append("=" + sum);
%> --%>

</body>
</html>