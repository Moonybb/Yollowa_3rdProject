<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yollowa</title>
	<%@ include file="../template/head.jspf" %>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	 <script type="text/javascript">
	 $("link[rel='shortcut icon']").attr("href", "${pageContext.request.contextPath}/resources/img/icons/favicon.png");
	 </script>
</head>
<body>
	<%@ include file="../template/header.jspf" %>
	<%@ include file="../template/menu.jspf" %>
	<div class="container">
	<!-- naver login -->	
	<div id="naverIdLogin"></div>
			<script type="text/javascript">
			var naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "65ddf9c4a57ddf27e0cf2ac5eaac8af5",
					callbackUrl: "http://localhost:8080/yollowa/login/naver/callback",
					isPopup: false, /* 팝업을 통한 연동처리 여부 */
					loginButton: {color: "green", type: 3, height: 50} /* 로그인 버튼의 타입을 지정 */
				}
			);
			
			/* 설정정보를 초기화하고 연동을 준비 */
			naverLogin.init();
		</script>
	
	<!-- /naver login -->
	<!-- kakao login -->
	<a id="kakao-login-btn">dd</a>
	<script type="text/javascript">
	Kakao.init('fab08af29cefb086ca342c892c7f9a20');
	
	</script>
	<!-- /kakao login -->
	<form action="${pageContext.request.contextPath }/login/result" method="post">
	  <div class="form-group">
	    <label for="user_id">ID : </label>
	    <input type="text" class="form-control" name="user_id" id="user_id" placeholder="아이디를 입력해주세요">
	  </div>
	  <div class="form-group">
	    <label for="user_password">Password</label>
	    <input type="password" class="form-control" id="user_password" name="user_password" placeholder="비밀번호를 입력해주세요">
	  </div>
	  <button type="submit" class="btn btn-primary">로그인</button>
	</form>
			
	</div>
	
	
	<%@ include file="../template/footer.jspf" %>
</body>
</html>