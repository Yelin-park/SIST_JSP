package days04;

public class SalgradeDTO {
	private int grade;
	private int losal;
	private int hisal;
	private int cnt; // 추가
	
	public SalgradeDTO() {
		super();
	}
	
	public SalgradeDTO(int grade, int losal, int hisal, int cnt) {
		super();
		this.grade = grade;
		this.losal = losal;
		this.hisal = hisal;
		this.cnt = cnt;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getLosal() {
		return losal;
	}

	public void setLosal(int losal) {
		this.losal = losal;
	}

	public int getHisal() {
		return hisal;
	}

	public void setHisal(int hisal) {
		this.hisal = hisal;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return String.format("%d등급 (%d~%d) - %d명", grade, losal, hisal, cnt);
	}
	
} // class
