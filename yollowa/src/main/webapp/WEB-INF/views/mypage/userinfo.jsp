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
.button{
	text-decoration: underline;
}
.link:hover {
	text-decoration: none;
}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
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
		
			


			
			
			/* swal({
				title:"인증 번호",
				text:user+"로 인증 번호를 전송 하였습니다.",
				content:"input",
		    	buttons :{
			    	confirm:{
			    		text:'확인',
			    		value:true,
			    		className:'btn btn-primary'
			    	}
			    }
			}).then((result) =>{
				if(result){
					$('#user_password').focus();
				}
			}); */
		
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
				<div style="display: inline-block;">비밀번호 변경</div>
				<a class="link" href="userinfo/changepw">></a>
			</div>
			<div class="card-body">
			<!-- onClick="return false;" -->
				<p class="card-text">
					비밀 번호를 변경 하시려면 <a class="button" href="userinfo/changepw" 
						style="color: #593196; font-weight: bold;">여기</a>를 클릭 하세요
				</p>
			</div>
		</div>
		<div class="card border-primary mb-3" style="width: 100%;">
			<div class="card-header">
				<div style="display: inline-block;">계정 삭제</div>
				<a class="link" href="userinfo/deleteuser">></a>
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