<%@page import="util.DuplicateException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<jsp:useBean id="authStudent" class="model.AuthStudent"/>
<%
	authStudent = (AuthStudent)session.getAttribute("student");
	int courseId = Integer.parseInt(request.getParameter("course_id"));
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/dankook?serverTimezone=UTC";
	String id = "dankook";
	String password = "dankookpw";
	String sql1 = "select course_id from enrolment where student_id = ?";
	String sql2 = "insert into enrolment(student_id, course_id) values(?, ?)";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, password);
		pstmt = conn.prepareStatement(sql1);
		pstmt.setInt(1, authStudent.getStudentId());
		rs = pstmt.executeQuery();
		while(rs.next()){
			if(courseId == rs.getInt("course_id")){
				throw new DuplicateException();
			}
		}
		pstmt = conn.prepareStatement(sql2);
		pstmt.setInt(1, authStudent.getStudentId());
		pstmt.setInt(2, courseId);
		pstmt.executeUpdate();
		response.sendRedirect("./main.jsp");
	}catch(DuplicateException ex){
%>
<script>
	alert("이미 신청한 강의입니다.")
	history.go(-1)
</script>
<%
	}catch(Exception ex){
%>
<script>
	alert("신청할 수 없습니다. 잠시 후 다시 시도하세요.")
	history.go(-1)
</script>
<%
	}finally{
		rs.close();
		pstmt.close();
		conn.close();
	}
%>