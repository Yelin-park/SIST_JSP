<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 14. - 오후 4:37:33</title>
</head>
<body>
<h3>ex05_02.jsp</h3>

<%
	int num = request.getParameter("n") == null ? 5 : Integer.parseInt(request.getParameter("n"));
	int sum = 0;
	String content = "";
	for(int i=1; i <= num; i++){
		content += i + (i == num ? "" : "+");
		sum += i;
	}
	content += "=" + sum;
%>

<!-- action 값이 없기 때문에 자기 자신 URL을 호출 -->
<!-- 정수를 입력하고 엔터를 치면 서브밋(서버 제출)이 되어 ex05_02.jsp 응답하도록 코딩 -->
<form>
	정수 입력 : <input type="text" name="n" value="5"><br>
	<p id="demo"><%	out.append(content); %>	</p>
</form>

<script>
	$(function(){
		$(":text").keydown(function (event) {
			if(event.which == 13){
				$("form[0]").submit();
			} // if
		});
	});
</script>

</body>
</html>