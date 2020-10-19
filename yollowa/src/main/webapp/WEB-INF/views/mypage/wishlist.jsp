<%@page import="com.proj.yollowa.model.entity.lodgement.LodgementVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
.hashtag{
	height: 37.33px;
}
</style>
<script type="text/javascript">
$("link[rel='shortcut icon']").attr("href", "${pageContext.request.contextPath}/resources/img/icons/favicon.png");
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
	<%@ include file="../template/mypagemenu1.jspf"%>
	<div class="col-md-9">
		
		<c:if test="${service eq 1 }">
		<h2>${user.user_name }님의 액티비티 찜 목록</h2>
			<a style="margin-bottom:10px;"
				href="${pageContext.request.contextPath }/mypage/wishlist/2"
				class="btn btn-warning">숙박 보기</a>
			<div class="row row-cols-1 row-cols-md-3">
				<c:forEach items="${wishList }" var="userwish">
					<div class="col mb-4">
						<div class="card">
							<img src="/upload/activity/titleImg/${userwish.activity_img }"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title" style="font-weight: bold;">${userwish.activity_title }</h5>
								<p class="card-text" style="font-size: 0.8rem;">${userwish.activity_location }</p>
								<p class="card-text" style="font-size: 0.8rem; color: #DCA60A;">
									<svg width="1em" height="1em" viewBox="0 0 16 16"
										class="bi bi-star-fill" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
  <path
											d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
</svg>${userwish.activity_reviewGradeRate }</p>
								<p class="card-text" style="font-size: 0.8rem;">리뷰
									${userwish.activity_reviewCount }개</p>

								<p class="card-text hashtag" style="font-size: 0.8rem; color: #757575;">
								<c:if test="${userwish.hashTag ne null }">
									<c:forEach items="${userwish.hashTag }" var="hash">
							 ${hash }
							 </c:forEach>
								</c:if>
								
								</p>
								
								<a
									href="${pageContext.request.contextPath }/activity/detail/${userwish.activity_number}"
									class="btn btn-primary">게시물 보기</a>
							</div>
						</div>
					</div>

				</c:forEach>
			</div>
		</c:if>
		<c:if test="${service eq 2 }">
		<h2>${user.user_name }님의 숙박 찜 목록</h2>
			<a	style="margin-bottom:10px;"
				href="${pageContext.request.contextPath }/mypage/wishlist/1"
				class="btn btn-primary" style="text-align: center;">액티비티 보기</a>
			<div class="row row-cols-1 row-cols-md-3">
				<c:forEach items="${wishList }" var="userwish">
					<div class="col mb-4">
						<div class="card">
							<img src="/upload/lodgement/titleImg/${userwish.lodgement_img }"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title" style="font-weight: bold;">${userwish.lodgement_companyName }</h5>
								<p class="card-text" style="font-size: 0.8rem;">${userwish.lodgement_location }</p>
								<p class="card-text" style="font-size: 0.8rem; color: #DCA60A;">
									<svg width="1em" height="1em" viewBox="0 0 16 16"
										class="bi bi-star-fill" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
  <path
											d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
</svg>${userwish.lodgement_reviewGradeRate }</p>
								<p class="card-text" style="font-size: 0.8rem;">리뷰
									${userwish.lodgement_reviewCount }개</p>

								<p class="card-text hashtag" style="font-size: 0.8rem; color: #757575;">
								<c:if test="${userwish.hashTag ne null }">
									<c:forEach items="${userwish.hashTag }" var="hash">
							 ${hash }
							 </c:forEach>
							 </c:if>
							 <c:if test="${userwish.hashTag eq null }">
									${userwish.lodgement_hashTag }
								</c:if>
								</p>
								<a
									href="${pageContext.request.contextPath }/lodgement/detail/${userwish.lodgement_number}"
									class="btn btn-warning">게시물 보기</a>
							</div>
						</div>
					</div>

				</c:forEach>
			</div>
		</c:if>

		<%-- <c:if test="${emptyList ne null}">
					<h3>${emptyList }</h3>
				</c:if> --%>
		<!-- 이때부터 하면 됨. -->
		<c:if test="${emptyList eq null }">

		</c:if>
	</div>
	<%@ include file="../template/mypagemenu2.jspf"%>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>