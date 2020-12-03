package exam01.dto;

import java.sql.Timestamp;

public class Member {
	private int custNo;
	private String custName;
	private String phone;
	private String address;
	private Timestamp joinDate;
	private String grade;
	private String city;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(int custNo, String custName, String phone, String address, Timestamp joinDate, String grade,
			String city) {
		super();
		this.custNo = custNo;
		this.custName = custName;
		this.phone = phone;
		this.address = address;
		this.joinDate = joinDate;
		this.grade = grade;
		this.city = city;
	}
	
	
	public Member(int custNo, String custName, String phone, String address, String grade, String city) {
		super();
		this.custNo = custNo;
		this.custName = custName;
		this.phone = phone;
		this.address = address;
		this.grade = grade;
		this.city = city;
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
	public final String getPhone() {
		return phone;
	}
	public final void setPhone(String phone) {
		this.phone = phone;
	}
	public final String getAddress() {
		return address;
	}
	public final void setAddress(String address) {
		this.address = address;
	}
	public final Timestamp getJoinDate() {
		return joinDate;
	}
	public final void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}
	public final String getGrade() {
		return grade;
	}
	public final void setGrade(String grade) {
		this.grade = grade;
	}
	public final String getCity() {
		return city;
	}
	public final void setCity(String city) {
		this.city = city;
	}
	@Override
	public String toString() {
		return String.format("Member [custNo=%s, custName=%s, phone=%s, address=%s, joinDate=%s, grade=%s, city=%s]",
				custNo, custName, phone, address, joinDate, grade, city);
	}
	
	
	
}
