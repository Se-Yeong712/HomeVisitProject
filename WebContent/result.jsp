<%@page import="mirim.hs.kr.ApplyDataBean"%>
<%@page import="mirim.hs.kr.ApplyDBBean"%>
<%@page import="mirim.hs.kr.HomeDBBean"%>
<%@page import="mirim.hs.kr.HomeDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.body{
background-image: url('https://images.unsplash.com/photo-1510627489930-0c1b0bfb6785?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80');
background-size: 610px;
margin-top: -100px;

}

.img{
    position: relative;
    background-image: url('https://images.unsplash.com/photo-1510627489930-0c1b0bfb6785?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80');                                                             
    height: 100vh;
    background-size: cover;
}

.img-cover{
   position: absolute;
   margin-left:5%;
   margin-top:4%;
   height: 85%;
   width: 90%;
   background-color: rgba(0, 0, 0, 0.4);                                                                 
   z-index:1;
}
.img .content{
     position: absolute;
     top:50%;
     left:50%;
     transform: translate(-50%, -50%);                                                                   
     color: white;
     z-index: 2;
     text-align: center;
}

.qr{
    position: relative;    
    float: right;
    width: 50px;
    height: 50px;                                                   
}

</style>
</head>
<body>
<%
String id = (String)session.getAttribute("id");

ApplyDBBean applydb = ApplyDBBean.getInstance();
ApplyDataBean apply = applydb.getApply(id);

request.setAttribute("apply", apply);

HomeDBBean homedb = HomeDBBean.getInstance();
HomeDataBean home = homedb.getHome(apply.getHomecode());

request.setAttribute("home",home);


%>
<div class="img">
        <div class="content">
            <h1>초대권</h1>
            <p>${apply.id }님을 초대합니다.</p>
            <p>장소 : ${home.address }</p>
        </div>
        
        <div class="img-cover"></div>
        <img src="qrcode.png" class="qr">
    </div>

</body>
</html>