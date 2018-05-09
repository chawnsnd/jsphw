package model;

import java.time.DayOfWeek;
import java.util.Arrays;

public class Course {
	private int courseId;
	private String name;
	private String department;
	private String professor;
	private String kind;
	private DayOfWeek dayOfWeek;
	private int[] time;
	
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
	public DayOfWeek getDayOfWeek() {
		return dayOfWeek;
	}
	public void setDayOfWeek(DayOfWeek dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}
	public int[] getTime() {
		return time;
	}
	public void setTime(int[] time) {
		this.time = time;
	}
	
	@Override
	public String toString() {
		return "Course [courseId=" + courseId + ", name=" + name + ", department=" + department + ", professor="
				+ professor + ", kind=" + kind + ", dayOfWeek=" + dayOfWeek + ", time=" + Arrays.toString(time) + "]";
	}
	
}
