package days09.guestbook.service;

// 사용자(개발자)가 정의한 예외
public class ServiceException extends RuntimeException{ // 실행과 관련된 예외처리를 발생시키는 예외
	   
	   private static final long serialVersionUID = -2408539214300123218L;

	   public ServiceException( String message ) {
	      super(message);
	   }
	   
	   public ServiceException( String message , Exception e ) {
	      super(message, e);
	   }
}