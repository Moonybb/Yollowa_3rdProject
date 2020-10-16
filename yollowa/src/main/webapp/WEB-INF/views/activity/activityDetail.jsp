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
	
	
	.filter-result .option-box {
		-webkit-box-shadow: 0 0 35px 0 rgba(130, 130, 130, 0.2);
		box-shadow: 0 0 35px 0 rgba(130, 130, 130, 0.2);
		border-radius: 10px;
		padding: 10px 35px;
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
	.option-box{
		width:100%;
		height:130px;
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
	
	
	/* 예약탭 아래 정보들 */
	.activityInfo{
		padding-left:30px;
	}
	.smallInfo{
		margin-top: 5px;
		color: gray;
	}
	.bigInfo{
		margin-top: 10px;
		font-size: 16px;
	}
	.infoTitle{
		font-size: 18px;
		margin-bottom: 20px;
	}
	
	
	
	/* option들 */
	.optionName{
		font-size: 18px;
	}
	.optionInfo{
		margin-top: 50px;
	}
	.optionAmount{
		
	}
	.optionPrice{
		float: right;
	}
</style>

<!-- swal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<script type="text/javascript">
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
				carouselActive+='<img src="/activity/titleImg/'+title_Img_List[i]+'"';
				carouselActive+= ' class="d-block w-100 titImg" alt="..."></div>';
	
				$('#title-carousel').append(carouselActive);
			}else{
				var carouselDefault= '<div class="carousel-item">';
				carouselDefault+='<img src="/activity/titleImg/'+title_Img_List[i]+'"';
				carouselDefault+= ' class="d-block w-100 titImg" alt="..."></div>';
				
				$('#title-carousel').append(carouselDefault);
			} 
		};
		$('.titImg').css('height','500px');
		
		
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
			<a href="../../">메인 페이지</a> > <a href="../list"> 숙박 페이지</a> > <a href="#">${startEndDay.getActivity_title()}</a>
		</p>
		<p class="hashTag">${hashTag }</p>
		<p class="titleName">${startEndDay.getActivity_title()}</p>
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
				<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">액티비티 예약</a>
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
						<div class="row">
							<div class="filter-result col-md-7">
								<div class="option-content">
								<!-- 액티비티 옵션들 -->
								<c:forEach items="${detailList }" var="bean" varStatus="status">
									<div class="option-box">
										<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="${bean.activityOption_name }" id="defaultCheck1">
										  <label class="optionName form-check-label" for="defaultCheck1">
										    ${bean.activityOption_name } [ ${bean.activityOption_subName } ]
										  </label>
										</div>
										<div class="optionInfo">
											<span class="optionPrice">${bean.activityOption_price }</span>
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
							<div class="col-md-1">
							</div>
							<div class="col-md-4">
								<div class="option-content jumbotron">
									<div>선택</div>
									<div>나중에 자바스크립트 append</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="activityInfo col-md-7">
						<div class="infoTitle">이용 상세 정보</div>
						<div>
						<div class="bigInfo">상품 기본 정보</div>
							<ul>
								<li class="smallInfo">구매일로부터 90일 이내 사용 가능</li>
							</ul>
						</div>
						
						<div>
							<div class="bigInfo">상품 사용 안내</div>
							<ul>
								<li class="smallInfo">원하는 상품 구매 (당일구매/당일사용 가능)</li>
								<li class="smallInfo">현장방문, 고객 성함 및 휴대폰번호 뒷 4자리 확인 후 이용</li>
							</ul>
						</div>
						
						<div>
							<div class="bigInfo">유의 사항 안내</div>
							<ul>
								<li class="smallInfo">안전상의 시설 점검으로 인한 일부 시설 이용에 제한이 있을 수 있습니다.</li>
								<li class="smallInfo">재판매 등 불법 거래 시 문제가 될 수 있습니다.</li>
								<li class="smallInfo">주말 및 공휴일에는 매우 혼잡할 수 있으며, 입장 대기시간이 발생할 수 있습니다.</li>
							</ul>
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