<%@page import="mirim.hs.kr.UserDataBean"%>
<%@page import="mirim.hs.kr.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = (String)session.getAttribute("id");
UserDBBean userdb = UserDBBean.getInstance();
UserDataBean user = userdb.getMember(id);

user.setTicket(user.getPoint()/10);
user.setPoint(user.getPoint()%10);

userdb.updatechange(user);


%>
<script>
alert("포인트가 응모권으로 교환되었습니다.");
location.href="mypage.jsp";


</script>
</body>
</html>