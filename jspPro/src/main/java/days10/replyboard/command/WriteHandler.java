package days10.replyboard.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days10.replyboard.domain.ReplyBoardDTO;
import days10.replyboard.service.WriteService;

public class WriteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if( request.getMethod().equals("GET") ) {
			return  "/days10/replyboard/write.jsp";
		}else if(request.getMethod().equals("POST") ) {  // POST 방식
			String writer = request.getParameter("writer");
			String email = request.getParameter("email");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String pass = request.getParameter("pass");

			ReplyBoardDTO dto = new ReplyBoardDTO();
			dto.setWriter(writer);
			dto.setEmail(email);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPass(pass); 
			// PC ip 주소
			dto.setIp(   request.getRemoteAddr()  );

			// 답글일 경우에는 write.do?num=12&ref=12&step=0&depth=1
			String parentNum = request.getParameter("num");
			if ( parentNum == null ) { // 새글
				// ref, step, depth
				// 새글은 ref 값이 없음 시퀀스.nextval
				dto.setStep(0);
				dto.setDepth(0);
			}else {   // 답글
				// dto.setRef(부모글의 ref)
				// ref = 부모의 ref
				// step = 부모의 step + 1
				int parentRef = Integer.parseInt( request.getParameter("ref") );
				int parentStep = Integer.parseInt( request.getParameter("step") );
				int parentDepth = Integer.parseInt( request.getParameter("depth") );

				dto.setRef(parentRef);
				dto.setStep(parentStep + 1);
				dto.setDepth(parentDepth + 1); 
			}

			WriteService writeService = WriteService.getInstance();
			int rowCount = writeService.write(dto);

			if (rowCount == 1) {
				String location = "list.do";
				response.sendRedirect(location);  // 포워딩 X,  리다이렉트 O
			}

		}else {
			response.sendError( HttpServletResponse.SC_METHOD_NOT_ALLOWED );
		}
		return null;
	}

}