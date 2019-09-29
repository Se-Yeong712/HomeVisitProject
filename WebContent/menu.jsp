<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/jquery-3.4.0.min.js"></script>

  
<style>
.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: dodgerblue;
  color: white;
}

.topnav-right {
  float: right;
  color: white;
}

</style>
</head>
<body>
<br>
<div class="title" style="text-align: center"><h2>HOME VISIT EVENT</h2></div>
<div class="topnav">
<c:if test="${user.id eq null }">
<a class="nav-link" href="login.jsp" >로그인</a>
<a class="nav-link" href="signup.jsp">회원가입</a>
</c:if>

<c:if test="${user.id != null }">
<div class="topnav-right">
${user.name}님이 로그인하셨습니다.<br>
</div>
<a class="nav-link" href="index.jsp" >MAIN</a>
<c:if test="${user.part == 1 }">
<a class="nav-link" href="eventpage.jsp" >EVENT PAGE</a>
<a class="nav-link" href="homelist.jsp" >HOME LIST</a>
<a class="nav-link" href="mypage.jsp" >MY PAGE</a>
</c:if>

<c:if test="${user.part == 2 }">
<a class="nav-link" href="homeregister.jsp">HOME 등록</a>
<a class="nav-link" href="homecontroller.jsp">HOME 관리</a>
</c:if>

<a class="nav-link" href="logout.jsp">로그아웃</a>
</c:if>
</div>





</body>
</html>