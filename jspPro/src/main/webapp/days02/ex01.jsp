<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 15. - 오전 9:43:56</title>
</head>
<body>
<h3></h3>

<pre>
 %@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%
	- %@ page 지시자
	- contentType="text/html : JSP 페이지로 text 형식의 html 문서를 생성한다.
	- charset=UTF-8 : JSP 페이지로 문서를 생성할 때 캐릭터셋(charset)인코딩은 UTF-8로 생성하겠다.
		기본값 : ISO-8859-1(한글 깨짐) p59
		따라서 UTF-8 또는 EUC-KR 인코딩을 사용(한국에서만 사용할 거면 EUC-KR로!)
	- pageEncoding="UTF-8" 이 부분은 다음에 자세히 설명해주실 예정	
</pre>
<pre>
	[스크립트 요소 란?]
	- JSP 문서의 내용을 동적으로 생성하기 위해 사용되는 스크립트를 말함
	- 종류 3가지
		ㄱ. 표현식(Expression)
		ㄴ. 스크립트릿(Scriptlet)
		ㄷ. 선언문(Declaration)
		
	[ 스크립트릿에 선언한 것과 선언문에 선언한 것의 차이점? ]
	- Servlet을 한 뒤에 설명해주실 예정
</pre>

<% 
	// 스크립트릿 - 자바 코딩(변수, 메서드 선언 가능)
	String password = "java1234";
%>

<%!
	// 선언문 - 변수, 메서드 선언
	String id = "admin";
	
	// 메서드
	public int sum(int n){
		int result = 0;
		for(int i=1; i<=n; i++){
			result += i;
		}
		return result;
	}
%>

<!-- 표현식 -->
> sum(10) = <%= sum(10) %>


</body>
</html>