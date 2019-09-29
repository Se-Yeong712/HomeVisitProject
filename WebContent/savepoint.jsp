<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="mirim.hs.kr.UserDataBean"%>
<%@page import="mirim.hs.kr.UserDBBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menu.jsp" flush="false"></jsp:include>
<%
String id = request.getParameter("id");
int point = Integer.parseInt(request.getParameter("point"));

UserDBBean userdb = UserDBBean.getInstance();
userdb.updatePoint(id, point);


%>
<script>
location.href='mypage.jsp';

</script>
</body>
</html>