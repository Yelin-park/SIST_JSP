<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 6. 14. - 오후 11:14:44</title>
</head>
<body>

<%

	int num = request.getParameter("n") == null ? 5 : Integer.parseInt(request.getParameter("n"));
	int sum = 0;
	String txt = "";
	for(int i=1; i <= num; i++){
		sum += i;
		txt += i + (i == num ? "" : "+");
	} // for
	txt += "=" + sum;
%>

<form>
	정수 입력 : <input type="text" name="n" value="5"><br>
	<p id="demo"><% out.append(txt); %></p>
</form>

<script>
	$(":text").keyup(function (event) {
		if(event.which == 13){
			$("form[0]").submit();
		}
	});
</script>
</body>
</html>