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
 <div class="col-md-6">
<div class="card" style="width:100%">
    <img class="card-img-top" src="https://lh3.googleusercontent.com/ROvHQE4ipbNzOAeb6EDaXFIN4IERJKDvuf4snz6FF-EUzQz4dLh2mbzui829DET3Wq83" alt="Card image" style="width:100%">
    <div class="card-body">
      <h4 class="card-title">제비뽑기</h4>
      <p class="card-text">행운의 제비를 뽑아보세요!</p>
      <button class="btn btn-outline-primary" data-toggle="modal" data-target="#myModal1">하러가기</button>
    </div>
</div>
</div>

 <div class="col-md-6">
<div class="card" style="width:100%">
    <img class="card-img-top" src="https://data.ac-illust.com/data/thumbnails/9a/9a3bd37a71b632e7726f149bbd771052_t.jpeg" alt="Card image" style="width:100%">
    <div class="card-body">
      <h4 class="card-title">가위바위보</h4>
      <p class="card-text">이기면 5Point!</p>
      <button class="btn btn-outline-primary" data-toggle="modal" data-target="#myModal2">하러가기</button>
    <br>
    </div>
</div>
</div>


<br>
<br>
<br>
<button style="margin:0 auto" class="btn btn-warning" onclick="payment()" id="payment">게임비 내기</button>
<button style="margin:0 auto" class="btn btn-danger" onclick="savepoint()" id="point">Point받기</button>

</div>
<br>
</div>



<script>
var point=0;
var play=0;
function getRandom(min, max) {
	  return Math.floor(Math.random() * (max - min) + min);
}

function savepoint(){
	alert(point+'Point가 적립되었습니다.'); 
	location.href='savepoint.jsp?id=${user.id}&point='+point;
}

function payment(){
	point -= (play*3);
	alert((play*3)+"포인트가 게임비로 납부되었습니다.");
	$('#payment').remove();
	$("#point").removeAttr('hidden');
	
}

$(document).ready(function(){
	
	$("#point").attr("hidden","true");
	

	/* 제비뽑기 */
	$('.random img').each(function(index){
		$(".random"+index).click(function(){
			var su1 = getRandom(1,6);
			alert(index+"쪽지 안에 포인트는 "+su1+"입니다!");
			point += su1;
			play+=1;
			$('img.random1').remove();
			$('img.random2').remove();
			$('img.random3').remove();
			$('img.random4').remove();
			$('img.random5').remove();
			
			$("<p></p>").text(su1 + "포인트를 획득하셨습니다.").appendTo("div.random");
		});	
	});
	
	
	/* 가위바위보 */
	$("div.rock img.number").attr("hidden","true");
	$("div.rock button").attr("hidden","true");
	$("div.result img").attr("hidden","true");
	var sel=0;
	var su2=0;
	
	$(".sel1").click(function(){
		alert("가위를 선택했습니다.");
		sel=1;
		$('img.sel2').remove();
		$('img.sel3').remove();
		$("div.rock button").removeAttr('hidden');
	});
	$(".sel2").click(function(){
		sel=2;
		alert("바위를 선택했습니다.");
		$('img.sel1').remove();
		$('img.sel3').remove();
		$("div.rock button").removeAttr('hidden');
	});
	$(".sel3").click(function(){
		sel=3;
		alert("보를 선택했습니다.");
		$('img.sel1').remove();
		$('img.sel2').remove();
		$("div.rock button").removeAttr('hidden');
	});
	
	
	$("#count").click(function(){
		setTimeout(function() {
			$("img.number:eq(0)").removeAttr('hidden');
			
		}, 1000);
		
		setTimeout(function() {
			
			$("img.number:eq(1)").removeAttr('hidden');
			
		}, 2000);
		
		setTimeout(function() {
			
			$("img.number:eq(2)").removeAttr('hidden');
			
		}, 3000);
		
		setTimeout(function() {	
			 su2 = getRandom(1,3);
			$('div.result img.result'+su2).removeAttr('hidden');
			$("div.rock img.number").attr("hidden","true");
			$("div.rock button").attr("hidden","true");
	
		}, 4000);
		
		setTimeout(function() {	
			
			if((sel==1&&su2==1) || (sel==2&&su2==2) || (sel==3&&su2==3)){
				alert("비겼습니다.");
				point+=3;
				$("<p></p>").text("3포인트를 획득하셨습니다.").appendTo("div.rock");
			}
			if((sel==2&&su2==1) || (sel==3&&su2==2) || (sel==1&&su2==3)){
				alert("이겼습니다.");
				point+=5;
				$("<p></p>").text("5포인트를 획득하셨습니다.").appendTo("div.rock");
			}
			if((sel==1&&su2==2) || (sel==2&&su2==3) || (sel==3&&su2==1)){
				alert("졌습니다.");
				$("<p></p>").text("0포인트를 획득하셨습니다.").appendTo("div.rock");
			}
			
			play+=1;
			
		}, 5000);
		
	});
	

});


</script>


<!-- 제비뽑기 -->
<div class="container">

<div class="modal" id="myModal1">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <div class="modal-header">
          <h4 class="modal-title">제비뽑기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body random">
         <img class="random1" src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile4.uf.tistory.com%2Fimage%2F212F384B5804EA872DF949" style="width: 15%">
         <img class="random2" src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile4.uf.tistory.com%2Fimage%2F212F384B5804EA872DF949" style="width: 15%">
         <img class="random3" src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile4.uf.tistory.com%2Fimage%2F212F384B5804EA872DF949" style="width: 15%">
         <img class="random4" src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile4.uf.tistory.com%2Fimage%2F212F384B5804EA872DF949" style="width: 15%">
         <img class="random5" src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile4.uf.tistory.com%2Fimage%2F212F384B5804EA872DF949" style="width: 15%">
      
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>




  <!-- 가위바위보 -->
  <div class="modal" id="myModal2">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <div class="modal-header">
          <h4 class="modal-title">가위바위보</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body rock">
        <div class="sel">
        <img class="sel1" src="http://sscoach.kr/xe/files/attach/images/5212/339/036/0976ce52e5252b65f72334628bb40ea5.png" style="width: 30%">
        <img class="sel2" src="http://sscoach.kr/xe/files/attach/images/5212/339/036/181b02085f483e3d9282fc1ff0929faf.png" style="width: 30%">
        <img class="sel3" src="http://sscoach.kr/xe/files/attach/images/5212/339/036/80dc892ed8d7aabb44c5f1d784e4808b.png" style="width: 30%">
		</div>
        
        
        <button class="btn btn-success" id="count">시작하기</button>
         <img class="number" src="https://image.flaticon.com/icons/svg/188/188234.svg" style="width: 15%">
         <img class="number" src="https://image.flaticon.com/icons/svg/188/188235.svg" style="width: 15%">
         <img class="number" src="https://image.flaticon.com/icons/svg/188/188236.svg" style="width: 15%">

		<div class="result">
        <img class="result1" src="http://sscoach.kr/xe/files/attach/images/5212/339/036/0976ce52e5252b65f72334628bb40ea5.png" style="width: 30%">
        <img class="result2" src="http://sscoach.kr/xe/files/attach/images/5212/339/036/181b02085f483e3d9282fc1ff0929faf.png" style="width: 30%">
        <img class="result3" src="http://sscoach.kr/xe/files/attach/images/5212/339/036/80dc892ed8d7aabb44c5f1d784e4808b.png" style="width: 30%">
		</div>



        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
  

  
  
  
</div>





</body>
</html>