package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Student;
import util.AuthException;

public class StudentDao {
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
	
	public Student selectById(int studentId) throws SQLException{
		Student student = null;
		pstmt = conn.prepareStatement("select * from student where student_id = ?");
		pstmt.setInt(1, studentId);
		rs = pstmt.executeQuery();
		if(rs.next()){
			student = new Student();
			student.setName(rs.getString("name"));
			student.setStudentId(rs.getInt("student_id"));
			student.setPassword(rs.getString("password"));
			return student;
		}else {
			throw new AuthException();
		}
	}
}
