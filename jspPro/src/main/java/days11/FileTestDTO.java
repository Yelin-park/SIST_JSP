package days11;

public class FileTestDTO {

	// fileds
	private int num;                  // 번호
	private String subject;           // 제목
	private String filesystemname;    // 시스템파일명
	private String originalfilename;  // 오리지널파일명
	private long filelength;          // 파일크기
	
	// constructors
	public FileTestDTO() {}
	public FileTestDTO(int num, String subject, String filesystemname, String originalfilename, int filelength) {
		this.num = num;
		this.subject = subject;
		this.filesystemname = filesystemname;
		this.originalfilename = originalfilename;
		this.filelength = filelength;
	}

	// getter, setter
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getFilesystemname() {
		return filesystemname;
	}
	public void setFilesystemname(String filesystemname) {
		this.filesystemname = filesystemname;
	}
	public String getOriginalfilename() {
		return originalfilename;
	}
	public void setOriginalfilename(String originalfilename) {
		this.originalfilename = originalfilename;
	}
	public long getFilelength() {
		return filelength;
	}
	public void setFilelength(long filelength) {
		this.filelength = filelength;
	} 
}
