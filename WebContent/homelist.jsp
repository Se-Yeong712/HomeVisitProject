<%@page import="mirim.hs.kr.HomeDBBean"%>
<%@page import="mirim.hs.kr.HomeDataBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menu.jsp" flush="false"></jsp:include>
<div class="container">
<br>
<br>
<h2>�̺�Ʈ ���</h2>
<%
	HomeDBBean homedb = HomeDBBean.getInstance();
	List<HomeDataBean> homelist = homedb.getHomeList();

	request.setAttribute("homelist", homelist);
%>

<table class="table table-hover">
	<tr>
		<td>���</td>
		<td>�ּ�</td>
		<td>����</td>
		<td>������</td>
		<td>���</td>
	</tr>
<c:forEach items="${homelist }" var="list">
	<tr>
		<td>${list.homecode}</td>
		<td>${list.address}</td>
		<td>${list.content }</td>
		<td>${list.id }</td>
		<td><a href="homeapply.jsp?homecode=${list.homecode }">�����ϱ�</a>
	</tr>
	</c:forEach>
</table>

</div>
</body>
</html>