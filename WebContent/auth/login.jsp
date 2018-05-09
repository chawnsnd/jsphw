<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.AuthException"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>

<jsp:useBean id="student" class="model.Student"/>
<jsp:setProperty name="student" property="*"/>

<jsp:useBean id="authStudent" class="model.AuthStudent"/>

<%
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/dankook?serverTimezone=UTC";
	String id = "dankook";
	String password = "dankookpw";
	String sql = "select * from student where student_id = ?";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, password);
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, student.getStudentId());
		rs = pstmt.executeQuery();
		if(rs.next()){
			if(student.getPassword().equals(rs.getString("password"))){
				authStudent.setName(rs.getString("name"));
				authStudent.setStudentId(rs.getInt("student_id"));
				session.setAttribute("student", authStudent);
				response.sendRedirect("../enrolment/main.jsp");
			}else{
				throw new AuthException();
			}
		}else{
			throw new AuthException();
		}
	}catch(AuthException ex){
		
%>
<script>
alert("학번과 비밀번호를 다시 확인해 주세요.")
history.go(-1)
</script>
<%
	}catch(Exception ex){
		System.out.println(ex);
%>
<script>
alert("로그인에 실패했습니다. 잠시 후 다시 시도해주세요.")
history.go(-1)
</script>
<%
	}finally{
		rs.close();
		pstmt.close();
		conn.close();
	}
%>