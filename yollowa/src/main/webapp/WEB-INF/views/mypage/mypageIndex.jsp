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
			<h2>${user.user_name }님의 숙박 예약 현황 입니다!</h2>
			<c:forEach items="${rsvinfo }" var="info">
				<div class="jumbotron">
				<!-- 룸정보는 rsvinfo에 들어있는 게시물넘버와 숙박 게시물번호와 같을때 출력 -->
					<h3>${info.lodgement_companyName }</h3>
					<hr class="my-4">
					<p>객실 정보 : ${info.roomInfo_name }</p>
					<p>예약 일자 : ${info.lReservInfo_checkIn } ~ ${info.lReservInfo_checkOut }</p>
					<p>제한 인원 : ${info.roomInfo_minPeople }명 ~ ${info.roomInfo_maxPeople }명</p>
					<p>업소 주소 : ${info.lodgement_location}</p>
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${info.lReservInfo_payment}" var="pay" />
					<p>결제 금액 : ${pay }원</p>
					<p class="lead">
						<a class="btn btn-warning btn-lg" href="#" role="button" style="display: block;">예약 번호 확인하기</a>
					<hr class="my-4">	
						<a class="btn btn-lg lodgeDetail" href="${pageContext.request.contextPath }/lodgement/detail/${info.lReservInfo_acticleNumber}" role="button" style="display: block;" >숙박 업체 자세히 보기</a>
					</p>
				</div>
				</c:forEach>
			</div>
	<%@ include file="../template/mypagemenu2.jspf" %>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>