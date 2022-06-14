<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 14. - 오후 4:00:07</title>
</head>
<body>
<h3>ex05.jsp</h3>
<pre>
 jq | js 사용해서 입력 텍스트 박스에 정수를 입력하고 엔터를 치면 demo라는 p 태그에 출력하는 코딩
  -> 클라이언트(브라우저)에서 출력
</pre>

정수 입력 : <input type="text" name="n" value="5"><br>
<p id="demo"></p> <!-- 5라면 1+2+3+4+5=15 -->
<script>
	$(function(){
		$(":text[name=n]").keyup(function (event) {
			if(event.which == 13){
				var n = $(this).val();
				var sum = 0;
				$("#demo").empty(); // $("#demo").text(""); 동일한 코딩
				
				for (var i = 1; i <= n; i++) {
					$("#demo").text(function (index, text) { // ( Integer index, String text )
						// index 매개변수 : 
					    // text 매개변수 : #demo의 text 값
						// console.log(index + " / " + text + " : " + i);
						return text + i + "+"; // 
					});
					sum += i;
				} // for

				$("#demo").text(function(index, text){
					return text + "=" + sum;
				});
			} // if
		});
		
		// 1번 풀이
/* 		$(":text[name=n]").keyup(function (event) {
			if(event.which == 13){
				var n = $(this).val();
				var sum = 0;
				var content = "";
				for (var i = 1; i <= n; i++) {
					sum += i;
					content += i + (i == n ? "" : "+");
				} // for
				content += "=" + sum;
				$("#demo").text(content);
			} // if
		}); */
		
	});

</script>
</body>
</html>