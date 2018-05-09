package model;

public class AuthStudent {
	private int studentId;
	private String name;
	
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "AuthStudent [studentId=" + studentId + ", name=" + name + "]";
	}
}
