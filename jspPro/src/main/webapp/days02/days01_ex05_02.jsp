<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// [jsp 기본 객체 중 하나 - request]
	//  ㄱ. 파라미터가 넘어오지 않으면 request.getParameter()로 얻어오면 null 값을 반환함 ***		
	//  ㄴ. ex05_02.jsp?n => ?뒤에 n만 찍히고 값은 나오지 않으면 ""(빈문자열)로 반환함 ***
	// getParameter 함수가 기본적으로 String을 반환
	
	String pn = request.getParameter("n");
	String content = "";
	if(pn != null){
		int n = Integer.parseInt(request.getParameter("n"));

		int sum = 0;
		for(int i=1; i <= n; i++){
			content += (i == n ? i : i + "+");
			sum += i;
		}
		content += "=" + sum;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 15. - 오전 9:03:05</title>
</head>
<body>
<h3>ex01.jsp</h3>
<!--
	질문) value = 10 상태 값이 유지되지 않는 이유는?
		ex05_02.jsp -> submit -> 서버 요청 ex05_02.jsp
		서버에 요청하고 응답하는 페이지가 다름 같은 ex05_02.jsp가 아님
		input 태그에 value 속성값이 유지가 되지 않음 == 상태관리X	
-->
<form>
<!-- 상태관리를 할 수 있도록 value에 코딩 -->
	정수 입력 : <input type="text" name="n" value="<%= pn == null ?  "" : pn %>" ><br> <!-- input태그 text박스가 하나일 때는 엔터를 치면 바로 submit이 되어짐 -->
	<span></span>
	<p id="demo">
<%
	if(pn != null) {
%>
<%= content %>
<%
	}
%>
	</p>
</form>

<script>
	$(function () {
		$(":text:first").focus().select();
		
		$("form[0]").submit(function () {
			var pattern = /^\d+$/	// 숫자인지 체크하는 패턴
			// js test() 메서드
			if(pattern.test($(":text:first").val())){ // 유효성 검사를 성공하면 
				return;
			} // if
			// 유효성 검사 실패
			//$("form > span") 과 같은 코딩(form 태그 안에 있는 span 태그) // 보였다가 3초동안 사라지겠다.
			$("span", "form").text("Not Valid").css("color", "red").show().fadeOut(3000);					
			event.preventDefault(); // 기본 기능 취소
		});
	});
</script>

</body>
</html>