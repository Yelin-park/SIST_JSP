package days04;

import java.sql.Date;

public class DeptEmpSalgradeDTO {

	private int deptno;
	private String dname;
	private int empno;
	private String ename;
	private Date hiredate;
	private String job;
	private double sal;
	private double comm;
	private double pay;
	private int grade;
	
	public DeptEmpSalgradeDTO() {
		super();
	}
	public DeptEmpSalgradeDTO(int deptno, String dname, int empno, String ename, Date hiredate, String job, double sal,
			double comm, double pay, int grade) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.empno = empno;
		this.ename = ename;
		this.hiredate = hiredate;
		this.job = job;
		this.sal = sal;
		this.comm = comm;
		this.pay = pay;
		this.grade = grade;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public double getSal() {
		return sal;
	}
	public void setSal(double sal) {
		this.sal = sal;
	}
	public double getComm() {
		return comm;
	}
	public void setComm(double comm) {
		this.comm = comm;
	}
	public double getPay() {
		return pay;
	}
	public void setPay(double pay) {
		this.pay = pay;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		
		return String.format("%d\t%s\t%d\t%s\t%s\t%s\t%.2f\t%.2f\t%.2f\t%d",
				deptno, dname, empno, ename, hiredate, job, sal, comm, pay, grade);
//		return "DeptEmpSalgradeDTO [deptno=" + deptno + ", dname=" + dname + ", empno=" + empno + ", ename=" + ename
//				+ ", hiredate=" + hiredate + ", job=" + job + ", sal=" + sal + ", comm=" + comm + ", pay=" + pay
//				+ ", grade=" + grade + "]";
	}
	
}
