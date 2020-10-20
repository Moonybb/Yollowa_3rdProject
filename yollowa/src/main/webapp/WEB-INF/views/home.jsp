<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
<%@ include file="template/head.jspf" %>
<style type="text/css">
		
		.nav-item{
			border-radius: 7px;
		}
		.nav-link{
			font-size:16px;
			
		}
		 .carousel-item,
		.carousel-inner,
		.carousel-inner img {
		  height: 100%;
		}
		.carousel-item {
		  text-align: center;
		}
		.carousel {
		  height: 400px;
		} 
		.carousel-inner img {
		  width: 100%;
		}
		h2{
			display:block;
			font-weight:bold;
			margin-top: 75px;
			margin-bottom: 25px;
		}
		.card-img-top{
			border-top-left-radius: 10px;border-top-right-radius: 10px;
			height: 180px;
		}
		a:hover{
			text-decoration: none;
		}
		.card-title{
			color:black;
		}
		.hashtag{
			height: 37.33px;
			color: #757575;
		}
</style>
<meta charset="UTF-8">
<title>Yollowa</title>
<script type="text/javascript">
$("link[rel='shortcut icon']").attr("href", "${pageContext.request.contextPath}/resources/img/icons/favicon.png");
</script>
</head>
<body>
<%@ include file="template/header.jspf" %>
<%@ include file="template/menu.jspf" %>
	<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
  <div class="carousel-inner ">
    <div class="carousel-item active">
      <video src="${pageContext.request.contextPath }/resources/video/beach.mp4" class="d-block w-100" autoplay noache muted></video>
    	<div class="carousel-caption d-none d-md-block" style="margin-bottom: 75px;">
    	<h1 style="font-weight: bold;">NEW EXPERIENCE AND FEELING</h1>
		<img style="width:123px;height: 35px;"alt="" src="${pageContext.request.contextPath}/resources/img/icons/headLogo.png">
      </div>
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath }/resources/img/main2camping.jpg" class="d-block w-100" alt="...">
    	<div class="carousel-caption d-none d-md-block" style="margin-bottom: 75px;">
    	<h1 style="font-weight: bold;">NEW EXPERIENCE AND FEELING</h1>
		<img style="width:123px;height: 35px;"alt="" src="${pageContext.request.contextPath}/resources/img/icons/headLogo.png">
      </div>
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath }/resources/img/main3mountain.jpg" class="d-block w-100" alt="...">
    	<div class="carousel-caption d-none d-md-block" style="margin-bottom: 75px;">
    	<h1 style="font-weight: bold;">NEW EXPERIENCE AND FEELING</h1>
		<img style="width:123px;height: 35px;"alt="" src="${pageContext.request.contextPath}/resources/img/icons/headLogo.png">
      </div>
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath }/resources/img/main4hotel.jpg" class="d-block w-100" alt="...">
    	<div class="carousel-caption d-none d-md-block" style="margin-bottom: 75px;">
    	<h1 style="font-weight: bold;">NEW EXPERIENCE AND FEELING</h1>
		<img style="width:123px;height: 35px;"alt="" src="${pageContext.request.contextPath}/resources/img/icons/headLogo.png">
      </div>
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath }/resources/img/main5rafting.jpg" class="d-block w-100" alt="...">
    	<div class="carousel-caption d-none d-md-block" style="margin-bottom: 75px;">
    	<h1 style="font-weight: bold;">NEW EXPERIENCE AND FEELING</h1>
		<img style="width:123px;height: 35px;"alt="" src="${pageContext.request.contextPath}/resources/img/icons/headLogo.png">
      </div>
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
<div class="container">
	<div class="row">
	<h2>인기 액티비티</h2>
	<div class="row row-cols-1 row-cols-md-4" >
	<c:forEach items="${alist }" var="activity" end="3"> 

  <div class="col mb-3">
   <a href="#">
    <div class="card h-100" style="border-radius: 10px;">
      <img src="/activity/titleImg/${activity.activity_img }" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">${activity.activity_title }</h5>
        <c:if test="${activity.hashTag ne null }">
        <p class="card-text hashtag">
        <c:forEach var="hash" items="${activity.hashTag }">
        ${hash }
        </c:forEach>
        </p>
        </c:if>
        <p class="card-text" style="color: #DCA60A;"><svg width="1em" height="1em" viewBox="0 0 16 16"
										class="bi bi-star-fill" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
  										<path
											d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
				</svg>${activity.activity_reviewGradeRate } <span style="color: #757575;">리뷰 ${activity.activity_reviewCount }개</span></p> 
				<fmt:formatNumber type="number" maxFractionDigits="3" value="${activity.price }" var="pay" />
				<p style="color:black;" class="card-text">￦ ${pay }원 ~</p>
      </div>
    </div>
    </a>
    
  </div>
  	</c:forEach>
  	
</div>
	<h2>인기 숙박</h2>
	<div class="row row-cols-1 row-cols-md-4">
	<c:forEach items="${llist }" var="lodgement" end="3"> 
	
  <div class="col mb-3">
  <a href="#">
 
    <div class="card h-100" style="border-radius: 10px;">
      <img src="/lodgement/titleImg/${lodgement.lodgement_img }" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">${lodgement.lodgement_companyName }</h5>
        <c:if test="${lodgement.hashTag ne null }">
        <p class="card-text hashtag">
        <c:forEach var="hash" items="${lodgement.hashTag }">
        ${hash }
        </c:forEach>
        </p>
        </c:if>
        <p class="card-text" style="color: #DCA60A;"><svg width="1em" height="1em" viewBox="0 0 16 16"
										class="bi bi-star-fill" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
  										<path
											d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
				</svg>${lodgement.lodgement_reviewGradeRate } <span style="color: #757575;">리뷰 ${lodgement.lodgement_reviewCount }개</span></p>
				<fmt:formatNumber type="number" maxFractionDigits="3" value="${lodgement.price }" var="pay" />
				<p style="color:black;" class="card-text">￦ ${pay }원 ~</p>
      </div>
    </div>
     </a>
  </div>
  	</c:forEach>
  	
</div>
</div>

</div>

<%@ include file="template/footer.jspf" %>

</body>
</html>