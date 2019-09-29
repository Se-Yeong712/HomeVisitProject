<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menu.jsp" flush="false"></jsp:include>
<div class="container" style="margin-left:35%; margin-top:2%; border-radius: 15px; width: 70%;">
<h2>회원가입</h2>
<form action="signupproc.jsp"method="post">
	<input type="text" name="id" placeholder="id" class="form-control" style="width: 45%; margin-bottom: 20px">
	<input type="password" name="pw" placeholder="password" class="form-control" style="width: 45%; margin-bottom: 20px">
	<input type="text" name="name" placeholder="name" class="form-control" style="width: 45%; margin-bottom: 20px">
	<input type="text" name="phone" placeholder="phone" class="form-control" style="width: 45%; margin-bottom: 20px">
	<select name="part"class="form-control"  style="width: 45%; margin-bottom: 20px">
		<option hidden="true">회원구분</option>
		<option value="1">방문자</option>
		<option value="2">집주인</option>
	</select>
	
	<input type="submit" value="회원가입" class="btn btn-outline-primary">

</form>

</div>
</body>
</html>