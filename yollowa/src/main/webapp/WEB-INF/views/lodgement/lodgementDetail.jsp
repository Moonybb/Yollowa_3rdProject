<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../template/head.jspf"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css"
	integrity="sha256-3sPp8BkKUE7QyPSl6VfBByBroQbKxKG7tsusY2mhbVY="
	crossorigin="anonymous" />

<style type="text/css">
	.page-header {
		padding-top: 15px;
		padding-bottom: 25px;
	}
	
	.page-header>p {
		margin-top: 10px;
		margin-bottom: 2px;
	}
	
	.titleName {
		display: inline-block;
		font-size: 40px;
	}
	.rote{
		margin-top: 0px;
		margin-bottom:15px;
	}
	.rote > a{
		color: #007EC1;
	}
	.rote > a:hover{
		text-decoration: none;
	}
	.hashTag{
		font-size: 18px;
		margin-bottom:0px;
		color: #A1A1A0;
	}
	h3 {
		margin-bottom: 15px;
	}
	
	h3:first-letter {
		padding-left: 10px;
		border-left: 2px solid purple;
	}
	
	.quantity-style {
		text-align: center;
		min-width: 38px;
		max-width: 38px;
	}
	
	.quantity-wrapper {
		width: 38px;
	}
	
	.room {
		border: 1px solid lightgray;
		border-radius: 10px;
		padding: 10px 10px;
		margin: 20px 100px;
	}
	
	.roominfo>div>img {
		height: 200px;
	}
	
	.roominfo>div {
		display: inline-block;
		margin-right: 30px;
	}
	
	.roominfo>div+div {
		
	}
	
	#info-div, #review-div {
		padding-top: 20px;
		padding-bottom: 20px;
	}
	
	#reviewRateTitle{
		text-align:center;
		padding-bottom: 5px;
		font-size:22px;
	}
	#reviewRateStarDiv{
		text-align:center;
		font-size: 25px;
	}
	#reviewRateStar{
		color: #F1AD25;
	}
	#reviewRate{
		text-align:center;
	}
	#reviewRateCount{
		color: #A1A1A0;
		text-align:center;
		padding-top:10px;
		padding-bottom:30px;
		font-size: 16px;
	}
	
	.review-div {
		margin-top: 20px;
	}
	
	.review-box {
		padding: 30px 0px 0px 0px;
		border-top: 1px solid lightgray;
	}
	.review-title{
		font-size: 20px;	
		margin-bottom: 5px;
	}
	.review-content{
		font-size: 16px;
		padding: 15px 0px;
	}
	.writerText{
		font-size: 16px;
	}
	.review-writer {
		font-size: 16px;
		color: #A1A1A0;
	}
	.review-star{
		margin-bottom: 10px;
		font-size: 18px;
		color: #F1AD25;
	}
	.review-writedDateA {
		margin-top: 5px;
		margin-bottom: 40px;
		color: #A1A1A0;
	}
	
	.datePicker {
		text-align: center;
		width: 120px;
	}
	
	#pickerUl {
		list-style: none;
		margin: 0;
		padding: 0;
	}
	
	#pickerUl li {
		margin: 0 0 0 0;
		padding: 0 0 0 0;
		border: 0;
		float: left;
	}
	#dateDiv{
		padding: 0px 0px 40px 10px;
	}
	.job-left{
		padding: 15px 0px 15px 0px;
	}
	
	.roomName{
		font-size: 22px;
		margin-bottom: 60px;
		display: inline-block;
	}
	.roomPrice{
		font-size: 18px;
		margin-bottom: 45px;
	}
	.modalBtn{
		line-height: 15px;
		color: gray;
		float: right;
	}
	.carImg{
		height: 150px;
	}
	.jjim{
		float:right;
	}
	.cartBtn{
		width: 10%;
	}
	.submitBtn{
		width: 89%;
	}
	#location{
		font-size: 17px;
		margin-bottom:20px;
		position: relative;
	}
	
	/* card start*/ 
	.career-form {
		background-color: #4e63d7;
		border-radius: 5px;
		padding: 0 16px;
	}
	
	.career-form .custom-select:focus {
		-webkit-box-shadow: none;
		box-shadow: none;
	}
	
	.career-form .select-container {
		position: relative;
	}
	
	.career-form .select-container:before {
		position: absolute;
		right: 15px;
		top: calc(50% - 14px);
		font-size: 18px;
		color: #ffffff;
		content: '\F2F9';
		font-family: "Material-Design-Iconic-Font";
	}
	
	.filter-result .job-box {
		-webkit-box-shadow: 0 0 35px 0 rgba(130, 130, 130, 0.2);
		box-shadow: 0 0 35px 0 rgba(130, 130, 130, 0.2);
		border-radius: 10px;
		padding: 10px 35px;
		margin-bottom: 30px;
	}
	
	ul {
		list-style: none;
	}
	
	.list-disk li {
		list-style: none;
		margin-bottom: 12px;
	}
	
	.list-disk li:last-child {
		margin-bottom: 0;
	}
	
	
	@media ( min-width : 992px) {
		.job-overview {
			position: -webkit-sticky;
			position: sticky;
			top: 70px;
		}
	}
	
	.job-content ul li {
		font-weight: 600;
		opacity: 0.75;
		border-bottom: 1px solid #ccc;
		padding: 10px 5px;
	}
	
	@media ( min-width : 768px) {
		.job-content ul li {
			border-bottom: 0;
			padding: 0;
		}
	}
	
	.job-content ul li i {
		font-size: 20px;
		position: relative;
		top: 1px;
	}
	
	.mb-30 {
		margin-bottom: 30px;
	}
	/* card end*/
	
	/* 캐러셀 start */
	.carousel-item div>img{
		width: 280px;
		height:200px;
	}
	/* 캐러셀 end */
	
	/* tab */
	.tabs{
		margin-bottom:40px;
	}
	.tab{
		font-size:20px;
	}
	.job-box{
		width:100%;
		height:250px;
	}
	
	/* 기본정보 */
	.commentJumbo{
		padding:30px;
	}
	.commentJumbo > div{
		padding-left:10px;
		color: gray;
	}
	.infoTitle{
		margin-top: 20px;
	}
	
	.infoJumbo{
		padding: 30px;
	}
	.comment{
		font-size: 20px;
	}
	
