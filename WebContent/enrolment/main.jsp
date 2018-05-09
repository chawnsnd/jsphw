<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../error.jsp" %>
<%@ page import="model.*" %>
<jsp:useBean id="authStudent" class="model.AuthStudent"/>
<%
	authStudent = (AuthStudent)session.getAttribute("student");
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/dankook?serverTimezone=UTC";
	String id = "dankook";
	String password = "dankookpw";
	String sql1 = "select * from course where course_id in (select course_id from enrolment where student_id = ?)";
	String sql2 = "select * from course";
	Connection conn = null;
	PreparedStatement pstmt1 = null;
	ResultSet rs1 = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs2 = null;
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, password);
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
	pstmt1 = conn.prepareStatement(sql1);
	pstmt1.setInt(1, authStudent.getStudentId());
	rs1 = pstmt1.executeQuery();
	while(rs1.next()){
%>
	<tr>
		<td><%=rs1.getString("course_id")%></td>
		<td><%=rs1.getString("name")%></td>
		<td><%=rs1.getString("department")%></td>
		<td><%=rs1.getString("professor")%></td>
		<td><%=rs1.getString("kind")%></td>
		<td><%=rs1.getString("day_of_week")%></td>
		<td><%=rs1.getString("time")%></td>
		<td>
		<form action="./delete.jsp" method="post">
			<input type="submit" value="취소">
			<input type="hidden" name="course_id" value="<%=rs1.getString("course_id")%>">
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
	pstmt2 = conn.prepareStatement(sql2);
	rs2 = pstmt2.executeQuery();
	while(rs2.next()){
%>
	<tr>
		<td><%=rs2.getString("course_id")%></td>
		<td><a href="../course/detail.jsp?course_id=<%= rs2.getString("course_id") %>"><%=rs2.getString("name")%></a></td>
		<td><%=rs2.getString("department")%></td>
		<td><%=rs2.getString("professor")%></td>
		<td><%=rs2.getString("kind")%></td>
		<td><%=rs2.getString("day_of_week")%></td>
		<td><%=rs2.getString("time")%></td>
		<td>
		<form action="./enroll.jsp" method="post">
			<input type="submit" value="신청">
			<input type="hidden" name="course_id" value="<%=rs2.getString("course_id")%>">
		</form>
		</td>
	</tr>

<%
	}
%>
</table>
</body>
</html>
<%
	}catch(Exception ex){

	}finally{
		rs1.close();
		pstmt1.close();
		rs2.close();
		pstmt2.close();
		conn.close();
	}
%>


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