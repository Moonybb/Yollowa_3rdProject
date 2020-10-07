<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	});
</script>
</head>
<body>
	<%@ include file="../template/header.jspf"%>
	<%@ include file="../template/menu.jspf"%>
	<div class="container">
		<div class="page-header">
			<p>메인 페이지 > 마이 페이지</p>
			<h1>
				<a class="mypageLink"
					href="${pageContext.request.contextPath }/mypage/">마이페이지</a> <small>
					My Page</small>
			</h1>
		</div>

		<div class="row">
			<div class="col-md-3">
				<div class="card border-primary mb-3" style="max-width: 20rem;">
					<div class="card-header bg-primary">
						<a class="card-link" style="color: white;"
							href="${pageContext.request.contextPath }/mypage/">> 마이페이지</a>
					</div>
					<div class="card-body">
						<p class="card-text">
							<a class="card-link"
								href="${pageContext.request.contextPath }/mypage/">예약 현황</a>
						</p>
						<p class="card-text">
							<a class="card-link"
								href="${pageContext.request.contextPath }/mypage/completed">이용
								내역</a>
						</p>
						<p class="card-text">
							<a class="card-link"
								href="${pageContext.request.contextPath }/mypage/cart">장바구니</a>
						</p>
						<p class="card-text">
							<a class="card-link"
								href="${pageContext.request.contextPath }/mypage/wishlist">찜
								목록</a>
						</p>
					</div>
				</div>
				<div class="card border-secondary mb-3" style="max-width: 20rem;">
					<div class="card-header bg-secondary" style="color: white;">>
						내가 쓴 글</div>
					<div class="card-body">
						<p class="card-text">
							<a class="card-link"
								href="${pageContext.request.contextPath }/mypage/myreview">내가
								쓴 리뷰</a>
						</p>
						<p class="card-text">
							<a class="card-link"
								href="${pageContext.request.contextPath }/mypage/qna">내가 쓴
								Q&A</a>
						</p>
						<p class="card-text">
							<a class="card-link"
								href="${pageContext.request.contextPath }/mypage/userinfo">내
								정보</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<h3>Hello, world!</h3>
					<p class="lead">This is a simple hero unit, a simple
						jumbotron-style component for calling extra attention to featured
						content or information.</p>
					<hr class="my-4">
					<p>It uses utility classes for typography and spacing to space
						content out within the larger container.</p>
					<p class="lead">
						<a class="btn btn-primary btn-lg" href="#" role="button">Learn
							more</a>
					</p>
				</div>
			</div>
		</div>

	</div>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>