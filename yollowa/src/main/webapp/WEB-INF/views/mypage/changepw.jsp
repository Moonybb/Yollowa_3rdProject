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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
</head>
<body>
	<%@ include file="../template/header.jspf"%>
	<%@ include file="../template/menu.jspf"%>
	<%@ include file="../template/mypagemenu1.jspf"%>
	<div class="col-md-9">
		<h2>계정 설정</h2>
		<br>


		<!-- <div class="form-group has-success">
			<label class="form-control-label" for="inputSuccess1">Valid
				input</label> <input type="text" value="correct value"
				class="form-control is-valid" id="inputValid">
			<div class="valid-feedback">Success! You've done it.</div>
		</div>

		<div class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">Invalid
				input</label> <input type="text" value="wrong value"
				class="form-control is-invalid" id="inputInvalid">
			<div class="invalid-feedback">Sorry, that username's taken. Try
				another?</div>
		</div> -->
			<div class="form-group">
				<label class="col-form-label" for="user_password">비밀번호 입력</label> <input
					type="password" class="form-control inputpw"
					placeholder="비밀번호를 입력해주세요" style="width: 25%;">
			</div>
			<button type="submit" class="btn btn-primary button">확인</button>



		<div class="modal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">비밀번호 변경</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>
							변경할 비밀번호&nbsp;<input class="password" type="password" />
						</p>
						<p></p>
						<p>
							비밀번호 재확인&nbsp;<input class="checkpw" type="password" />
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary ok">확인</button>
						<button type="button" class="btn btn-secondary close1"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
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
						url: "${pageContext.request.contextPath}/mypage/userinfo/searchpw",
						data:{ 
							password:inputpw
						},
						dataType: "json",
					 	success:function(data){
					 		if(data==1){
					 			swal({
		 							title:"성공",
		 						    text: "비밀번호 변경 페이지로 이동합니다",
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
							 			$('.modal').show();
		 							}
		 						});
					 			
					 			
					 			console.log(data);
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
				///같은지 체크
				/* $('.checkpw').keyup(function(){
					password=$('.password').val();
	 				checkpw=$('.checkpw').val();
					if(password!=checkpw){
						$('.form-group').attr('class','form-group has-danger');
						$('.inputpw').append('<div class="invalid-feedback">실팬</div>')
						
					}
				}); */
				
				$('.ok').click(function check(){
					password=$('.password').val();
	 				pw=$('.checkpw').val();
	 				 var num = pw.search(/[0-9]/g);
	 				 var eng = pw.search(/[a-z]/ig);
	 				 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	 				if(pw.length < 8 || pw.length > 20){
	 					 swal({
	 							title:"패스워드를 확인해 주세요",
	 						    text: "패스워드는 8자리 ~ 20자리 이내로 입력해주세요.",
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
	 								$('.password').focus();
	 							}
	 						});
	 					  return false;
	 					 }else if(pw.search(/\s/) != -1){
	 						 swal({
	 								title:"패스워드를 확인하세요",
	 							    text: "비밀번호는 공백 없이 입력해주세요.",
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
	 								}
	 							});
	 					  return false;
	 					 }else if(num < 0 || eng < 0 || spe < 0 ){
	 						 swal({
	 								title:"패스워드를 확인하세요",
	 							    text: "영문,숫자, 특수문자를 혼합하여 입력해주세요.",
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
	 								}
	 							});
	 					  return false;
	 					 }else {
	 						if(password==pw){
	 							swal({
	 								title:"성공",
	 							    text: "비밀번호가 변경 되었습니다.",
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
	 									$.ajax({
	 										method:"POST",
	 										url: "${pageContext.request.contextPath}/mypage/userinfo/changepw",
	 										data:{ 
	 											password:password
	 										},
	 										dataType: "text",
	 									 	success:function(data){
	 									 		if(data=="success"){
	 									 			console.log(data);
	 									 			$('.modal').hide();
	 									 			window.location.href="../userinfo";
	 									 		}else console.log('실패');
	 									 	},
	 									}); 
	 								}
	 							});
	 		 				}
					}
				});
 				 
					
				
				$('.close').click(function() {
					$('.password').val('');
					$('.checkpw').val('');
					$('.modal').hide();
				});
				$('.close1').click(function() {
					$('.password').val('');
					$('.checkpw').val('');
					$('.modal').hide();
				});

			});
		</script>
	</div>
	<%@ include file="../template/mypagemenu2.jspf"%>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>