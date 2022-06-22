package days07;

public class Member {
	// 필드
	private String id;
	private String name;
	private int age;
	private String addr;
	private String tel;
	
	// 생성자
	public Member() {
		super();
	}
		
	public Member(String id, String name, int age, String addr, String tel) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.addr = addr;
		this.tel = tel;
	}
	
	// get,set
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}	
	
	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", age=" + age + ", addr=" + addr + ", tel=" + tel + "]";
	}
		
}
