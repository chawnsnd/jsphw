<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>단국대학교 수강신청</title>
</head>
<body>
<form method="post" action="./auth/login.jsp">
	<h1 style="text-align: center">단국대학교 수강 신청 페이지</h1>
	<h4 style="text-align: center">만든 사람 : 32121908 차준웅</h4>
	<div class="input">
		<h3>학번</h3> 
		<input type="text" name="studentId" placeholder="학번을 입력하세요">
		<h3>비밀번호</h3>
		<input type="text" name="password" placeholder="비밀번호를 입력하세요">
		<input type="submit" value="로그인">
		<div>게스트 학번: 00000000, 게스트 비밀번호: guestpw</div>
	</div>
</form>

	<div class="sample">

		<h3>샘플 학생</h3>
		홍길동- 학번: 11111111, 비밀번호: hgd<br>
		차준웅- 학번: 32121908, 비밀번호: cjw
	</div>
	
	<div class="notice">
	<div class="title">* 불법 수강신청에 따른 안내 *</div>
	불법 수강신청으로 인하여 타학생에게 피해를 주고 대학 전산망에 악영향을 주는 행위에 대하여 학교당국에서는 강력히 대응 할 것이며 학칙에 의거 엄중 처벌됨을 알려드립니다.<br>
	-타인의 비밀번호를 도용하여 수강신청하는 행위<br>
	-매크로 등 불법 프로그램을 이용하여 수강신청하는 행위<br>
	(현재 수강신청 프로그램 내 매크로 방지 기능 포함 운영 중)<br>
	-기타 불법행위<br>
	</div>
</form>
</body>
</html>

<style>
.notice{
	margin-top: 20px;
	display: inline-block;
	background-color: navy;
	color: white;
	padding: 20px;
	border-radius: 10px;
}
.title{
	color: white;
	font-weight: bold;
	margin-bottom: 10px;
	font-size: 20px;
}
body{
	width: 1000px;
	margin: auto;
	margin-top: 100px;
}
.input{
	display: inline-block;
	border: 5px solid blue;
	padding: 10px;
	float: left;
}
.sample{
	display: inline-bliock;
	float: right;
}
.notice{
	clear: both;
}
</style>
