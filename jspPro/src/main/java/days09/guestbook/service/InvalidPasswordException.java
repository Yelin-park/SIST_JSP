package days09.guestbook.service;

// 사용자(개발자)가 정의하는 예외 클래스
// 비밀번호가 틀릴 경우 예외를 발생 시키기 위해서 선언
public class InvalidPasswordException extends ServiceException{
    
    public InvalidPasswordException(String message) {
       super(message);
    }
    
}
