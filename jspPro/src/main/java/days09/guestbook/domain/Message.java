package days09.guestbook.domain;

public class Message {

	// 필드(테이블의 컬럼명과 동일하게 주기)
	private int message_id;
	private String guest_name;
	private String password;
	private String message;
		
	// get,set
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}
	public String getGuest_name() {
		return guest_name;
	}
	public void setGuest_name(String guest_name) {
		this.guest_name = guest_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	// 비밀번호 가지고 있는지 물어보는 함수 추가
	public boolean hasPassword() {
		return password != null && !password.isEmpty();
	} // hasPassword

	// 원래 비밀번호와 매개변수가 가지고 있는 비밀번호가 일치하는지 확인하는 함수 추가
	public boolean matchPassword(String password) {
	     return this.password != null && this.password.equals(password);
	 } // matchPassword
		

}
