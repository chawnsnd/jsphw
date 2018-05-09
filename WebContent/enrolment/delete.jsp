<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../error.jsp" %>
<%@ page import="model.*" %>
<%@ page import="dao.*" %>
<jsp:useBean id="authStudent" class="model.AuthStudent"/>
<jsp:useBean id="enrolmentDao" class="dao.EnrolmentDao"/>
<%
	authStudent = (AuthStudent)session.getAttribute("student");
	int courseId = Integer.parseInt(request.getParameter("course_id"));

	enrolmentDao.connect();
	enrolmentDao.delete(authStudent.getStudentId(), courseId);
	enrolmentDao.disconnect();
	
	response.sendRedirect("./main.jsp");

%>