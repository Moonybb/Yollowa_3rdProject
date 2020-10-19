<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <img src="${pageContext.request.contextPath }/resources/img/surffing.jpg" class="d-block w-100" alt="...">
    	<div class="carousel-caption d-none d-md-block" style="margin-bottom: 75px;">
    	<h1 style="font-weight: bold;">NEW EXPERIENCE AND FEELING</h1>
		<img style="width:123px;height: 35px;"alt="" src="${pageContext.request.contextPath}/resources/img/icons/headLogo.png">
      </div>
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath }/resources/img/youth.jpg" class="d-block w-100" alt="...">
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
  		<!-- <div class="col-lg-6" style="text-align: center;">
  		<button type="button" class="btn btn-warning">액티비티 추천</button>
  		</div>
  		<div class="col-lg-6" style="text-align: center;">
  		<button type="button" class="btn btn-primary">숙박업소 추천</button>
  		</div> -->
	</div>

</div>

<%@ include file="template/footer.jspf" %>

</body>
</html>