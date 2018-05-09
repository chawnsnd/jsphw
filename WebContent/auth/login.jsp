<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.AuthException"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../error.jsp" %>
<%@ page import="model.*" %>
<%@ page import="dao.*" %>
<jsp:useBean id="studentDao" class="dao.StudentDao"/>

<jsp:useBean id="requestStudent" class="model.Student"/>
<jsp:setProperty name="requestStudent" property="*"/>

<jsp:useBean id="selectedStudent" class="model.Student"/>
<jsp:useBean id="authStudent" class="model.AuthStudent"/>

<%
	studentDao.connect();
	try{
		selectedStudent = studentDao.selectById(requestStudent.getStudentId());
		if(selectedStudent.getPassword().equals(requestStudent.getPassword())){
			authStudent.setName(selectedStudent.getName());
			authStudent.setStudentId(selectedStudent.getStudentId());
			session.setAttribute("student", authStudent);
			response.sendRedirect("../enrolment/main.jsp");
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
		studentDao.disconnect();
	}
%>