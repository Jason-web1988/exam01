package exam01.dto;

public class Money {
	private int custNo;
	private String custName;
	private String grade;
	private int total;
	public Money() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Money(int custNo, String custName, String grade, int total) {
		super();
		this.custNo = custNo;
		this.custName = custName;
		this.grade = grade;
		this.total = total;
	}
	public final int getCustNo() {
		return custNo;
	}
	public final void setCustNo(int custNo) {
		this.custNo = custNo;
	}
	public final String getCustName() {
		return custName;
	}
	public final void setCustName(String custName) {
		this.custName = custName;
	}
	public final String getGrade() {
		return grade;
	}
	public final void setGrade(String grade) {
		this.grade = grade;
	}
	public final int getTotal() {
		return total;
	}
	public final void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return String.format("Money [custNo=%s, custName=%s, grade=%s, total=%s]", custNo, custName, grade, total);
	}
	
	
}
