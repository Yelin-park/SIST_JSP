package days10.replyboard.domain;

import java.util.Date;

public class ReplyBoardDTO {

	// fields
	private int num;         // 글번호
	private String writer;   // 작성자
	private String email;    // 이메일
	private String subject;  // 제목
	private String pass;     // 비밀번호
	private int readcount;   // 조회수
	private Date regdate;    // 등록일
	private String content;  // 내용
	private String ip;       // IP주소
	private int ref;         // *** 그룹
	private int step;        // *** 그룹내 순번
	private int depth;       // *** 깊이

	// 새로운 게시글 일경우  new 이미지 붙이기 위한 필드 추가
	private boolean newImg;  // new 마크

	// getter, setter
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public boolean isNewImg() {
		return newImg;
	}

	public void setNewImg(boolean newImg) {
		this.newImg = newImg;
	}

}