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

<h2>로그인</h2>

<form action="loginproc.jsp"method="post">

	<input type="text" name="id" class="form-control" placeholder="아이디" style="width: 45%; margin-bottom: 20px">
	<input type="password" name="pw" class="form-control" placeholder="비밀번호"  style="width: 45%">
<br>
<input type="submit" value="로그인" class="btn btn-outline-primary">

</form>

</div>
</body>
</html>