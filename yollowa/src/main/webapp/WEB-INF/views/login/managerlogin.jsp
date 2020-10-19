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
</head>
<body>
	<%@ include file="../template/header.jspf"%>
	<%@ include file="../template/menu.jspf"%>
	<div class="limiter" >
		<div class="container-login100"
			style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-02.jpg);">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form"
					action="${pageContext.request.contextPath }/mlogin/result" 
					method="post">
					<span class="login100-form-title p-b-49" style="font-family: 'MapoPeacefull';"> 매니저 로그인 </span>
					<div class="wrap-input100 validate-input m-b-23" data-validate="아이디를 입력해주세요">
						<span style="font-family: 'MapoPeacefull';" class="label-input100">아이디</span> <input style="font-family: 'MapoPeacefull';" class="input100"
							type="text" name="manager_id" placeholder="아이디를 입력해주세요"> <span
							class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="패스워드를 입력해주세요">
						<span style="font-family: 'MapoPeacefull';" class="label-input100">비밀번호</span> <input class="input100"
							type="password" name="manager_password" style="font-family: 'MapoPeacefull';" placeholder="패스워드를 입력해주세요">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>

					<div class="text-right p-t-8 p-b-31"></div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" style="font-family: 'MapoPeacefull';" >로그인</button>
						</div>
					</div>
<!-- 
					<div class="txt1 text-center p-t-54 p-b-20">
						<span style="font-family: 'MapoPeacefull';" >  </span>
					</div>
					 -->
					<div class="flex-col-c p-t-155">
						<span class="txt1 p-b-17" style="font-family: 'MapoPeacefull';"> 인사과 tel. 02-3485-0001  </span> 
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>