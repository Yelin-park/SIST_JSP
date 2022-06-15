<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	// pet=dog&pet=tiger : 값이 여러개 넘어온다
	String[] pets = request.getParameterValues("pet");
%>
<%
	// http://localhost/jspPro/days02/ex07_ok.jsp
	// ?[name]=%ED%99%8D%EA%B8%B8%EB%8F%99&[gender]=m&[pet]=dog&[pet]=tiger
	// [] -> 파라미터명만 가져오겠다 하면..
	Enumeration<String> en = request.getParameterNames();
	while(en.hasMoreElements()){
		String pname = en.nextElement();
%>
	<li><%= pname %></li>
<%
	} // while
%>

<%
	// 파라미터명과 값을 한 쌍으로 가져온다.
		// pname pvalue
	Map<String, String[]> map = request.getParameterMap();
	Set<Entry<String, String[]>> set = map.entrySet();
	Iterator<Entry<String, String[]>> ir = set.iterator();
	while(ir.hasNext()){
		Entry<String, String[]> entry = ir.next();
		String k = entry.getKey();
		String[] v = entry.getValue();
%>
	<li type="circle"><%= String.format("key=%s, value=%s<br>", k, Arrays.toString(v)) %></li>
<%
	} // while
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 15. - 오후 4:08:44</title>
</head>
<body>
<h3>ex07_ok.jsp</h3>
> 이름 : <%= name %><br>
> 이름 : ${ param.name }<br>
> 성별 : <%= gender %><br>
 성별 : 
<%--
	<input type="radio" name="gender" value="m" <%= gender.equals("m") ? "checked" : "" %>>남자
 	<input type="radio" name="gender" value="f" <%= gender.equals("f") ? "checked" : "" %>>여자<br> --%>
 	
	<input type="radio" name="gender" value="m">남자
	<input type="radio" name="gender" value="f">여자<br> 	

좋아하는 동물 : 
	<%= Arrays.toString(pets) %>
	<br>
	<input type="checkbox" name="pet" value="dog">개
 	<input type="checkbox" name="pet" value="cat">고양이
 	<input type="checkbox" name="pet" value="tiger">호랑이
 	<br>
 	
<script>
	// Arrays.toString(pets) == [dog, pig] (문자열)
	$(":checkbox[name=pet]").each(function (i, element) {
		// console.log(element.value); // 모든 속성 값의 value를 찍음
		
		// 배열에 있는 값이 모든 속성 값과 비교를 해서 있다면 checked 속성을 true를 주어라(-1이 반환되면 값이 없다는 것)
		if( "<%= Arrays.toString(pets) %>".indexOf(element.value) != -1 ){
			element.checked = "true";
		} // if
	});
</script>
	
<script>
	// 방법1
<%-- 	$(":radio[name=gender]").each(function (i, element) {
		if(element.value == "<%= gender %>") {
			element.checked = true;
			// $(element).attr("checked", true);
		} // if
	}); --%>

	// 아래 코딩 안되서 강사님이 확인하실 예정
	// 모든 라디오 버튼을 가져와서 선택한 gender 값의 속성을 checked 주겠다.
	 $(":radio[value='<%= gender%>']").prop("checked" , true);
</script>
</body>
</html>