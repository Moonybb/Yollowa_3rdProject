<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YOLLOWA</title>
<%@ include file="../template/head.jspf"%>
<style type="text/css">
ul {
	list-style: none;
}

.mypageLink {
	color: black;
	text-decoration: none;
}

.mypageLink:hover {
	color: black;
	text-decoration: none;
}

.row {
	font-size: 1.000rem;
}

.card {
	border-radius: 5px;
}

.card-link {
	display: block;
	color: #433387;
}

.card-link:hover {
	color: #433387;
}
</style>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.js" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript">
	$(function() {
		$('.card-body p>a').on('mouseenter', function() {
			$(this).css('color', '#C6BFE7');
		}).on('mouseleave', function() {
			$(this).css('color', '#433387');
		});
		$('.lodgeDetail').on('mouseenter', function() {
			$(this).css('color', '#C6BFE7');
		}).on('mouseleave', function() {
			$(this).css('color', 'black');
		});
	});
</script>
</head>
<body>
	<%@ include file="../template/header.jspf"%>
	<%@ include file="../template/menu.jspf"%>
	<%@ include file="../template/mypagemenu1.jspf" %>
			<div class="col-md-9">
			<c:if test="${service eq 2 }">
			<h2>${user.user_name }님의 숙박 장바구니 내역 </h2>
			<a style="margin-bottom:10px;"
				href="${pageContext.request.contextPath }/mypage/cart/1"
				class="btn btn-primary">액티비티 보기</a>
			<c:forEach items="${cartinfo }" var="info" varStatus="status">
				<div class="jumbotron">
				<!-- 룸정보는 rsvinfo에 들어있는 게시물넘버와 숙박 게시물번호와 같을때 출력 -->
					<h3>${info.lodgement_companyName }</h3>
					<hr class="my-4">
					<p>객실 정보 : ${info.roomInfo_name }</p>
					<p>선택 일자 : ${info.lReservInfo_checkIn } ~ ${info.lReservInfo_checkOut }</p>
					<p>업소 주소 : ${info.lodgement_location}</p>
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${info.lReservInfo_payment }" var="pay" />
					<p>결제 금액 : ${pay }원</p>
					<p class="lead">
					<form action="${pageContext.request.contextPath }/lodgement/detail/reservation/${info.roomInfo_articleNumber}" method="get">
						<input name="roomNumber" type="hidden" value="${info.roomInfo_roomNumber}" />
						<input type="hidden" name="sdate" class="sdateVal" value="${info.lReservInfo_checkIn }"/>
						<input type="hidden" name="edate" class="edateVal" value="${info.lReservInfo_checkOut }"/>
						<input type="hidden" name="cart" value="${info.lReservInfo_number }"/>
						<button class="btn btn-warning btn-lg" style="width: 100%;">결제 하기</button>
					</form>
					<hr class="my-4">	
						<a class="btn btn-lg lodgeDetail" href="${pageContext.request.contextPath }/lodgement/detail/${info.lReservInfo_acticleNumber}" role="button" style="display: block;" >숙박 업체 자세히 보기</a>
					</p>
					<p class="lead"  style="text-align: right;">
						<button class="btn btn-danger delete" >삭제</button>
					</p>
					<script type="text/javascript">
						$('.delete').on('click',function(){
							swal({
								title:"정말 삭제 하시겠습니까?",
							    icon: "warning",
						    	buttons :{
							    	confirm:{
							    		text:'확인',
							    		value:true,
							    		className:'btn btn-danger'
							    	},
							    	cancle:{
							    		text:'취소',
							    	 	value:false,
							    	 	className:'btn btn-primary'
							    	}
							    }
							}).then((result) =>{
								if(result){
									 $.ajax({
										method:"GET",
										url: "./delete/",
										data:{ 
												service:"${service}",
												reservNumber:"${info.lReservInfo_number}"
										},
									 	success:function(){
									 		swal({
												title:"삭제 되었습니다.",
											    icon: "success",
										    	buttons :{
											    	confirm:{
											    		text:'확인',
											    		value:true,
											    		className:'btn btn-primary'
											    	}
											    }
									 		}).then((result) =>{
									 			if(result){
											 		window.location.href="../cart/${service}";
									 			}
									 		});
									 	}
									}); 
									//ajax끝
								}else{
									
								}
							});
						});
					</script>
				</div>
				</c:forEach>
			</c:if>
			<c:if test="${service eq 1 }">
			<h2>${user.user_name }님의 액티비티 장바구니 내역 </h2>
			<a style="margin-bottom:10px;"
				href="${pageContext.request.contextPath }/mypage/cart/2"
				class="btn btn-warning">숙박 보기</a>
			<c:forEach items="${cartinfo }" var="info">
				<div class="jumbotron">
				<!-- 룸정보는 rsvinfo에 들어있는 게시물넘버와 숙박 게시물번호와 같을때 출력 -->
					<h3>${info.activity_title }</h3>
					<hr class="my-4">
					<p>옵션 이름 : ${info.activityOption_name}</p>
					<p>세부 내용 : ${info.activityOption_subName}</p>
					<p>업소 주소 : ${info.activity_location}</p>
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${info.aReservInfo_payment }" var="pay" />
					<p>결제 하실 금액 : ${pay }원</p>
					<p class="lead">
						<a class="btn btn-primary btn-lg" href="#" role="button" style="display: block;">결제 하기</a>
					<hr class="my-4">	
						<a class="btn btn-lg lodgeDetail" href="${pageContext.request.contextPath }/activity/detail/${info.aReservInfo_articleNumber}" role="button" style="display: block;" >업체 자세히 보기</a>
					</p>
					<p class="lead" style="text-align: right;">
						<button class="btn btn-danger delete" >삭제</button>
					</p>
					<script type="text/javascript">
						$('.delete').on('click',function(){
							swal({
								title:"정말 삭제 하시겠습니까?",
							    icon: "warning",
						    	buttons :{
							    	confirm:{
							    		text:'확인',
							    		value:true,
							    		className:'btn btn-danger'
							    	},
							    	cancle:{
							    		text:'취소',
							    	 	value:false,
							    	 	className:'btn btn-primary'
							    	}
							    }
							}).then((result) =>{
								if(result){
									 $.ajax({
										method:"GET",
										url: "./delete/",
										data:{ 
												service:"${service}",
												reservNumber:"${info.aReservInfo_number}"
										},
									 	success:function(){
									 		swal({
												title:"삭제 되었습니다.",
											    icon: "success",
										    	buttons :{
											    	confirm:{
											    		text:'확인',
											    		value:true,
											    		className:'btn btn-primary'
											    	}
											    }
									 		}).then((result) =>{
									 			if(result){
											 		window.location.href="../cart/${service}";
									 			}
									 		});
									 	}
									}); 
									//ajax끝
								}else{
									
								}
							});
						});
					</script>
				</div>
				</c:forEach>
			</c:if>
			
			</div>
	<%@ include file="../template/mypagemenu2.jspf" %>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>