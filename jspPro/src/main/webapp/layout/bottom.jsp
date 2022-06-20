<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String msg = request.getParameter("msg");
%>
<div style="border: solid 1px gray; height:100px; text-align: center">
 <h3>야리니 웹 사이트 BOTTOM 소개 - <%= msg %></h3>
</div>