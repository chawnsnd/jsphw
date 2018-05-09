<%@page import="util.DuplicateException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../error.jsp" %>
<%@ page import="model.*" %>
<%@ page import="service.*" %>
<jsp:useBean id="authStudent" class="model.AuthStudent"/>
<jsp:useBean id="enrolmentService" class="service.EnrolmentService"/>
<%
	authStudent = (AuthStudent)session.getAttribute("student");
	int courseId = Integer.parseInt(request.getParameter("course_id"));
	try{
		enrolmentService.enroll(authStudent.getStudentId(), courseId);
		response.sendRedirect("./main.jsp");
	}catch(DuplicateException ex){
%>
<script>
	alert("이미 신청한 강의입니다.")
	history.go(-1)
</script>
<%
	}
%>