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
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="mirim.hs.kr.UserDataBean">
	<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<%
	UserDBBean user = UserDBBean.getInstance();
	user.insertMember(member);

%>
<Script>
	alert(" 회원가입을 축하합니다.");
	location.href="index.jsp";
	
</Script>


</body>
</html>