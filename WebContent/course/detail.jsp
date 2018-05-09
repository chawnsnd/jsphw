<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int courseId = Integer.parseInt(request.getParameter("course_id"));
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/dankook?serverTimezone=UTC";
	String id = "dankook";
	String password = "dankookpw";
	String sql1 = "select * from course where course_id = ?";
	String sql2 = "select count(student_id) from student where student_id in (select student_id from enrolment where course_id = ?)";
	String sql3 = "select * from student where student_id in (select student_id from enrolment where course_id = ?)";
	int count = 0;
	Connection conn = null;
	PreparedStatement pstmt1 = null;
	ResultSet rs1 = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs2 = null;
	PreparedStatement pstmt3 = null;
	ResultSet rs3 = null;
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, password);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청 현황</title>
</head>
<body>
<%
		pstmt1 = conn.prepareStatement(sql1);
		pstmt1.setInt(1, courseId);
		rs1 = pstmt1.executeQuery();
		if(rs1.next()){
			%><h1><%= rs1.getString("name") %></h1><%
			%><div>강의번호 : <%= rs1.getInt("course_id") %></div><%
			%><div>강의시간 : <%= rs1.getString("day_of_week") %> <%= rs1.getString("time") %></div><%
		}
		pstmt2 = conn.prepareStatement(sql2);
		pstmt2.setInt(1, courseId);
		rs2 = pstmt2.executeQuery();
		if(rs2.next()){
			count = rs2.getInt(1);
%><h3>신청명단(현재 <%= count %>명 신청)</h3><%
}%>
<table>
	<tr>
		<th class="student_id">학번</th>
		<th>이름</th>
	</tr>
<%
		if(count == 0){
			%><td colspan=2 class="no_student">신청한 학생이 없습니다.</td><%
		}else{
			pstmt3 = conn.prepareStatement(sql3);
			pstmt3.setInt(1, courseId);
			rs3 = pstmt3.executeQuery();
			while(rs3.next()){
%>
	<tr>
		<td><%= rs3.getInt("student_id") %></td>
		<td><%= rs3.getString("name") %></td>
	</tr>
<%
			}
		}
	}catch(Exception ex){
		
	}finally{
		
	}
%>
</table>
</body>
</html>
<style>
.header{
	text-align: right;
}
body{
	width: 1000px;
	margin: auto;
}
table{
	width: 100%;
}
td{
	text-align: center;
}
th{
	background-color: grey;
	color: white;
}
tr:hover{
	background-color: #eaeaea;
}
.student_id{
	width: 300px;
}
.no_student{
	padding: 20px;
	background-color: #eaeaea;
	font-weight: bold;
}
</style>