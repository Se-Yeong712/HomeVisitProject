<%@page import="mirim.hs.kr.UserDBBean"%>
<%@page import="mirim.hs.kr.ApplyDataBean"%>
<%@page import="mirim.hs.kr.ApplyDBBean"%>
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
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="apply" class="mirim.hs.kr.ApplyDataBean">
	<jsp:setProperty name="apply" property="*"/>
</jsp:useBean>

<%

ApplyDBBean applydb = ApplyDBBean.getInstance();
applydb.applyCheck(apply);


int ticket = Integer.parseInt(request.getParameter("applycount"));
String id = (String)session.getAttribute("id");
UserDBBean userdb = UserDBBean.getInstance();
userdb.updateTicket(id,ticket);


%>
<Script>
	alert("정상적으로 응모가 되었습니다.");
	location.href="mypage.jsp";
	
</Script>


</body>
</html>