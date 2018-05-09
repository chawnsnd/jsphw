package model;

import java.time.DayOfWeek;
import java.util.Arrays;
import java.util.List;

public class Course {
	private int courseId;
	private String name;
	private String department;
	private String professor;
	private String kind;
	private String dayOfWeek;
	private String time;
	private List<Student> student;
	
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getProfessor() {
		return professor;
	}
	public void setProfessor(String professor) {
		this.professor = professor;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getDayOfWeek() {
		return dayOfWeek;
	}
	public void setDayOfWeek(String dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public List<Student> getStudent() {
		return student;
	}
	public void setStudent(List<Student> student) {
		this.student = student;
	}
	@Override
	public String toString() {
		return "Course [courseId=" + courseId + ", name=" + name + ", department=" + department + ", professor="
				+ professor + ", kind=" + kind + ", dayOfWeek=" + dayOfWeek + ", time=" + time + ", student=" + student
				+ "]";
	}
	
}
