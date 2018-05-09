<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

에러가 발생했어요ㅠㅠ<br> <br> 
에러 타입 : <%= exception.getClass().getName() %><br> 
에러 메세지 : <%= exception.getMessage() %><br> <br>
관리자에게 연락주시면 보다 신속하게 해결하겠습니다.

</body>
</html>