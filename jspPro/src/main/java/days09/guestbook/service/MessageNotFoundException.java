package days09.guestbook.service;

// 사용자(개발자)가 정의하는 예외 클래스
// 메시지를 찾을 수 없을 경우에 예외를 발생시키겠다.
public class MessageNotFoundException extends ServiceException{
    
    public MessageNotFoundException(String message) {
       super(message);
    }
    
}
