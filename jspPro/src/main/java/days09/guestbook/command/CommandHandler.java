package days09.guestbook.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 로직을 처리하는 핸들러의 공통되는 것들
public interface CommandHandler {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
