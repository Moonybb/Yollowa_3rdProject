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
		//
		 var list = new Array();
		<c:forEach items="${existReview}" var="count" varStatus="status">
		var cnt = ${count};
		list.push(cnt);
		</c:forEach> 
		for(var i in list){
			if(list[i]==1){
				//$('.reviewBtn'+i).css({ 'pointer-events': 'none' });
				$('.reviewBtn'+i).attr('href','javascript:void(0)');
				$('.reviewBtn'+i).on('click',function(){
					swal({
						title:"실패",
					    text: "이미 작성하신 리뷰가 존재합니다.",
					    icon: "error"
					});
				});
				
				
			}
		}
		

	});
	
</script>
</head>
<body>
	<%@ include file="../template/header.jspf"%>
	<%@ include file="../template/menu.jspf"%>
	<%@ include file="../template/mypagemenu1.jspf" %>
			<div class="col-md-9">
			<h2>${user.user_name }님의 액티비티 구매 내역 입니다!</h2>
			<div style="text-align: left;">
			<a style="margin-bottom:10px;text-align: left;"
				href="${pageContext.request.contextPath }/mypage/completed/1"
				class="btn btn-primary">액티비티 보기</a>
			</div>
			<c:forEach items="${usedinfo }" var="info" varStatus="status">
				<div class="jumbotron">
					<h3>${info.activity_title }</h3>
					<hr class="my-4">
					<p>옵션 이름 : ${info.activityOption_name}</p>
					<p>세부 내용 : ${info.activityOption_subName}</p>
					<p>사용 가능 일자 : ${info.aReservInfo_checkOut }까지</p>
					<p>업체 주소 : ${info.activity_location}</p>
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${info.aReservInfo_payment }" var="pay" />
					<p>결제 금액 : ${pay }원</p>
					<p class="lead">
						<a class="btn btn-primary btn-lg reviewBtn${status.index }" href="../../review_write/${service }/${info.aReservInfo_number}" role="button" style="display: block;" >리뷰 쓰기</a>
					<hr class="my-4">	
						<a class="btn btn-lg lodgeDetail" href="${pageContext.request.contextPath }/activity/detail/${info.aReservInfo_articleNumber}" role="button" style="display: block;" >업체 자세히 보기</a>
					</p>
				</div>
				</c:forEach>
			</div>
	<%@ include file="../template/mypagemenu2.jspf" %>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>