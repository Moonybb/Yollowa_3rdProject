<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../template/head.jspf"%>

<style type="text/css">

/* category start */
.page-header {
	border-bottom: 1px solid lightgray;
	padding-top: 15px;
	padding-bottom: 25px;
}

.page-header>p {
	margin-top: 10px;
	margin-bottom: 2px;
}
/* category end */

h2 {
	text-align: center;
	margin: 30px 0px;
	font-size:50px;
}
h3{
	margin-bottom: 15px;
}

h3:first-letter {
	padding-left: 10px;
	border-left: 2px solid purple;
}


#package-div-option-select{
	background-color:white;
	margin:10px 0px;
	border:1px solid purple;
	font-size: 15px;
	padding: 10px 20px;
}
#package-div-option-select div{
}
#package-div-option-select div p{
	margin:2px auto;
}

.quantity-style{
     text-align: center;  
     min-width: 38px; 
     max-width: 38px;
}

.quantity-wrapper{
     width: 38px; 
}

#resultAmount{
	border: 0px;
	text-align: center;
}
#map-div,#info-div,#review-div{
	padding-top: 20px;
	padding-bottom:20px;
	border-top: 1px solid lightgray;

}

/* 리뷰css */
.review-div{
	margin-top: 20px;
}
.review-box{
	padding:10px 20px;
	margin-bottom:30px;
	background-color: #F7F3FF ;
	border-radius: 10px;
}

.review-writer{
	font-style:italic;
	font-size: 15px;
}

.review-writedDateA{
	float: right;
}

</style>
<script type="text/javascript">

	/* 달력 */
	var today = new Date();
	var month,day;
	
	if(today.getDate()<10){
		day="0"+today.getDate();
	}else{
		day=today.getDate();
	}
	
	if(today.getMonth()<9){
		month="0"+(today.getMonth()+1);
	}else{
		month=today.getMonth()+1;
	}
	
	var msg = (today.getYear()+1900) +"-"+month+ "-"+day;
	
	$(function() {
		$('#currentDate').attr('value', msg);
		$('#currentDate').attr('min', msg);
	});
	
	function nalja(n){
		var nal = $(n).prev().val();
		
		$.ajax({
			type:'get',
			data:{
				nal:nal
			},
			url:'./'
		});
		console.log(nal);
		document.currentDate1.submit();
	};
	
	
	/* 패키지 옵션 설정 버튼 */
	$(function() {
		$('#package-div-option-select button').mouseover(function(){
			$(this).css('background-color','#EDE1FA');
		});
		$('#package-div-option-select button').mouseleave(function(){
			$(this).css('background-color','white');
		});
	});
	
	/* 수량 */
	
	// + 버튼
	function add(a){
		
		var clickValue = parseInt($(a).prev().val(),10);
		var resultValue =clickValue+1;
		
		$(a).prev().val(resultValue);
		var pri1 = parseInt($(a).prev().prev().val());
		var totalAdd = parseInt($('#resultAmount').val())+pri1;
		
		//합계
		$('#resultAmount').val(totalAdd);
	}
	
	// - 버튼
	function del(d){
		var clickValue = parseInt($(d).prev().prev().val(),10);
		var resultValue =clickValue-1;
		
		if(resultValue>-1){
			$(d).prev().prev().val(resultValue);
			
			var pri2 = parseInt($(d).prev().prev().prev().val());
			var totalDel = parseInt($('#resultAmount').val())-pri2;
			
			//합계
			$('#resultAmount').val(totalDel); 
			
		}
	};
	
	// 바로구매
	function buySubmit(){

		if($('.uuu').text()=="로그인"){
			alert("로그인이 필요한 기능입니다. 로그인페이지로 이동합니다.");
			window.location.href="../../login/";
		}else{
			document.form1.submit();
		}
		
		
	}
	
	// 장바구니
	function wish(){
		window.location.href="../../";
	};
	
	
	// 리뷰 날짜
	
	$(function(){
		for (var i = 0; i <100; i++) {
			var a = $('.review-writedDate'+i).text().substring(0,10);
			$('.review-writedDate'+i).text(a);
			
		}
	});
	
