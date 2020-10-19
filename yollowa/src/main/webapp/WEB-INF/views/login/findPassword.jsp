<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/img/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/resources/fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/resources/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/resources/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/resources/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/resources/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/resources/css/util.css">
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath }/resources/css/main.css">
<!--===============================================================================================-->
<script	src="${pageContext.request.contextPath }/resources/vendor/animsition/js/animsition.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/popper.js"></script>
<script	src="${pageContext.request.contextPath }/resources/vendor/select2/select2.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/vendor/daterangepicker/moment.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/vendor/daterangepicker/daterangepicker.js"></script>
<script	src="${pageContext.request.contextPath }/resources/vendor/countdowntime/countdowntime.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
<%@ include file="../template/head.jspf"%>
<script type="text/javascript"	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"	charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- swal -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
.button {
	width: 191px;
	height: 40px;
}
</style>
<script type="text/javascript">
$("link[rel='shortcut icon']").attr("href", "${pageContext.request.contextPath}/resources/img/icons/favicon.png");
	
	function phoneNumber(){
		var keycode = event.keyCode;
		if((keycode>=48 && keycode<=57) || (keycode>=96 && keycode<=105) || keycode== 8 || keycode== 46){
			if(($("#pn").val().length)>10){
				if(keycode==8 || keycode==46 || keycode==56){
					event.returnValue=true;
				}else{
					event.returnValue=false;
				}
			}
		}else{
			event.returnValue=false;
		}
	};
	
	function find(f){
		var name =$("#n").val();
		var i =$("#i").val();
		var pn = $("#pn").val();
		
		var list ="name="+name+"&id="+i+"&phoneNumber="+pn;
		
		$.ajax({
			data:list,
			type:"post",
			url:"FindPasswordAjax",
			dataType:"json",
			success:function(s){
				
				$.each(s,function(idx,val){
					if(idx=="user_password"){
						swal({
							title:"비밀번호",
							text:val,
							icon:"info",
						}).then((result) =>{
							if(result){
								location.href="./";
							}
						})
					}
					
				});
			},error:function(e){
				swal({
					title:"비밀번호 찾기 실패",
					text:"입력하신 정보가 일치하지않습니다. 다시 확인해주세요.",
					icon:"error",
				})
			}
		});
	}
	 

</script>
</head>
<body>
	<%@ include file="../template/header.jspf"%>
	<%@ include file="../template/menu.jspf"%>
	<div class="limiter" >
		<div class="container-login100"
			style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-01.jpg);">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form" action="${pageContext.request.contextPath }/login/result" method="post">
					<span class="login100-form-title p-b-49" style="font-family: 'MapoPeacefull';"> 비밀번호 찾기 </span>
					<div class="wrap-input100 validate-input m-b-23"
						data-validate="이름을 입력해주세요">
						<span style="font-family: 'MapoPeacefull';" class="label-input100">이름</span> <input style="font-family: 'MapoPeacefull';" class="input100"
							id="n" type="text" name="user_name" placeholder="이름을 입력해주세요"> <span
							class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-23"
						data-validate="아이디를 입력해주세요">
						<span style="font-family: 'MapoPeacefull';" class="label-input100">아이디</span> <input style="font-family: 'MapoPeacefull';" class="input100"
							id="i" type="text" name="user_id" placeholder="아이디를 입력해주세요"> <span
							class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="휴대폰번호를 입력해주세요">
						<span style="font-family: 'MapoPeacefull';" class="label-input100">휴대폰 번호</span> <input class="input100" id="pn" 
							type="text" name="user_phoneNumber" style="font-family: 'MapoPeacefull';" placeholder="숫자만 11자리를 입력해주세요" onkeydown="phoneNumber();">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>

					<div class="text-right p-t-8 p-b-31">
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" type="button" style="font-family: 'MapoPeacefull';" onclick="find(this);">비밀번호 찾기</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>