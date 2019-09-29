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
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
function result(){
	
	var win = window.open("result.jsp","resultForm","width=700,height=300,resizable=no,scrollbars=no");
}




</script>



</head>
<body>
<%
String id = (String)session.getAttribute("id");
UserDBBean userdb = UserDBBean.getInstance();
UserDataBean user = userdb.getMember(id);

request.setAttribute("user", user);


ApplyDBBean applydb = ApplyDBBean.getInstance();
List<ApplyDataBean> applylist = applydb.getApplyList(id);

request.setAttribute("applylist", applylist);

%>

<jsp:include page="menu.jsp" flush="false"></jsp:include>
<div class="container">
<br>
<br>
<h4>내 정보</h4>
<table class="table">
<colgroup>
<col width="20%" />
<col width="40%" />
<col width="40%" />
</colgroup>
<tr> 
	<th>이름</th>
	<th>point</th>
	<th>응모권</th>
</tr>
<tr>
	<td>${user.name }</td>
	<td>${user.point }
		<c:if test="${user.point >= 10 }">
			&nbsp;&nbsp;<button class="btn btn-outline-secondary" onclick="location.href='toticket.jsp'">응모권으로 교환</button>
		</c:if> 
	</td>
	<td>${user.ticket }</td>

</table>
<br>
<br>
 <h4>응모 현황</h4>
<table class="table">
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
	<tr>
		<th>집 번호</th>
		<th>집주인</th>
		<th>응모횟수</th>
		<th>당첨확인</th>
	</tr>
	<c:forEach items="${applylist }" var="list">
		<tr>
			<td>${list.homecode }</td>
			<td>${list.admin }</td>
			<td>${list.applycount }</td>
			<td>
			<c:if test="${list.result == 0}">
				미당첨
			</c:if>
			<c:if test="${list.result == 1}">
				<button class="btn btn-primary" onclick="result()">당첨권 확인</button>
			</c:if>
			</td>
			
		</tr>
	
	</c:forEach>

</table>
</div>
</body>
</html>