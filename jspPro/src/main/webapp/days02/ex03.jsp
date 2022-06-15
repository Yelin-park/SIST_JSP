<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 스크립트릿
	String contextPath = request.getContextPath();
	System.out.printf("> 컨텍스트 패스 : %s\n", contextPath); // > 컨텍스트 패스 : /jspPro
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
</script>
<title>2022. 6. 15. - 오전 11:27:07</title>
</head>
<body>
<pre>
	jQuery 사이트 접속 -> UI 클릭 -> 좌측에 Widgets의 Tabs
	
							wepapp 폴더
	http://localhost/jspPro  	-> context root == context path
	context path로 지정해주면 경로가 바뀌어도 잘 가져와진다.
</pre>

<div id="tabs">
  <ul>
    <li><a href="#tabs-1">GET 방식 요청</a></li>
    <li><a href="#tabs-2">POST 방식 요청</a></li>
  </ul>
  <div id="tabs-1">
    <p>
     정수 입력 : <input type="text" name="n" id="n">
     <br>
     <!-- a 링크태그로 요청을 하면 get 방식으로 요청이 된다. [암기] -->
     <!-- 아래 링크태그를 클릭하면 위의 text 박스의 값을 가지고 가고 싶다. ?n=10 이걸 js나 jq로 구현해주어야함 -->
     <!-- <a href="/jspPro/days02/ex03_ok.jsp">ex03_ok.jsp</a> 		/jspPro를 contextPath로.. -->
     <a href= "<%= contextPath %>/days02/ex03_ok.jsp">ex03_ok.jsp</a>
    </p>
  </div>
  <div id="tabs-2">
    <p>
    <!-- form method="get" action="" -->
     <form>
      Name : <input type="text" name="name" id="name" autofocus="autofocus"><br>
      Age : <input type="text" name="age" id="age"><br>
      <input type="radio" name="method" value="get" checked="checked">GET 요청
      <input type="radio" name="method" value="post">POST 요청
      <br>
      <button type="button">전송(submit)</button>
     </form>
<!-- <a href="/jspPro/info">/info</a> -->
     <a href="<%= contextPath %>/info">/info</a>
     <!-- 서블릿 생성 + @WebServlet 어노테이션으로 자동 서블릿 등록 -->
    </p>
  </div>
</div>

<script>
	$("form button").on("click", function () {
		$("form")						
			.attr("action", "<%= contextPath %>/days02/info.htm")
			.attr("method", $("#tabs-2 :radio:checked").val()) // method 속성을 라디오 버튼의 체크된 값으로 가져가겠다.
			.submit();
	});
</script>
<script>
	$("#tabs-1 a").on("click", function () {
		// alert("XX");
		// event.preventDefault();
		// alert($(this).attr("href")); // == /jspPro/days02/ex03_ok.jsp
		
/* 		var href = $(this).attr("href");
		$(this).attr("href", href + "?n=" + $("#n").val());		 */
		
		// 위의 코딩 한줄코딩
		$(this).attr("href", function (i, val) { // val = 원래 속성 값
			return val + "?n=" + $("#n").val(); // 원래 속성 값에 + ? 뒤의 값을 만들어 넣는 작업
		});
	});
</script>

<pre>
	p80
	form을 get 방식으로 submit -> 한글 깨지지 X
	form을 post 방식으로 submit -> 한글 깨짐(p83)
	
	UTF-8 데이터 전송을 하면.. 
	WAS(톰캣8)는 따로 디코딩 charset을 설정하지 않으면 기본 get 방식은 UTF-8로 디코딩을 함
												 기본 POST 방식은 ISO-8859-1로 디코딩을 함
												 따라서 doPost 함수에서 request.setCharacterEncoding("UTF-8"); 설정
</pre>
</body>
</html>