<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menu.jsp" flush="false"></jsp:include>
<br>
<div class="container">
<div class="row">
 <div class="col-sm-4">
<div class="card" style="width:100%">
    <img class="card-img-top" src="https://lh3.googleusercontent.com/ROvHQE4ipbNzOAeb6EDaXFIN4IERJKDvuf4snz6FF-EUzQz4dLh2mbzui829DET3Wq83" alt="Card image" style="width:100%">
    <div class="card-body">
      <h4 class="card-title">제비뽑기</h4>
      <p class="card-text">행운의 제비를 뽑아보세요!</p>
      <button class="btn btn-outline-primary" data-toggle="modal" data-target="#myModal1">하러가기</button>
    </div>
</div>
</div>

 <div class="col-sm-4">
<div class="card" style="width:100%">
    <img class="card-img-top" src="https://data.ac-illust.com/data/thumbnails/9a/9a3bd37a71b632e7726f149bbd771052_t.jpeg" alt="Card image" style="width:100%">
    <div class="card-body">
      <h4 class="card-title">가위바위보</h4>
      <p class="card-text">이기면 5Point!</p>
      <button class="btn btn-outline-primary" data-toggle="modal" data-target="#myModal2">하러가기</button>
    </div>
</div>
</div>


 <div class="col-sm-4">
<div class="card" style="width:100%">
    <img class="card-img-top" src="https://scontent.cdninstagram.com/vp/15e05c8e60604496f59d9db4a28f411a/5DB796ED/t51.2885-15/e35/s480x480/25017370_1607915379298457_5450685086309548032_n.jpg?_nc_ht=scontent-lax3-2.cdninstagram.com" alt="Card image" style="width:100%">
    <div class="card-body">
      <h4 class="card-title">동전긁기</h4>
      <p class="card-text">동전긁기로 행운을 확인하세요!</p>
      <button class="btn btn-outline-primary" data-toggle="modal" data-target="#myModal3">하러가기</button>
    </div>
</div>
</div>
</div>

</div>

<!-- Modal -->
<div class="container">

<div class="modal" id="myModal1">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">제비뽑기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <a class="random1"><img src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile4.uf.tistory.com%2Fimage%2F212F384B5804EA872DF949" style="width: 15%"></a>
          <a class="random2"><img src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile4.uf.tistory.com%2Fimage%2F212F384B5804EA872DF949" style="width: 15%"></a>
          <a class="random3"><img src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile4.uf.tistory.com%2Fimage%2F212F384B5804EA872DF949" style="width: 15%"></a>
          <a class="random4"><img src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile4.uf.tistory.com%2Fimage%2F212F384B5804EA872DF949" style="width: 15%"></a>
          <a class="random5"><img src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile4.uf.tistory.com%2Fimage%2F212F384B5804EA872DF949" style="width: 15%"></a>
        
        
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>




  <!-- The Modal -->
  <div class="modal" id="myModal2">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading2</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..2
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
  
  
  
  <div class="modal" id="myModal3">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading3</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body.3
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
  
  
</div>







</body>
</html>