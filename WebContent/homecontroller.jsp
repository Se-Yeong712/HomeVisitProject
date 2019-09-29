<%@page import="java.util.List"%>
<%@page import="mirim.hs.kr.ApplyDataBean"%>
<%@page import="mirim.hs.kr.ApplyDBBean"%>
<%@page import="mirim.hs.kr.UserDataBean"%>
<%@page import="mirim.hs.kr.UserDBBean"%>
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
String id = (String)session.getAttribute("id");
UserDBBean userdb = UserDBBean.getInstance();
UserDataBean user = userdb.getMember(id);

request.setAttribute("user", user);


ApplyDBBean applydb = ApplyDBBean.getInstance();
List<ApplyDataBean> applylist = applydb.getApplyAdmin(id);

request.setAttribute("applylist", applylist);

%>
<jsp:include page="menu.jsp" flush="false"></jsp:include>
<div class="container">
<br>
<br>
<h4>응모 정보</h4>
<table class="table">
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<tr> 
	<th>집 번호</th>
	<th>아이디</th>
	<th>응모횟수</th>
	<th>비고</th>
</tr>
<c:forEach items="${applylist }" var="list">
<c:if test="${list.result==0 }">
<tr>
	<td>${list.homecode }</td>
	<td>${list.id }</td>
	<td>${list.applycount }</td>
	<td><a href="homecontrollerproc.jsp?homecode=${list.homecode }&id=${list.id}">당첨</a></td>
</tr>
</c:if>
</c:forEach>
</table>



</div>
</body>
</html>