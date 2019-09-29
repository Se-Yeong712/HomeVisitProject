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
		int x = user.getTodayCheck(id);
		if(x==1){
			System.out.println("x"+x);
			out.println("<script>alert('출석포인트가 적립되었습니다.'); location.href='index.jsp';</script>");
		}
		if(x==0){
			out.println("<script>location.href='index.jsp';</script>");
		}

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