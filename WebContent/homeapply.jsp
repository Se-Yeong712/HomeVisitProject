<%@page import="mirim.hs.kr.UserDBBean"%>
<%@page import="mirim.hs.kr.UserDataBean"%>
<%@page import="mirim.hs.kr.HomeDBBean"%>
<%@page import="mirim.hs.kr.HomeDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

request.setCharacterEncoding("utf-8");
int homecode = Integer.parseInt(request.getParameter("homecode"));

HomeDBBean homedb = HomeDBBean.getInstance();
HomeDataBean home = homedb.getHome(homecode);

String id = (String)session.getAttribute("id");
UserDBBean userdb = UserDBBean.getInstance();
UserDataBean user = userdb.getMember(id);

request.setAttribute("home", home);
request.setAttribute("ticket", user.getTicket());

%>
<script>

var jbResult = prompt( '${home.quiz}', '' );
if(jbResult=='${home.answer}'){
	alert("정답입니다.");
}
else{
	alert("정답이 아닙니다.");
	location.href="homelist.jsp";
}

</script>
<jsp:include page="menu.jsp" flush="false"></jsp:include>
<div class="container">
<c:if test="${ticket!=0 }">
	<form action="homeapplyproc.jsp" method="post">
		<input type="hidden" name="homecode" value="${home.homecode }">
		<input type="hidden" name="id" value="${user.id }">
		<input type="hidden" name="admin" value="${home.id }">
		<br>
		<br>
		<div class="form-inline">
		<select name="applycount" class="form-control" style="width: 70%">
		<c:forEach var="i" begin="1" end="${ticket}">
			<option value="${i }">${i }</option>
		</c:forEach>
		</select>
		&nbsp;&nbsp;
		<input type="submit" class="btn btn-outline-primary" value="응모하기">
		</div>
</form>
</c:if>

<c:if test="${ticket==0 }">

	<br><br>
	<p style="font-size: 20px;">사용할 수 있는 응모권이 없습니다.</p>
	<br>
	<button class="btn btn-primary" style="margin: 0 auto;">포인트 모으기</button>

</c:if>
</div>
</body>
</html>
