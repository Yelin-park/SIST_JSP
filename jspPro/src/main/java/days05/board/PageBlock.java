package days05.board;

public class PageBlock {
	// 필드
	private int currentPage;
	private int numberPerPage = 10;
	private int numberOfpageBlock = 10;
	private int startOfPageBlock = 1; // 시작 번호
	private int endOfPageBlock; // 끝 번호
	private boolean prev, next; // 이전버튼, 다음버튼
	
	// getter, setter
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getNumberPerPage() {
		return numberPerPage;
	}
	public void setNumberPerPage(int numberPerPage) {
		this.numberPerPage = numberPerPage;
	}
	public int getNumberOfpageBlock() {
		return numberOfpageBlock;
	}
	public void setNumberOfpageBlock(int numberOfpageBlock) {
		this.numberOfpageBlock = numberOfpageBlock;
	}
	public int getStartOfPageBlock() {
		return startOfPageBlock;
	}
	public void setStartOfPageBlock(int startOfPageBlock) {
		this.startOfPageBlock = startOfPageBlock;
	}
	public int getEndOfPageBlock() {
		return endOfPageBlock;
	}
	public void setEndOfPageBlock(int endOfPageBlock) {
		this.endOfPageBlock = endOfPageBlock;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	
} // class
