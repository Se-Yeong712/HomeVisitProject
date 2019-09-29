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

int homecode = Integer.parseInt(request.getParameter("homecode"));
String id = request.getParameter("id");

ApplyDBBean applydb = ApplyDBBean.getInstance();
applydb.updateResult(homecode, id);





%>
<Script>
	alert("당첨자를 선정하였습니다.");
	location.href="homecontroller.jsp";
	
</Script>



</body>
</html>