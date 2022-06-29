package days10.replyboard.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days10.replyboard.domain.ReplyBoardDTO;
import days10.replyboard.service.ViewService;

public class ViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// view.do?num=&page=&searchCondition=&searchWord=

		int num = Integer.parseInt( request.getParameter("num") );

		ViewService contentService = ViewService.getInstance();
		ReplyBoardDTO dto = contentService.selectOne(num);

		request.setAttribute("dto", dto);

		return "/days10/replyboard/view.jsp";
	}

}