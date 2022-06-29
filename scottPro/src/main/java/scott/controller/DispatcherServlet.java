package scott.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import scott.command.CommandHandler;


public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DispatcherServlet() {
        super();
    }

    // Key - 요청URL, Value - CommandHandler
    // value에 어떤 커맨드 핸들러를 주어도 부모인 CommandHandler로 자동 업캐스팅 되어짐
    private Map<String, CommandHandler> commandHandlerMap = new HashMap<String, CommandHandler>();
    
	@Override
	public void init() throws ServletException {
		// web.xml에 load-on-startup으로 인해 톰캣 서버(WAS)가 시작될 때 DispatcherServlet 생성
		// DispatcherServlet 서블릿이 객체로 생성될 때 '초기화 하는 목적'으로 사용되는 메서드
		// 객체가 생성될 때 생성자처럼 이 메서드가 호출되어짐
		
		// WEB-INF/commandHandler.properties 파일을 읽어와서 요청URL=CommandHandler를 읽어와서 commandHandlerMap에 추가 작업 필요(web.xml에 추가)
		String path = this.getInitParameter("path"); // 읽고자 하는 commandHandler.properties 파일을 읽어옴
		String realPath = this.getServletContext().getRealPath(path); // 실제 물리적인 경로 ***
		
		Properties prop = new Properties();
		try(FileReader fr = new FileReader(realPath)) {
			prop.load(fr);			
		} catch (Exception e) {
			throw new ServletException(); // 부모한테 떠넘김
		}
				
		// 모든 키 값을 가져옴(ex. /board/list.do)
		Iterator<Object> ir = prop.keySet().iterator(); 
		while (ir.hasNext()) {
			String url = (String) ir.next(); // 요청URL
			String commandHandlerFullName = prop.getProperty(url); // 키 값으로 프로퍼티를 가져옴
			
			// 객체 생성 ***
			try {
				Class<?> handlerClass = Class.forName(commandHandlerFullName); // 이 이름으로 클래스 정보를 가져와서
				CommandHandler commandHandler = (CommandHandler) handlerClass.newInstance(); // 인스턴스 == 생성된 객체
				
				this.commandHandlerMap.put(url, commandHandler); // 요청URL에 맞는 생성된 객체를 Map에 추가
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} // try
			
		} // while
		
	} // init

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청 URL 분석 - list.do write.do 와 같이 옴
		String requestURI = request.getRequestURI(); // /jspPro부터 출력됨
		// request.getRequestURL(); // http://localhost/jspPro~~ 출력
		
		// requestURI 변수에서 contextPath 제거 -> 왜? properties에 /board/list.do 이렇게 요청URL이 있기 때문에
		String contextPath = request.getContextPath();
		
		if(requestURI.indexOf(contextPath) == 0) { // contextPath가 앞에 붙어 있다면
			requestURI = requestURI.substring(contextPath.length()); // contextPath 문자열 길이부터 읽으면 잘려짐 -> /board/list.do = Key 값
		} // if	
			
		
		// 2. 요청 URL에 해당되는 로직을 처리하는 모델 객체(CommandHandler)를 찾아서 로직 처리를 하라고 명령
		// request.setAttribute() 또는 session에 저장
		// ex. list.do 라고 요청이 오면 commandHandler.properties에서 ListHandler를 찾아서 new ListHandler() 객체 생성 로직 처리
		// Map에 있는 로직을 처리하는 핸들러(객체)를 가져옴 *** => key 값을 통해서 가져옴
		// 인터페이스 upcasting 가능
		// 요청URL을 통해 해당 컨트롤 핸들러(모델 객체)가 로직을 처리함
		CommandHandler modelHandler = this.commandHandlerMap.get(requestURI); // requestURI == /board/list.do
		
		// 로직을 처리한 결과를 받는 응답 페이지를 가져옴
		String viewPage = null;
		try {
			// 요청URL을 통해 해당 컨트롤 핸들러(모델 객체)가 로직을 처리함
			// 똑같은 request와 response 객체임
			viewPage = modelHandler.process(request, response); // ex. viewPage = list.jsp 받아짐
		} catch (Exception e) {
			e.printStackTrace();
		} // try
		
		
		// 3. 응답 페이지(view)를 찾아서 리다이렉트 또는 포워딩을 시킴 - 여기서는 포워딩
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		} // if
		// 비밀번호 잘못되었다 경고 후 delete.jsp를 다시 보여줌
		// request.setAttribute("error", "비밀번호가 틀립니다."); // 이 경고문구를 담아서
		// doGet(request, response); // doGet() 함수를 호출하면 delete.jsp 포워딩 되어지고 
		
	} // doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	} // doPost

}
