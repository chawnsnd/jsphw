<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../error.jsp" %>
<%@ page import="model.*" %>
<%@ page import="dao.*" %>
<%@ page import="service.*" %>
<jsp:useBean id="authStudent" class="model.AuthStudent"/>
<jsp:useBean id="courseDao" class="dao.CourseDao"/>
<jsp:useBean id="studentService" class="service.StudentService"/>
<%
	authStudent = (AuthStudent)session.getAttribute("student");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강신청 페이지</title>
</head>
<body>
<div class="header">
	<%= authStudent.getName() %>(<%= authStudent.getStudentId() %>) 님 환영합니다.
	<form action="../auth/logout.jsp" style="display: inline;">
		<input type="submit" value="로그아웃">
	</form>
</div>
<h3>신청한 목록</h3>
<table>
	<tr>
		<th>강의번호</th>
		<th>강의명</th>
		<th>학과</th>
		<th>교수명</th>
		<th>분류</th>
		<th>요일</th>
		<th>시간</th>
		<th>신청취소</th>
	</tr>
<%
	List<Course> enrolCourses = studentService.getEnrolCourse(authStudent.getStudentId());
	for(Course course : enrolCourses){
%>
	<tr>
		<td><%=course.getCourseId()%></td>
		<td><%=course.getName()%></td>
		<td><%=course.getDepartment()%></td>
		<td><%=course.getProfessor()%></td>
		<td><%=course.getKind()%></td>
		<td><%=course.getDayOfWeek()%></td>
		<td><%=course.getTime()%></td>
		<td>
		<form action="./delete.jsp" method="post">
			<input type="submit" value="취소">
			<input type="hidden" name="course_id" value="<%=course.getCourseId()%>">
		</form>
		</td>
	</tr>

<%
	}
%>
</table>

<h3>강의목록</h3>
<h4>강의명 클릭 시 신청현황을 볼 수 있습니다.</h4>
<table>
	<tr>
		<th>강의번호</th>
		<th>강의명</th>
		<th>학과</th>
		<th>교수명</th>
		<th>분류</th>
		<th>요일</th>
		<th>시간</th>
		<th>수강신청</th>
	</tr>
<%
	courseDao.connect();
	List<Course> courses = courseDao.selectAll();
	for(Course course : courses){
%>
	<tr>
		<td><%=course.getCourseId()%></td>
		<td><a href="../course/detail.jsp?course_id=<%=course.getCourseId()%>"><%=course.getName()%></a></td>
		<td><%=course.getDepartment()%></td>
		<td><%=course.getProfessor()%></td>
		<td><%=course.getKind()%></td>
		<td><%=course.getDayOfWeek()%></td>
		<td><%=course.getTime()%></td>
		<td>
		<form action="./enroll.jsp" method="post">
			<input type="submit" value="신청">
			<input type="hidden" name="course_id" value="<%=course.getCourseId()%>">
		</form>
		</td>
	</tr>

<%
	}
	courseDao.disconnect();
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
</style>