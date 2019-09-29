<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menu.jsp" flush="false"></jsp:include>
<div class="container">
<br>
<br>

<form action="homeregisterproc.jsp" method="post" style="margin-left: 10%; margin-right: 10%">


<h4>HOME 등록</h4>
<br>
<label>집의 주소를 작성해주세요.</label>
<input type="text" name="address" class="form-control" placeholder="OO시/군부터 작성해주세요.">
<br>

<label>집의 설명을 작성해주세요.</label>
<input type="text" name="content" class="form-control">
<br>

<label>집과 집주인과 관련된 퀴즈를 작성해주세요. </label>
<input type="text" name="quiz" class="form-control" placeholder="모르는 사람을 집에 초대하지 않도록 성실히 작성해주십시오.">
<br>

<label>위의 퀴즈에 대한 답을 작성해주세요.</label>
<input type="text" name="answer" class="form-control">
<br>

<input type="hidden" name="id" class="form-control" value="${user.id }">

<input type="submit" value="등록하기" class="btn btn-outline-primary" style="margin: 0 auto">


</form>

</div>
</body>
</html>