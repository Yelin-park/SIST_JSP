<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 파라미터가 null 값으로 들어올 경우의 예외처리
	String operator ="+";
	String demoOutPut = "";
	try{
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		operator = request.getParameter("operator");
		
		double result = 0;
		
		switch(operator){
			case "+":
				result = num1 + num2;
			break;
			case "-":
				result = num1 - num2;
			break;
			case "*":
				result = num1 * num2;
			break;
			case "/":
				result = num1 / num2;
			break;
		} // switch
		
		demoOutPut = String.format("%d%s%d=%.2f", num1, operator, num2, result);
	}catch(Exception e){
		// 파라미터가 null일 경우의 예외처리 하는 코딩은 아무것도 없지만 화면은 띄워줌
	}	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 15. - 오후 2:33:17</title>
</head>
<body>
<h3>ex04.jsp</h3>

<form method="get">
<input type="text" id="num1" name="num1" autofocus="autofocus" value="<%= request.getParameter("num1") == null ? "" : request.getParameter("num1") %>">
<select name="operator" id="operator">
 <option>+</option>
 <option>-</option>
 <option>*</option>
 <option>/</option>
</select>

<script>
	// 서버에서 먼저 실행되기 때문에 페이지 소스보기를 하면 operator 부분에 값이 들어와져있음
	$("#operator").val("<%= operator %>");
</script>

<%--
 <select name="operator" id="operator">
 <option <%= operator.equals("+") ? "selected" : "" %>>+</option>
 <option <%= operator.equals("-") ? "selected" : "" %>>-</option>
 <option <%= operator.equals("*") ? "selected" : "" %>>*</option>
 <option <%= operator.equals("/") ? "selected" : "" %>>/</option>
</select> --%>
<!-- EL로 처리하면 null일 경우에는 안찍힘! -->
<input type="text" id="num2" name="num2" value="${param.num2}">
</form>
<p id="demo"><%= demoOutPut %></p>

<script>
	$(":text").css("text-align", "center");

	$(":text").eq(1).on("keyup", function () {
		if(event.which == 13){
			$("form").submit(); // 입력받은 값을 전송(submit)하겠다.
		}
	});
</script>
</body>
</html>