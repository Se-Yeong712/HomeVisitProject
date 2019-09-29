<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	

%>

<jsp:include page="menu.jsp" flush="false"></jsp:include>
<div class="container">
<br>
<br>
<h4>내 정보</h4>
<table class="table">
<tr> 
	<th>이름</th>
	<th>point</th>
	<th>응모권</th>
	<th>사용된 응모권</th>
</tr>


</table>
<br>
<br>
 <h4>응모 현황</h4>
<table class="table">
	<tr>
		<th>집</th>
		<th>집주인</th>
		<th>응모횟수</th>
		<th>당첨확인</th>
	</tr>


</table>
</div>
</body>
</html>