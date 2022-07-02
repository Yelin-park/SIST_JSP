<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>2022. 7. 1. - 오후 2:47:17</title>
</head>
<body>
<h3>days15/ex01.jsp</h3>

<div id="googleMap" style="width: 100%;height: 400px;"></div>

<script>
   function myMap(){ 
      var mapOptions = {  
            center:new google.maps.LatLng(51.508742, -0.120850) 
               , zoom:5
      };
       
      var map = new google.maps.Map( 
             document.getElementById("googleMap") 
            , mapOptions );
   }
</script>

<!-- <script src="https://maps.googleapis.com/maps/api/js?key=키발급&callback=myMap"></script> -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKbtmdbLv3PyX5F-zR9TIOZSqVuy0Nj-8&callback=myMap"></script>
</body>
</html>