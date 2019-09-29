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
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UserDBBean user = UserDBBean.getInstance();
	int check = user.userCheck(id, pw);
	
	if(check==1){
		session.setAttribute("user", user.getMember(id));
		response.sendRedirect("index.jsp");

	}
	else if(check==0){
		//비밀번호 틀림
		response.sendRedirect("login.jsp");
	}
	else if(check==-1){
		//회원아님
		response.sendRedirect("signup.jsp");
	}
%>
</body>
</html>