</style>
<!-- swal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<script type="text/javascript">

	// 달력
	/* $(document).ready(function() {
	$("#datepicker").val($.datepicker.formatDate('yy-mm-dd',new Date()));
	
	}); */
	
	$(function(){
	$( "#sdate" ).datepicker({
	dateFormat:"yy-mm-dd",
	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
	monthNames: ['1월','2월','3월','4월','5월','6월',
	'7월','8월','9월','10월','11월','12월'],
	minDate: 0
	});
	$( "#edate" ).datepicker({
	dateFormat:"yy-mm-dd",
	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
	monthNames: ['1월','2월','3월','4월','5월','6월',
	'7월','8월','9월','10월','11월','12월'],
	minDate: 0
	});
	});
	
	$(document).ready(function(){
			$('#edate').datepicker("option", "minDate", $("#sdate").val());
			$('#edate').datepicker("option", "onClose", function ( selectedDate ) {
			$("#sdate").datepicker( "option", "maxDate", selectedDate );
		});
	});
	
	// 날짜 선택
	function pickerIn(a){
		var InValue = $(a).val();
		$('.sdateVal').val(InValue);
	
		var num = "articleNum="+$('#articleNumber').val()+"&selectDate="+$(a).val();
		
		$.ajax({
			type:'post',
			dataType : 'json',
			data:num,
			url:$('#articleNumber').val()+"/ajax",
			
			success:function(s){
			
			$.each(s,function(idx,val){
			
				var valueCheck = Date.parse($(a).val());
				var startD = Date.parse(val.roomInfo_peakStartDate);
				var endD = Date.parse(val.roomInfo_peakEndDate);
				
				if(valueCheck>=startD && valueCheck<=endD){
					$('.div-peak'+idx).show();
					$('.div-offPeak'+idx).hide();
				}else{
					$('.div-peak'+idx).hide();
					$('.div-offPeak'+idx).show();
					}
				});
			},
			error:function(e){
				console.log(e);
			}
		});
	};
		
	function pickerOut(o){
		var outValue = $(o).val();
		$('.edateVal').val(outValue);
	};

	// 패키지 옵션 설정 버튼 
	$(function() {
		$('#package-div-option-select button').mouseover(function(){
			
			$(this).css('background-color','#EDE1FA');
			
		});
		
			$('#package-div-option-select button').mouseleave(function(){
			$(this).css('background-color','white');
		});
	});
	
	
	// 성수기바로구매
	<c:forEach items="${roomList}" var="bean" varStatus="status">
		function peakBuySubmit${status.index}(t){
			console.log($(('.peak${status.index}')).text()); // 성수기
			
		}
	</c:forEach>
		
	
	// 장바구니
	function wish(){
	window.location.href="../../";
	};
	
	
	$("link[rel='shortcut icon']").attr("href", "${pageContext.request.contextPath}/resources/img/icons/favicon.png");
	
	
	// 캐러셀 이미지
	$(document).ready(function(){
		
		// 가격 정규식
		for(var i=0; i<100; i++){
			var offPeakPrice = $('.offPeakPrice'+i).text().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'원';
			$('.offPeakPrice'+i).text(offPeakPrice);
			var peakPrice = $('.peakPrice'+i).text().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'원';
			$('.peakPrice'+i).text(peakPrice);
		}
		
		// 타이틀 이미지 carousel
		var title_Hidden_Img = $('#title-carousel').find('input').val();
		console.log(title_Hidden_Img);
		var title_Img_List = title_Hidden_Img.split("&");
		for(var i=0;i<title_Img_List.length;i++){
			if(i==0){
				var carouselActive= '<div class="carousel-item active">';
				carouselActive+='<img src="/lodgement/titleImg/'+title_Img_List[i]+'"';
				carouselActive+= ' class="d-block w-100 titImg" alt="..."></div>';
	
				$('#title-carousel').append(carouselActive);
			}else{
				var carouselDefault= '<div class="carousel-item">';
				carouselDefault+='<img src="/lodgement/titleImg/'+title_Img_List[i]+'"';
				carouselDefault+= ' class="d-block w-100 titImg" alt="..."></div>';
				
				$('#title-carousel').append(carouselDefault);
			} 
		};
		$('.titImg').css('height','500px');
		
		
		// 방 이미지 carousel start
		<c:forEach items="${detailList}" var="bean" varStatus="status">
		
			var hiddenImg = $(".hiddenImg"+${status.index}).val();
			var imgList = hiddenImg.split("&");
			for(var i=0;i<imgList.length;i++){
				var img =imgList[i];
				if(i==0){
					var carouselActive= '<div class="carousel-item active">';
					carouselActive+='<img src="/lodgement/roomImg/'+imgList[i]+'"';
					carouselActive+= ' class="d-block w-100 carImg" alt="..."></div>';
	
					$('.carousel-inner'+${status.index}).append(carouselActive);
				}else{
					var carouselDefault= '<div class="carousel-item">';
					carouselDefault+='<img src="/lodgement/roomImg/'+imgList[i]+'"';
					carouselDefault+= ' class="d-block w-100 carImg" alt="..."></div>';
					
					$('.carousel-inner'+${status.index}).append(carouselDefault);
				} 
			};
		</c:forEach>
			$('.carImg').css('height','200px');
		
		// 방 캐러셀 end
		
		
		// 기본정보 - 정보 받아서 & 단위로끊어서 입력
		// 공지사항
		var noticeInput = $('.noticeInput').val();
		var notice = noticeInput.split('&');
		for(var i=0; i<notice.length; i++){
			var appendDiv = '<p style="color:gray; margin:0px 0px 10px 10px; font-size:16px;">- '+notice[i]+'</p>';
			$('.info_notice').append(appendDiv);
		}

		// 기본정보
		var basicInfoInput = $('.basicInfoInput').val();
		var basicInfo = basicInfoInput.split('&');
		for(var i=0; i<basicInfo.length; i++){
			var appendDiv = '<p style="color:gray; margin:0px 0px 10px 10px; font-size:16px;">- '+basicInfo[i]+'</p>';
			$('.info_basicInfo').append(appendDiv);
		}

		// 인원추가정보
		var addPeopleInfoInput = $('.addPeopleInfoInput').val();
		var addPeopleInfo = addPeopleInfoInput.split('&');
		for(var i=0; i<addPeopleInfo.length; i++){
			var appendDiv = '<p style="color:gray; margin:0px 0px 10px 10px; font-size:16px;">- '+addPeopleInfo[i]+'</p>';
			$('.info_addPeopleInfo').append(appendDiv);
		}

		// 서비스 및 편의시설
		var serviceInput = $('.serviceInput').val();
		var service = serviceInput.split('&');
		for(var i=0; i<service.length; i++){
			var appendDiv = '<p style="color:gray; margin:0px 0px 10px 10px; font-size:16px;">- '+service[i]+'</p>';
			$('.info_service').append(appendDiv);
		}
		
		// 취소 및 환불규정
		var refundInfoInput = $('.refundInfoInput').val();
		var refundInfo = refundInfoInput.split('&');
		for(var i=0; i<refundInfo.length; i++){
			var appendDiv = '<p style="color:gray; margin:0px 0px 10px 10px; font-size:16px;">- '+refundInfo[i]+'</p>';
			$('.info_refundInfo').append(appendDiv);
		}
	});
	
	// 장바구니 ajax
	function cartInput(articleNumber, roomNumber){
		
		var sdate = $('#sdate').val();
		var edate = $('#edate').val();
		
		
		// 로그인 확인 체크 (로그인이 되어있을 시) model에 userNumber에 유저번호를 실어줌
		if(${userNumber}!=0){
			// 체크인 체크아웃 선택 체크
			if(sdate!=''&&edate!=''){		
				swal('장바구니에 등록합니다','마이페이지 - 장바구니에서 확인하세요','success');
				
				$.ajax({
					url:"./cartInsert",
					data: {articleNumber:articleNumber, roomNumber:roomNumber, sdate:sdate, edate:edate},
					method: 'POST'
				});
			
			}else{
				swal('예약일자를 선택하세요','체크인, 체크아웃 날짜를 선택해야 장바구니 등록이 가능합니다','warning');
			}
		// 로그인 확인 체크 (로그인 x) 로그인되어있지 않을때에는 model에 userNumber로 0을 실어준다 (nullPoint 방지)
		}else if(${userNumber}==0){
			swal('로그인이 필요한 서비스입니다','로그인을 하시고 장바구니 서비스를 이용하세요.', 'warning');
		}
	};
	
	// 찜하기 ajax
	function addWish(number){
		console.log(${userNumber});
		// 로그인 확인 체크 (로그인이 되어있을 시) model에 userNumber에 유저번호를 실어줌
		if(${userNumber}!=0){
			// 체크인 체크아웃 선택 체크
			swal('찜목록에 추가되었습니다','마이페이지 - 찜목록에서 확인하세요','success');
			
			$.ajax({
				url:"./wishInsert",
				data: {number:number},
				method: 'POST'
			});
			
		// 로그인 확인 체크 (로그인 x) 로그인되어있지 않을때에는 model에 userNumber로 0을 실어준다 (nullPoint 방지)
		}else if(${userNumber}==0){
			swal('로그인이 필요한 서비스입니다','로그인을 하시고 찜목록 서비스를 이용하세요.', 'warning');
		}
	};
	

