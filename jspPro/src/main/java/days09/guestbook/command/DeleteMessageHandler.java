package days09.guestbook.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days09.guestbook.service.DeleteMessageService;

//deleteMessage.do?messageId=33&password=1234   GET방식
public class DeleteMessageHandler implements CommandHandler{

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
      System.out.println("> deleteMessage.do 요청 : DeleteMessageHandler.process() 호출됨...");
      int messageId = Integer.parseInt(request.getParameter("messageId") ); 
      String password = request.getParameter("password"); 
      
      //System.out.println( messageId +  " / " + password); 
      
      // 서비스클래스 -> DAO -> insert~
      DeleteMessageService messageService =   DeleteMessageService.getInstance();
      //
      messageService.delete(messageId, password); 
      
      response.sendRedirect("list.do?delete=success");
      // response.sendRedirect("/jspPro/days08/guestbook/list.do");

      // return "list.do";  // M[V]C    jsp페이지 경로
      return null;
   }

}