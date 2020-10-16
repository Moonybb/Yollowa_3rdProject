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

.hashtag {
	height: 37.33px;
}

form {
	
}

.link:hover {
	text-decoration: none;
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
	<div class="col-md-9">
		<h2>계정 설정</h2>
		<br>
		<div class="card border-primary mb-3" style="width: 100%;">
			<div class="card-header">
				<div style="display: inline-block;">개인정보 변경</div>
				<a class="link" href="userinfo/changepw">></a>
			</div>
			<div class="card-body">
				<p class="card-text">
					비밀번호 <a href="userinfo/changepw"
						style="color: #593196; font-weight: bold;">변경</a>
						</p>
						<p class="card-text">
				휴대폰 번호 <a href="userinfo/changephone"
						style="color: #593196; font-weight: bold;">변경</a>
						</p>
			</div>
				
		</div>
		<div class="card border-primary mb-3" style="width: 100%;">
			<div class="card-header">
				<div style="display: inline-block;">계정 삭제</div>
				<a class="link" href="userinfo/deleteUser">></a>
			</div>
			<div class="card-body">
				<p class="card-text">욜로와 계정 및 개인정보를 삭제 합니다.</p>
			</div>
		</div>

	</div>
	<%@ include file="../template/mypagemenu2.jspf"%>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>