</script>

<meta charset="UTF-8">
<title>액티비티</title>
</head>
<body>
	<%@ include file="../template/header.jspf"%>
	<%@ include file="../template/menu.jspf"%>
	<div class="container">
		<div class="page-header">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="../resources/img/activity/activityMain.png"
							class="d-block w-100" />
					</div>
					<div class="carousel-item">
						<img src="../resources/img/activity/activityMain.png"
							class="d-block w-100" />
					</div>
					<div class="carousel-item">
						<img src="../resources/img/activity/activityMain.png"
							class="d-block w-100" />
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>


		</div>
		<div class="row">
			<div id="category" class="col-md-12">
			<c:forEach items="${detailList }" var="bean">
				<h2>${bean.activity_title }</h2>
			</c:forEach>
				<div id="infoList">
					<div class="jumbotron">
						<h3>패키지 옵션</h3>
						<div id="package-div-option">
							<h5>날짜 및 패키지 옵션 선택</h5>
							<div>
								<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">예약가능 날짜</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<form name="currentDate1" id="currentDate1">
										<input id="currentDate" name="nal" type="date"/>
										<input type="button" value="확인" onclick="nalja(this);"/>
									</form>
								</div>
							</div>
							
							<div>
								<h5>옵션 선택</h5>
								<form name="form1" action="Inicis" method="post" >
									<button type="reset" class="btn btn-outline-warning">재설정</button>
									<c:forEach items="${option }" var="bean">
									<div id="package-div-option-select" class="col-md-10">
										<div>
											<p>[${bean.AOInfo_name}]</p>
										</div>
										<div>
											<p>${bean.AOInfo_optionNumber}. ${bean.activityOption_name }</p>
											<p>￦${bean.AOInfo_price}</p>
											<input type="hidden" value="${bean.AOInfo_price}"/>
											<input type="text" name="amount${bean.AOInfo_optionNumber}" style="height:25px;" value="0" size="8" disabled/>
											<input class="btn btn-primary btn-sm" role="btn" style="border-radius: 5px;" type="button" value="+" onclick="add(this);"/>
											<input class="btn btn-primary btn-sm" role="btn" style="border-radius: 5px;" type="button" value="-" onclick="del(this);"/>
										</div>
									</div>
									</c:forEach>
									<div class="input-group mb-3">
									  <div class="input-group-prepend">
									    <span class="input-group-text" id="inputGroup-sizing-default">합계</span>
										<input id="resultAmount" name="resultAmount" value="0" type="text" size="10" readonly="readonly" />
									  </div>
									</div>
									<input type="button" class="btn btn-outline-primary" value="장바구니" onclick="wish();"/>
									<input type="button" class="btn btn-outline-primary" value="바로구매" onclick="buySubmit();"/>
								</form>
							</div>
						</div>
					</div>

					<div id="info-div">
						<h3>기본정보</h3>
						<p>내용</p>
					</div>

					<div id="map-div">
						<h3>지도</h3>
						<div id="map" style="width: 100%; height: 350px;"></div>
					</div>

					<div id="review-div" >
						<h3>리뷰</h3>
						
						<c:forEach items="${reviewList}" var="bean" varStatus="status">
						<div class="review-box">
							<div class="review-writedDate${status.index} review-writedDateA">${bean.review_writedDate }</div>
							<div class="review-writer blockquote-footer">${bean.review_writer}</div>
							<div class="review-star">별점 : ${bean.review_starPoint}</div>
							<div class="review-content">${bean.review_content}</div>
						</div>
						</c:forEach>
					</div>

				</div>

			</div>
		</div>
		<%@ include file="../template/footer.jspf"%>
</body>
<script>
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(37.503013, 127.024264),
		level : 3
	};

	var map = new kakao.maps.Map(container, options);

	var position = new kakao.maps.LatLng(37.503013, 127.024264);

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : position,
		clickable : true
	// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
	});

	// 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
	// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
	// marker.setClickable(true);

	// 마커를 지도에 표시합니다.
	marker.setMap(map);
</script>
</html>