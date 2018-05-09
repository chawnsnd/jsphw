package model;

public class Enrolment {
	private int enrolmentId;
	private int studentId;
	private int courseId;
	public int getEnrolmentId() {
		return enrolmentId;
	}
	public void setEnrolmentId(int enrolmentId) {
		this.enrolmentId = enrolmentId;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	@Override
	public String toString() {
		return "Enrolment [enrolmentId=" + enrolmentId + ", studentId=" + studentId + ", courseId=" + courseId + "]";
	}

}
