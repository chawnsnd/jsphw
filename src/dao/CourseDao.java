package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Course;
import model.Student;
import util.AuthException;

public class CourseDao {
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/dankook?serverTimezone=UTC";
	private String id = "dankook";
	private String password = "dankookpw";
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public void connect() {
		try {
			Class.forName(driver);

			conn = DriverManager.getConnection(url,id,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public List<Course> selectAll() throws SQLException{
		List<Course> courses= new ArrayList<>();
		pstmt = conn.prepareStatement("select * from course");
		rs = pstmt.executeQuery();
		while(rs.next()){
			Course course = new Course();
			course.setCourseId(rs.getInt("course_id"));
			course.setDayOfWeek(rs.getString("day_of_week"));
			course.setDepartment(rs.getString("department"));
			course.setKind(rs.getString("kind"));
			course.setName(rs.getString("name"));
			course.setProfessor(rs.getString("professor"));
			course.setTime(rs.getString("time"));
			courses.add(course);
		}
		return courses;
	}
	
	public Course selectById(int courseId) throws SQLException{
		Course course = null;
		pstmt = conn.prepareStatement("select * from course where course_id = ?");
		pstmt.setInt(1, courseId);
		rs = pstmt.executeQuery();
		if(rs.next()){
			course = new Course();
			course.setCourseId(rs.getInt("course_id"));
			course.setDayOfWeek(rs.getString("day_of_week"));
			course.setDepartment(rs.getString("department"));
			course.setKind(rs.getString("kind"));
			course.setName(rs.getString("name"));
			course.setProfessor(rs.getString("professor"));
			course.setTime(rs.getString("time"));
		}
		return course;
	}
}