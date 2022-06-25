package days09.guestbook.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days09.guestbook.service.GetMessageListService;
import days09.guestbook.service.MessageListView;

public class GetMessageListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("> /days09/guestbook/list.do : GetMessageListHandler.process() 호출됨...");

		String  pCurrentPage = request.getParameter("page");  // 현재페이지 번호  page 파라미터명
		int currentPage = 1;
		if( pCurrentPage != null ) {
			currentPage = Integer.parseInt( pCurrentPage );
		}

		GetMessageListService messageListService = GetMessageListService.getInstance();
		MessageListView viewData  = messageListService.getMessageList(currentPage);

		request.setAttribute("viewData", viewData);

		return "/days09/guestbook/list.jsp";  // 포워딩

	}

}