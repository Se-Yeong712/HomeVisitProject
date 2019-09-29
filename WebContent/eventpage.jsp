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
      <h4 class="card-title">����̱�</h4>
      <p class="card-text">����� ���� �̾ƺ�����!</p>
      <button class="btn btn-outline-primary" data-toggle="modal" data-target="#myModal1">�Ϸ�����</button>
    </div>
</div>
</div>

 <div class="col-md-6">
<div class="card" style="width:100%">
    <img class="card-img-top" src="https://data.ac-illust.com/data/thumbnails/9a/9a3bd37a71b632e7726f149bbd771052_t.jpeg" alt="Card image" style="width:100%">
    <div class="card-body">
      <h4 class="card-title">����������</h4>
      <p class="card-text">�̱�� 5Point!</p>
      <button class="btn btn-outline-primary" data-toggle="modal" data-target="#myModal2">�Ϸ�����</button>
    <br>
    </div>
</div>
</div>


<br>
<br>
<br>
<button style="margin:0 auto" class="btn btn-warning" onclick="payment()" id="payment">���Ӻ� ����</button>
<button style="margin:0 auto" class="btn btn-danger" onclick="savepoint()" id="point">Point�ޱ�</button>

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
	alert(point+'Point�� �����Ǿ����ϴ�.'); 
	location.href='savepoint.jsp?id=${user.id}&point='+point;
}

function payment(){
	point -= (play*3);
	alert((play*3)+"����Ʈ�� ���Ӻ�� ���εǾ����ϴ�.");
	$('#payment').remove();
	$("#point").removeAttr('hidden');
	
}

$(document).ready(function(){
	
	$("#point").attr("hidden","true");
	

	/* ����̱� */
	$('.random img').each(function(index){
		$(".random"+index).click(function(){
			var su1 = getRandom(1,6);
			alert(index+"���� �ȿ� ����Ʈ�� "+su1+"�Դϴ�!");
			point += su1;
			play+=1;
			$('img.random1').remove();
			$('img.random2').remove();
			$('img.random3').remove();
			$('img.random4').remove();
			$('img.random5').remove();
			
			$("<p></p>").text(su1 + "����Ʈ�� ȹ���ϼ̽��ϴ�.").appendTo("div.random");
		});	
	});
	
	
	/* ���������� */
	$("div.rock img.number").attr("hidden","true");
	$("div.rock button").attr("hidden","true");
	$("div.result img").attr("hidden","true");
	var sel=0;
	var su2=0;
	
	$(".sel1").click(function(){
		alert("������ �����߽��ϴ�.");
		sel=1;
		$('img.sel2').remove();
		$('img.sel3').remove();
		$("div.rock button").removeAttr('hidden');
	});
	$(".sel2").click(function(){
		sel=2;
		alert("������ �����߽��ϴ�.");
		$('img.sel1').remove();
		$('img.sel3').remove();
		$("div.rock button").removeAttr('hidden');
	});
	$(".sel3").click(function(){
		sel=3;
		alert("���� �����߽��ϴ�.");
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
				alert("�����ϴ�.");
				point+=3;
				$("<p></p>").text("3����Ʈ�� ȹ���ϼ̽��ϴ�.").appendTo("div.rock");
			}
			if((sel==2&&su2==1) || (sel==3&&su2==2) || (sel==1&&su2==3)){
				alert("�̰���ϴ�.");
				point+=5;
				$("<p></p>").text("5����Ʈ�� ȹ���ϼ̽��ϴ�.").appendTo("div.rock");
			}
			if((sel==1&&su2==2) || (sel==2&&su2==3) || (sel==3&&su2==1)){
				alert("�����ϴ�.");
				$("<p></p>").text("0����Ʈ�� ȹ���ϼ̽��ϴ�.").appendTo("div.rock");
			}
			
			play+=1;
			
		}, 5000);
		
	});
	

});


</script>


<!-- ����̱� -->
<div class="container">

<div class="modal" id="myModal1">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <div class="modal-header">
          <h4 class="modal-title">����̱�</h4>
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




  <!-- ���������� -->
  <div class="modal" id="myModal2">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <div class="modal-header">
          <h4 class="modal-title">����������</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body rock">
        <div class="sel">
        <img class="sel1" src="http://sscoach.kr/xe/files/attach/images/5212/339/036/0976ce52e5252b65f72334628bb40ea5.png" style="width: 30%">
        <img class="sel2" src="http://sscoach.kr/xe/files/attach/images/5212/339/036/181b02085f483e3d9282fc1ff0929faf.png" style="width: 30%">
        <img class="sel3" src="http://sscoach.kr/xe/files/attach/images/5212/339/036/80dc892ed8d7aabb44c5f1d784e4808b.png" style="width: 30%">
		</div>
        
        
        <button class="btn btn-success" id="count">�����ϱ�</button>
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