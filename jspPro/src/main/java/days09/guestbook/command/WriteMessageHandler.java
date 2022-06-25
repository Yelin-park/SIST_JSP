package days09.guestbook.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days09.guestbook.domain.Message;
import days09.guestbook.service.WriteMessageService;

public class WriteMessageHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String p_guest_name = request.getParameter("guest_name");
	      String p_password = request.getParameter("password");
	      String p_message = request.getParameter("message");
	      
	      Message message = new Message();
	      message.setGuest_name(p_guest_name);
	      message.setPassword(p_password);
	      message.setMessage(p_message);
	      
	      WriteMessageService messageService = WriteMessageService.getInstance();
	      int rowCount = messageService.write(message);
	      
	      // 포워딩 / 리다이렉트 X
	      String location = "list.do";
	      response.sendRedirect(location);
		
	      return null;
		
	} // process

}