</script>

<meta charset="UTF-8">
<title>숙박</title>
</head>
<body>
	<%@ include file="../template/lodgeHeader.jspf"%>
	<%@ include file="../template/lodgeMenu.jspf"%>
	<div class="container">
	
	
		<div class="page-header">
		<!-- -->
			
			<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
			  <div id="title-carousel" class="carousel-inner">
				<input type="hidden" value="${listImg}"/>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
		</div>
		<!--  -->
		<p class="rote">
			<a href="../../">메인 페이지</a> > <a href="../list"> 숙박 페이지</a> > <a href="#">${startEndDay.getLodgement_companyName()}</a>
		</p>
		<p class="hashTag">${hashTag }</p>
		<p class="titleName">${startEndDay.getLodgement_companyName()}</p>
		<button class="btn btn-outline-danger jjim" onclick="addWish(${article });">♡ 위시리스트</button>
		
		<c:forEach items="${infoList }" var="bean">
			<div class="jumbotron commentJumbo">
				<p class="comment">사장님 한마디</p	>
				<div>${bean.information_comment }</div>
			</div>
		</c:forEach>
		
		
		
		<!--  -->
		<ul class="nav nav-tabs tabs" id="myTab" role="tablist">
			<li class="nav-item tab" role="presentation">
				<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">객실 예약</a>
			</li>
			<li class="nav-item tab" role="presentation">
				<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">기본 정보</a>
			</li>
			<li class="nav-item tab" role="presentation">
				<a class="nav-link" id="map-tab" data-toggle="tab" href="#map" role="tab" aria-controls="map" aria-selected="false">위치</a>
			</li>
			<li class="nav-item tab" role="presentation">
				<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">리뷰</a>
			</li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
				<!-- 객실예약 -->
				<div class="row">
			<div id="category" class="col-md-12">
					<div id="infoList">
						<input id="articleNumber" type="hidden" value="${article}" />
						<div id="package-div-option">
							<div id="dateDiv">
								<input id="sdate" class="btn btn-secondary" aria-labelledby="dropdownMenuButton" role="btn" name="nal" type="text" readonly="readonly" placeholder="체크인 날짜 선택" onchange="pickerIn(this);" /> 
								<input id="edate" class="btn btn-secondary" aria-labelledby="dropdownMenuButton" role="btn" name="nal" type="text" readonly="readonly" placeholder="체크아웃 날짜 선택" onchange="pickerOut(this);"/>
							</div>
							<!-- -->

							<div class="container">
								<div class="row">
									<div class="filter-result col-md-9">
										<div class="job-content">
											<c:forEach items="${detailList }" var="bean" varStatus="status">
												<input class="hiddenImg${status.index }" type="hidden" value="${bean.roomInfo_img }"/>
												<div class="job-box">
													<div class="job-left row">
															<!-- <img src="http://placehold.it/350x200" /> -->
															
														<div id="carouselExampleControls${status.index }" class="carousel slide col-md-5" data-ride="carousel" style="overflow: hidden;">
														  <div class="carousel-inner${status.index } ">
														   <!-- carousel  -->
														    
														    <a class="carousel-control-prev" href="#carouselExampleControls${status.index }" role="button" data-slide="prev">
														      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
														      <span class="sr-only">Previous</span>
														    </a>
														    <a class="carousel-control-next" href="#carouselExampleControls${status.index }" role="button" data-slide="next">
														      <span class="carousel-control-next-icon" aria-hidden="true"></span>
														      <span class="sr-only">Next</span>
														    </a>
														  </div>
														 
														</div>
														<!-- 비수기 start -->
														<ul class="div-offPeak${status.index} col-md-7" >
															<form name="offPeakform${status.index}" action="reservation/${bean.roomInfo_articleNumber}">
																<li class="roomName">${bean.roomInfo_name }</li>
																<button type="button" class="btn btn-secondary modalBtn" data-toggle="modal" data-target="#exampleModal${status.index}off">
																	객실 이용 안내
																</button>
																
																<input class="paymentOffPeak${status.index}" name="roomNumber" type="hidden" value="${bean.roomInfo_roomNumber}" />
																<input type="hidden" name="sdate" class="sdateVal"/>
																<input type="hidden" name="edate" class="edateVal"/>

																<div class="roomPrice"> 가격 (비성수기)
																	<span class="offPeakPrice${status.index }" style="display: inline-block; float: right;">${bean.roomInfo_offPeakPrice }</span>
																</div>
															<!-- Modal start -->
															
															<div class="modal fade" id="exampleModal${status.index}off" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
															  <div class="modal-dialog  modal-dialog-centered">
															    <div class="modal-content">
															      <div class="modal-header">
															        <h5 class="modal-title" id="exampleModalLabel">객실 이용 안내</h5>
															        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
															          <span aria-hidden="true">&times;</span>
															        </button>
															      </div>
															      <div class="modal-body">
																      <h5><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-plus-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
																		  <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm7.5-3a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
																		</svg> 인원 당 추가 요금</h5>
																	  <p>￦ ${bean.roomInfo_extraPrice }</p>
																	  <hr>
																	  <h5><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-people-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
																			  <path fill-rule="evenodd" d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
																			</svg> 최소인원 / 최대인원</h5>
																	  <p>${bean.roomInfo_minPeople }명 / ${bean.roomInfo_maxPeople }명</p>
																	  <hr>

																	  <h5>
																	  	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-calendar-week" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
																			<path fill-rule="evenodd" d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
																			<path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-5 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
																		</svg>
																			성수기 기간</h5>
																	  <p>${bean.roomInfo_peakStartDate} ~ ${bean.roomInfo_peakEndDate}</p>
															      </div>
															      <div class="modal-footer">
															        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
															      </div>
															    </div>
															  </div>
															</div>
															
															<!-- Modal end -->
															<button class="btn btn-outline-primary submitBtn" type="submit" >${bean.roomInfo_name } 예약 페이지로 이동</button>
															<!-- 장바구니 -->
															<button type="button" onclick="cartInput(${bean.roomInfo_articleNumber},${bean.roomInfo_roomNumber});" class="cartBtn btn btn-outline-success">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cart-check-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
															  <path fill-rule="evenodd" d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM4 14a1 1 0 1 1 2 0 1 1 0 0 1-2 0zm7 0a1 1 0 1 1 2 0 1 1 0 0 1-2 0zm.354-7.646a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
															</svg>
													        </button>
															</form>
															
														</ul>
														<!-- 비수기 end -->
														
														<!-- 성수기 start -->
														<ul class="div-peak${status.index} col-md-7" style="display: none;">
															<form name="peakform${status.index}" action="reservation/${bean.roomInfo_articleNumber}">
																<li class="roomName">${bean.roomInfo_name }</li>
																<button style="margin-bottom: 20px;" type="button" class="btn btn-secondary modalBtn" data-toggle="modal" data-target="#exampleModal${status.index}">
																	  객실 이용 안내
																</button>
																
																<input class="paymentPeak${status.index}" name="roomNumber" type="hidden" value="${bean.roomInfo_roomNumber}" />
																<input type="hidden" name="sdate" class="sdateVal"/>
																<input type="hidden" name="edate" class="edateVal"/>
																<div class="roomPrice"> 가격 (성수기)
																	<span class="peakPrice${status.index }" style="display: inline-block; float: right;">${bean.roomInfo_peakPrice }</span>
																</div>
															<!-- Modal start -->
															<div class="modal fade" id="exampleModal${status.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">

															  <div class="modal-dialog  modal-dialog-centered">
															    <div class="modal-content">
															      <div class="modal-header">
															        <h5 class="modal-title" id="exampleModalLabel">객실 이용 안내</h5>
															        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
															          <span aria-hidden="true">&times;</span>
															        </button>
															      </div>
															      <div class="modal-body">
																      <h5><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-plus-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
																		  <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm7.5-3a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
																		</svg> 인원 당 추가 요금</h5>
																	  <p>￦ ${bean.roomInfo_extraPrice }</p>
																	  <hr>
																	  <h5><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-people-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
																			  <path fill-rule="evenodd" d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
																			</svg> 최소인원 / 최대인원</h5>
																	  <p>${bean.roomInfo_minPeople }명 / ${bean.roomInfo_maxPeople }명</p>
																	  <hr>
																	  <h5>
																	  	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-calendar-week" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
																			<path fill-rule="evenodd" d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
																			<path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-5 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
																		</svg>
																			성수기 기간</h5>
																	  <p>${bean.roomInfo_peakStartDate} ~ ${bean.roomInfo_peakEndDate}</p>
															      </div>
															      <div class="modal-footer">
															        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
															      </div>
															    </div>
															  </div>
															</div>
															<!-- Modal end -->
															<button class="btn btn-outline-primary submitBtn" type="submit" >${bean.roomInfo_name } 예약 페이지로 이동</button>
															<!-- 장바구니 -->
															<button type="button" onclick="cartInput(${bean.roomInfo_articleNumber},${bean.roomInfo_roomNumber});" class="cartBtn btn btn-outline-success">
															<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cart-check-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
															  <path fill-rule="evenodd" d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM4 14a1 1 0 1 1 2 0 1 1 0 0 1-2 0zm7 0a1 1 0 1 1 2 0 1 1 0 0 1-2 0zm.354-7.646a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
															</svg>
													        </button>
															</form>
														</ul>
														<!-- 성수기 end -->
														
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div> 
						</div>

						<!-- -->
					</div>
			</div>
		</div>
	</div>
			<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
				<!-- ...정보 -->
				<div id="info-div">
					<div class="jumbotron infoJumbo">
						<c:forEach items="${infoList }" var="bean">
							<h5 class="infoTitle">공지사항</h5>
							<div class="info_notice"></div>
							<input type="hidden" class="noticeInput" value="${bean.information_notice }"></input>
							
							<h5 class="infoTitle">기본정보</h5>
							<div class="info_basicInfo"></div>
							<input type="hidden" class="basicInfoInput" value="${bean.information_basicInfo }"></input>
							
							<h5 class="infoTitle">인원추가정보</h5>
							<div class="info_addPeopleInfo"></div>
							<input type="hidden" class="addPeopleInfoInput" value="${bean.information_addPeopleInfo }"></input>
							
							<h5 class="infoTitle">서비스 및 편의시설</h5>
							<div class="info_service"></div>
							<input type="hidden" class="serviceInput" value="${bean.information_service }"></input>

							<h5 class="infoTitle">취소 및 환불규정</h5>
							<div class="info_refundInfo"></div>
							<input type="hidden" class="refundInfoInput" value="${bean.information_refundInfo }"></input>
							
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="map" role="tabpanel" aria-labelledby="map-tab">
				<!-- 지도 -->
				<div id="location"> ${companyName} 주소(도로명) : ${pin }</div>
				<div class="mapClass">
					<p style="margin-top:-12px">
					    <em class="link">
					        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
					            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
					        </a>
					    </em>
					</p>
					<div id="mapkakao" style="width:100%;height:350px;"></div>
				</div>
			</div>
			<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
				<!-- ..리뷰 -->
				<div id="review-div row">
					<div id="reviewRate text-center">
						<div id="reviewRateTitle">추천해요</div>
						<div id="reviewRateStarDiv">
						<span id="reviewRateStar">★ ★ ★ ★ ★ </span><span id="reviewRate">10.0</span>
						</div>
						<div id="reviewRateCount">전체리뷰 40</div>
					</div>
					<c:forEach items="${reviewList}" var="bean" varStatus="status">
						<div class="review-box col-md-12">
							<div class="review-title">${bean.review_title }</div>
							<span class="review-star">★ ${bean.review_starPoint}.0 </span>
							<span class="writerText"></span><span class="review-writer">| ${bean.review_writer}</span>
							<div class="review-content">${bean.review_content}</div>
							<div class="review-writedDate${status.index} review-writedDateA">${bean.review_writedDate }</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../template/footer.jspf"%>
<script>
	var mapContainer = document.getElementById('mapkakao'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${pin}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        console.log("coords:"+coords);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${companyName}</div>'
        });
        infowindow.open(map, marker);

        setTimeout(function(){
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.relayout();
	        map.setCenter(coords);
        },2000);
    } 
});
	
</script> 
</body>
</html>