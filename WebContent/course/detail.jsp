<%@page import="java.util.List"%>
<%@page import="model.Student"%>
<%@page import="model.Course"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../error.jsp" %>
<%@page import="dao.*" %>
<%@page import="service.*" %>
<jsp:useBean id="courseDao" class="dao.CourseDao"/>
<jsp:useBean id="courseService" class="service.CourseService"/>
<%
	int courseId = Integer.parseInt(request.getParameter("course_id"));
	int count = 0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청 현황</title>
</head>
<body>
<%
		courseDao.connect();
		Course course = courseDao.selectById(courseId);
		courseDao.disconnect();
		%><h1><%= course.getName() %></h1><%
		%><div>강의번호 : <%= course.getCourseId() %></div><%
		%><div>강의시간 : <%= course.getDayOfWeek() %> <%= course.getTime() %></div><%
		
		List<Student> students = courseService.getEnrolStudent(courseId);
		for(Student student : students){
			count++;
		}
%>
<h3>신청명단(현재 <%= count %>명 신청)</h3>
<table>
	<tr>
		<th class="student_id">학번</th>
		<th>이름</th>
	</tr>
<%
		if(count == 0){
			%><td colspan=2 class="no_student">신청한 학생이 없습니다.</td><%
		}else{
			for(Student student : students){
%>
	<tr>
		<td><%= student.getStudentId() %></td>
		<td><%= student.getName() %></td>
	</tr>
<%
			}
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