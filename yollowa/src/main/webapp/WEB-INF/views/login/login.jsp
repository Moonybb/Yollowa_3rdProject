<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath }/resources/img/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/util.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/main.css">
<!--===============================================================================================-->
<!--===============================================================================================-->
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/popper.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/resources/vendor/daterangepicker/moment.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath }/resources/vendor/countdowntime/countdowntime.js"></script>
<!--==============================================================================================-->
<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
<%@ include file="../template/head.jspf"%>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<style type="text/css">
.button {
	width: 191px;
	height: 40px;
}

</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript">
	$(function(){
		var failed='${failed}';
		console.log(failed);
		if(failed=="failed"){
			swal({
				title:"실패",
				text:"아이디 또는 비밀번호가 맞지 않습니다",
			    icon: "error",
			    closeOnClickOutside:false,
		    	buttons :{
			    	confirm:{
			    		text:'확인',
			    		value:true,
			    		className:'btn btn-primary'
			    	}
			    }
			}).then((result) =>{
				if(result){
					<% HttpSession session1=request.getSession();
						session1.setAttribute("failed", "");
					%>
				}
			});
		}
	});
</script>
</head>
<body>
	<%@ include file="../template/header.jspf"%>
	<%@ include file="../template/menu.jspf"%>
	<div class="limiter" >
		<div class="container-login100"
			style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-01.jpg);">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form"
					action="${pageContext.request.contextPath }/login/result"
					method="post">
					<span class="login100-form-title p-b-49" style="font-family: 'MapoPeacefull';"> 로그인 </span>
					<div class="wrap-input100 validate-input m-b-23"
						data-validate="아이디를 입력해주세요">
						<span style="font-family: 'MapoPeacefull';" class="label-input100">아이디</span> <input style="font-family: 'MapoPeacefull';" class="input100"
							type="text" name="user_id" placeholder="아이디를 입력해주세요"> <span
							class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="패스워드를 입력해주세요">
						<span style="font-family: 'MapoPeacefull';" class="label-input100">비밀번호</span> <input class="input100"
							type="password" name="user_password" style="font-family: 'MapoPeacefull';" placeholder="패스워드를 입력해주세요">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>

					<div class="text-right p-t-8">
						<a style="font-family: 'MapoPeacefull';text-decoration: underline;" href="FindId">아이디</a> 또는 <a style="font-family: 'MapoPeacefull';text-decoration: underline;" href="Findpassword" >비밀번호</a>를 잊어버리셨나요?
					</div>
					<div class="text-right p-t-8 p-b-31"></div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" style="font-family: 'MapoPeacefull';" >로그인</button>
						</div>
					</div>

					<div class="txt1 text-center p-t-54 p-b-20">
						<span style="font-family: 'MapoPeacefull';" > 소셜 계정으로 로그인 하기 </span>
					</div>

					<div class="flex-c-m">
						<a 
							href="https://kauth.kakao.com/oauth/authorize?client_id=65ddf9c4a57ddf27e0cf2ac5eaac8af5&redirect_uri=http://localhost:8080/yollowa/login/kakao/callback&response_type=code">
							<img style="width: 40px; height: 40px;margin: 10px;"
							src="${pageContext.request.contextPath}/resources/img/kakao.png">
						</a> <a href="${naver_url }" class=""> <img
							style="width: 40px; height: 40px;margin: 10px;"
							src="${pageContext.request.contextPath}/resources/img/naver.PNG">
						</a>
					</div>

					<div class="flex-col-c p-t-155">
						<span class="txt1 p-b-17" style="font-family: 'MapoPeacefull';"> 아이디가 없으신가요? </span> <a href="../join/"
							class="txt2" style="font-family: 'MapoPeacefull';" > 회원 가입 </a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>