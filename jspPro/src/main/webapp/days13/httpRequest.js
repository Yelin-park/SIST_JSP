/**
 * httpReqeust.js
 */

// XMLHttpRequest 객체를 담을 변수 선언
var httpRequest = null;

// 브라우저 종류 또는 버전에 따라 객체 생성하는 함수 선언
function getXMLHttpRequest(){
   if(window.ActiveXObject){ // IE 6 버전 기준으로 이전 이후
      try {
         return new ActiveXObject("Msxml2.XMLHTTP");
      } catch (e) {
         try {
            return new ActivXObject("Microsoft.XMLHTTP");
         } catch (e) {
            return null;
         }

      }
   }else if(window.XMLHttpRequest){
      return new XMLHttpRequest();       
   }else {
      return null;
   }
}

// 요청 방식에 따라 open() 메서드 설정과 send() 값 할당하는 함수
//  요청할 url, 파라미터, 콜백함수등록, get/post
function sendRequest(url,params,callback,method){ 
   // 1. xhr
   httpRequest = getXMLHttpRequest(); // 생성한 XMLHttpRequest 객체를 변수에 담고 

   // 2. 상태가 바뀌었을 때 호출하는 함수 등록(콜백함수)
   httpRequest.onreadystatechange = callback; // 상태를 가지고 콜백함수(상태가 바뀌었을 때 호출하는 함수) 

 
   var httpMethod = method ? method : 'GET'; // 파라미터로 넘어온 method가 false일 때 GET 설정(안넘어왔을때) 
   if(httpMethod!='GET' && httpMethod!='POST') httpMethod='GET'; // 파라미터로 넘어온 method가 GET과 POST가 아니라면 GET으로 설정
   // [GET 방식일 때]
   var httpParams = (params==null||params=="") ? null : params; // 파라미터 null이거나 빈문자열이면 null로 설정
   
   var httpUrl = url; // url 파라미터를 변수에 httpUrl 담고
   
   // GET 방식일 경우 + 파라미터가 null이 아닌 경우 쿼리스트링으로 url 만들겠다.
   if(httpMethod=='GET' && httpParams != null){
      httpUrl= httpUrl +"?"+httpParams;
   }     
   
   // XMLHttpRequest.open() 메서드 설정을 httpMethod, httpUrl, true로 설정하겠다.(요청에 필요한 설정)
   httpRequest.open(httpMethod,httpUrl,true); // true 비동기적..

   // [XMLHTTP를 사용해서 통신할 때 규약] 
   // httpRequest.setRequestHeader('Content-Type','application/x-www-form-unlencoded');    

   // [POST 방식일 때]
   // 콜백함수 안에서 readyState 속성(4)과 status 속성(200)으로 응답한 결과가 String인지 XML인지 판단하여 웹페이지 추가,수정,삭제 작업
   httpParams = (httpMethod=='POST' ? httpParams : null ); // POST 방식이면 파라미터 null로 설정하고
   // 해당 파라미터를 send() 메서드에 넣어져서 보내짐
   httpRequest.send(httpParams); // 요청처리... 
}