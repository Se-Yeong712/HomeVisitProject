<%@page import="mirim.hs.kr.HomeDBBean"%>
<%@page import="mirim.hs.kr.HomeDataBean"%>
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
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="home" class="mirim.hs.kr.HomeDataBean">
	<jsp:setProperty name="home" property="*"/>
</jsp:useBean>
<%
	HomeDBBean homedb = HomeDBBean.getInstance();
	homedb.insertHome(home);

%>
<script>
	alert("HOME이 정상적으로 등록되었습니다.");
	location.href="index.jsp";
</script>	
</body>
</html>