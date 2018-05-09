package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Enrolment;


public class EnrolmentDao {
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

	public List<Enrolment> selectEnrolmentByStudentId(int studentId) throws SQLException{
		List<Enrolment> enrolments= new ArrayList<>();
		pstmt = conn.prepareStatement("select * from enrolment where student_id = ?");
		pstmt.setInt(1, studentId);
		rs = pstmt.executeQuery();
		while(rs.next()){
			Enrolment enrolment = new Enrolment();
			enrolment.setEnrolmentId(rs.getInt("enrolment_id"));
			enrolment.setStudentId(rs.getInt("student_id"));
			enrolment.setCourseId(rs.getInt("course_id"));
			enrolments.add(enrolment);
		}
		return enrolments;
	}
	
	public List<Enrolment> selectEnrolmentByCourseId(int courseId) throws SQLException{
		List<Enrolment> enrolments= new ArrayList<>();
		pstmt = conn.prepareStatement("select * from enrolment where course_id = ?");
		pstmt.setInt(1, courseId);
		rs = pstmt.executeQuery();
		while(rs.next()){
			Enrolment enrolment = new Enrolment();
			enrolment.setEnrolmentId(rs.getInt("enrolment_id"));
			enrolment.setStudentId(rs.getInt("student_id"));
			enrolment.setCourseId(rs.getInt("course_id"));
			enrolments.add(enrolment);
		}
		return enrolments;
	}
	
	public void create(int studentId, int courseId) throws SQLException{
		pstmt = conn.prepareStatement("insert into enrolment(student_id, course_id) values(?, ?)");
		pstmt.setInt(1, studentId);
		pstmt.setInt(2, courseId);
		pstmt.executeUpdate();
	}
	
	public void delete(int studentId, int courseId) throws SQLException{
		pstmt = conn.prepareStatement("delete from enrolment where student_id = ? and course_id = ?");
		pstmt.setInt(1, studentId);
		pstmt.setInt(2, courseId);
		pstmt.executeUpdate();
	}

}
