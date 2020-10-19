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
	<%@ include file="../template/mypagemenu1.jspf"%>
	<div class="col-md-9">
		<h2>계정 설정</h2>
		<br>
					<div class="form-group">
				<label class="col-form-label" for="user_password">비밀번호 입력</label> <input
					type="password" class="form-control inputpw"
					placeholder="비밀번호를 입력해주세요" style="width: 25%;">
			</div>
			<button type="submit" class="btn btn-primary button">확인</button>
		

	</div>
			<script type="text/javascript">
			$(function() {
				var password;
				var pw;
				//$('.modal').show();
				var user = '${user.user_phoneNumber}';
				$('.button').on('click', function() {
					var inputpw=$('.inputpw').val();
					$.ajax({
						method:"POST",
						url: "${pageContext.request.contextPath}/mypage/userinfo/dsearchpw",
						data:{ 
							password:inputpw
						},
						dataType: "json",
					 	success:function(data){
					 		if(data==1){
					 			swal({
		 							title:"성공",
		 						    text: "정말 삭제 하시겠습니까? 모든 정보가 삭제됩니다",
		 						    icon: "success",
		 					    	buttons :{
		 						    	confirm:{
		 						    		text:'삭제',
		 						    		value:true,
		 						    		className:'btn btn-danger'
		 						    	},
		 						    	cancel:{
		 						    		text:'취소',
		 						    		value:false,
		 						    		className:'btn btn-primary'
		 						    	}
		 						    }
		 						}).then((result) =>{
		 							if(result){
		 								$.ajax({
		 									method:"POST",
		 									url: "${pageContext.request.contextPath}/mypage/userinfo/deleteuser",
		 									data:{ 
		 										password:inputpw
		 									},
		 									dataType: "json",
		 									success:function(data){
		 										if(data==0){
		 								 			swal({
		 					 							title:"성공",
		 					 						    text: "삭제 되었습니다. 이용해주셔서 감사합니다",
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
		 					 								window.location.href="../../";
		 					 							}
		 					 						});
		 								 		}
		 									},
		 								});
		 							}
		 						});
					 		}else {
					 			 swal({
			 							title:"실패",
			 						    text: "비밀번호가 맞지않습니다",
			 						    icon: "error",
			 					    	buttons :{
			 						    	confirm:{
			 						    		text:'확인',
			 						    		value:true,
			 						    		className:'btn btn-primary'
			 						    	}
			 						    }
			 						}).then((result) =>{
			 							if(result){
			 								$('.inputpw').focus();
			 							}
			 						});
					 		}
					 	}
					}); 
				});
			});
		</script>
	<%@ include file="../template/mypagemenu2.jspf"%>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>