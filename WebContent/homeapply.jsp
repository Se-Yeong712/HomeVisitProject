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
int homecode = Integer.parseInt(request.getParameter("homecode"));

HomeDBBean homedb = HomeDBBean.getInstance();
HomeDataBean home = homedb.getHome(homecode);

request.setAttribute("home", home);

%>
<script>

var jbResult = prompt( '${home.quiz}', '' );
if(jbResult=='${home.answer}'){
	alert("정답입니다.");
	location.href='homeapplyproc.jsp?homecode=${home.homecode}&id=${user.id}';
}
else{
	alert("정답이 아닙니다.");
	location.href="homelist.jsp";
}

</script>


</body>
</html>