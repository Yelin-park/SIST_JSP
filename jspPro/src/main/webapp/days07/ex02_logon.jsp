<%@page import="com.util.Cookies"%>
<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- <h3>ex02_logon.jsp</h3> -->
<%
	// 원래는 DB 연동을 해야하는데 DB 대신 아래 HashMap 사용
	HashMap<String, String> member = new HashMap<>();
    member.put("admin","1234"); // 관리자
    member.put("hong","1234"); // 일반회원
    member.put("park","1234"); // 일반회원
    
    // ex02_default.jsp에서 넘어오는 파라미터 값
    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");
    
    if( id.equals("admin") && passwd.equals("1234") ) {
        Cookie c =  Cookies.createCookie("auth", id, "/", -1); // 관리자
        response.addCookie(c);        
        response.sendRedirect("ex02_default.jsp");
    }else if( id.equals("hong") && passwd.equals("1234") ) {
        Cookie c =  Cookies.createCookie("auth", id, "/", -1);
        response.addCookie(c);        
        response.sendRedirect("ex02_default.jsp");
    }else if( id.equals("park") && passwd.equals("1234") ) {
        Cookie c =  Cookies.createCookie("auth", id , "/", -1);
        response.addCookie(c);        
        response.sendRedirect("ex02_default.jsp");
    }else{
       response.sendRedirect("ex02_default.jsp?error");  // 로그인 실패했을 때 ? error 를 붙여서 보내겠다.
    }
%>
