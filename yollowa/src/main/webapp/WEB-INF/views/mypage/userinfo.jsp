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
	<!-- <div class="col-md-9">
		
	
	
	</div> -->
	<%@ include file="../template/mypagemenu2.jspf"%>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>