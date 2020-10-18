<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--===============================================================================================-->

<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath }/resources/img/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
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
	href="${pageContext.request.contextPath }/resources/css/joinutil.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/joinmain.css">
<!--===============================================================================================-->

<%@ include file="../template/head.jspf"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.js" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {
		var id = "failed";
		var password = "failed";
		var email = "failed";
		var nickName = "failed";
		var phoneNumber="failed";
		var charlength = 0;
		var roadAddress;
		//$('#roadAddress').val();
		var addressDetail; 
		//$('#addressDetail').val();
		var list = new Array();
		<c:forEach items="${userInfo}" var="user">
		var json = new Object();
		json.userId = "${user.user_id}";
		json.userEmail = "${user.user_email}";
		json.usernickName = "${user.user_nickName}";
		json.userPhoneNumber = "${user.user_phoneNumber}";
		list.push(json);
		</c:forEach>
		
		//영문과 숫자만

		$("#user_id").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));
			}
		});
		$("#user_name").keyup(function(event){
			var pattern = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
			  this.value = this.value.replace(pattern, '');
		});
		
		
		//아이디 검사
		$('.idsearch').on('click', function() {
			var inputId = $('#user_id').val();
			for ( var i in list) {
				if (list[i].userId !== inputId) {
					id = "success";
				} else if (list[i].userId === inputId) {
					id = "failed";
					break;
				}
			}
			if (id === "success" && inputId.length > 4 && !(inputId === '') && inputId.length<20) {
				$('#user_id').attr('readonly', 'readonly');
				id = "success";
				swal({
					title:"성공",
				    text: "사용 가능한 아이디 입니다",
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
						$('#user_password').focus();
					}
				});
			} else {
				id = "failed";
				swal({
					title:"실패",
				    text: "사용 불가능한 아이디 입니다.\n(중복이거나 5자 미만 또는 너무 깁니다)",
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
						$('#user_id').focus();
					}
				});
			}
		});
		///아이디 검사
		
		//닉네임 검사
		$('.nickSearch').on('click',function(){
			var inputNick=$('#user_nickName').val();
			for(var i in list){
				if(list[i].usernickName!==inputNick){
					nickName="success";
				} else if(list[i].usernickName===inputNick){
					nickName="failed";
					break;
				}
			}
			if (nickName === "success" && inputNick.length > 2 && inputNick.length < 20 && !(inputNick === '')) {
				$('#user_nickName').attr('readonly', 'readonly');
				swal({
					title:"성공",
				    text: "사용 가능한 닉네임 입니다",
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
						$('#user_phoneNumber').focus();
					}
				});
			} else {
				nickName = "failed";
				swal({
					title:"실패",
				    text: "사용 불가능한 닉네임 입니다.\n\n(중복이거나 2자미만 또는 너무 깁니다)",
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
						$('#user_nickName').focus();
					}
				});
			}
		});
		$('.phoneSearch').on('click',function(){
			var inputPhone=$('#user_phoneNumber').val();
			for(var i in list){
				console.log(JSON.stringify(list));
				if(list[i].userPhoneNumber!==inputPhone){
					phoneNumber="success";
				} else if(list[i].userPhoneNumber===inputPhone){
					phoneNumber="failed";
					break;
				}
			}
			if (phoneNumber === "success" && inputPhone.length == 11 && !(inputPhone === '')) {
				
				swal({
					title:"성공",
				    text: "사용 가능한 번호 입니다",
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
						$('#user_phoneNumber').attr('readonly', 'readonly');
					}
				});
			} else {
				phoneNumber = "failed";
				swal({
					title:"실패",
				    text: "사용 불가능한 번호 입니다.\n\n(중복이거나 11자 미만 또는 너무 깁니다)",
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
						$('#user_phoneNumber').focus();
					}
				});
			}
		});

		$('.contact100-form-btn').on('click', function() {
			roadAddress=$('#roadAddress').val();
			addressDetail= $('#addressDetail').val();
			var pw = $("#user_password").val();
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
							$('#user_password').focus();
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
								$('#user_password').focus();
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
								$('#user_password').focus();
							}
						});
				  return false;
				 }else {
					 password="success";
				 }
			 if(id==="failed"){
				 swal({
						title:"아이디를 확인하세요",
					    text: "중복 확인 버튼을 눌러주세요",
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
						 $('#user_id').focus();
						}
					});
			 }else if(password==="failed"){
				 swal({
						title:"패스워드를 다시 확인해주세요",
					    text: "패스워드 조건이 맞지 않습니다",
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
						 $('#user_password').focus();
						}
					});
			 }else if(nickName==="failed"){
				 swal({
						title:"닉네임을 확인하세요",
					    text: "닉네임을 다시 확인해주세요",
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
							$('#user_nickName').focus();
						}
					});
			 }else if(phoneNumber==="failed"){
				 swal({
						title:"폰번호를 확인하세요",
					    text: "폰번호를 다시 확인해주세요",
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
							$('#user_phoneNumber').focus();
						}
					});
			 }else if(roadAddress===''){
				 swal({
						title:"도로명 주소를 입력해주세요",
					    text: "주소를 다시 확인해주세요",
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
			 }else if(addressDetail===''){
				 swal({
						title:"상세 주소를 입력해주세요",
					    text: "주소를 다시 확인해주세요",
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
							$('#address')
						}
					});
			 }
			 
			 
			 if(id==="success"&&password==="success"&&nickName==="success"&&phoneNumber==="success"&&addressDetail!='' && addressDetail!=''){
				 
				 swal({
						title:"회원 가입이 완료 되었습니다",
					    icon: "success",
					    closeOnClickOutside:false,
				    	buttons :{
					    	confirm:{
					    		text:'로그인 하러 가기!',
					    		value:true,
					    		className:'btn btn-primary'
					    	}
					    }
					}).then((result) =>{
						if(result){
							$('.contact100-form-btn').attr('type','submit');
							$('.contact100-form-btn').trigger("click");
						}
					});
			 }
		});


	});
</script>
</head>
<body>
	<%@ include file="../template/header.jspf"%>
	<%@ include file="../template/menu.jspf"%>

	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form validate-form" method="post"
				action="${pageContext.request.contextPath }/join/">
				<span class="contact100-form-title"
					style="font-family: 'MapoPeacefull';"> 회원가입
				</span>
				<c:if test="${joinInfo.user_kakaoId ne null}">
					<input type="hidden" name="user_kakaoId"
						value="${joinInfo.user_kakaoId }">
				</c:if>

				<c:if test="${joinInfo.user_naverId ne null}">
					<input type="hidden" name="user_naverId"
						value="${joinInfo.user_naverId }">
				</c:if>

				<div class="wrap-input100 validate-input"
					data-validate="필수 입력사항 입니다.">
					<span class="label-input100" style="font-family: 'MapoPeacefull';">아이디</span>
					<button class="btn btn-primary idsearch" type="button"
						style="margin-left: 5px;">중복 확인</button>
					<input class="input100" type="text" id="user_id" name="user_id"
						style="font-family: 'MapoPeacefull';" placeholder="아이디를 입력해주세요">
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input"
					data-validate="필수 입력사항 입니다.">
					<span class="label-input100" style="font-family: 'MapoPeacefull';">패스워드</span>
					<input class="input100" type="password" id="user_password"
						name="user_password" style="font-family: 'MapoPeacefull';"
						placeholder="패스워드를 입력해주세요"> <span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input"
					data-validate="필수 입력사항 입니다.">
					<span class="label-input100" style="font-family: 'MapoPeacefull';">이름</span>
					<input class="input100" type="text" id="user_name" name="user_name"
						style="font-family: 'MapoPeacefull';" placeholder="이름을 입력해주세요">
					<span class="focus-input100"></span>
				</div>


				<c:if test="${joinInfo eq null }">
					<div class="wrap-input100">
						<span class="label-input100" style="font-family: 'MapoPeacefull';">닉네임</span>
						<button class="btn btn-primary nickSearch" type="button"
							style="margin-left: 5px;">중복 확인</button>
						<input class="input100" type="text" id="user_nickName"
							name="user_nickName" style="font-family: 'MapoPeacefull';"
							placeholder="닉네임을 입력해주세요"> <span class="focus-input100"></span>
					</div>
				</c:if>
				<c:if test="${joinInfo ne null }">
					<div class="wrap-input100">
						<span class="label-input100" style="font-family: 'MapoPeacefull';">닉네임</span>
						<button class="btn btn-primary nickSearch" type="button"
							style="margin-left: 5px;">중복 확인</button>
						<input class="input100" type="text" id="user_nickName"
							name="user_nickName" style="font-family: 'MapoPeacefull';"
							value="${joinInfo.user_nickName }"> <span
							class="focus-input100"></span>
					</div>
				</c:if>
				<div class="wrap-input100">
						<span class="label-input100" style="font-family: 'MapoPeacefull';">폰번호</span>
						<button class="btn btn-primary phoneSearch" type="button"
							style="margin-left: 5px;">중복 확인</button>
						<input class="input100" type="text" id="user_phoneNumber"
							name="user_phoneNumber" style="font-family: 'MapoPeacefull';"
							placeholder="폰번호를 입력해주세요" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"> <span class="focus-input100"></span>
					</div>

				<div class="wrap-input100 input100-select"
					data-validate="필수 입력사항 입니다.">
					<span class="label-input100" style="font-family: 'MapoPeacefull';">성별</span>
					<div>
						<select class="selection-2" name="user_gender">
							<option>남</option>
							<option>여</option>
						</select>
					</div>
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100">
					<span class="label-input100" style="font-family: 'MapoPeacefull';">우편번호</span>
					<input onclick="daumPostcode()" class="btn btn-primary"
						type="button" value="주소 검색" /> <input class="input100"
						type="text" id="roadAddress" name="user_address"
						style="font-family: 'MapoPeacefull';" placeholder="도로명주소" readonly />
					<input class="input100" type="text" id="addressDetail"
						name="addressDetail" style="font-family: 'MapoPeacefull';"
						placeholder="상세주소" /> <span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 input100-select">
					<span class="label-input100" style="font-family: 'MapoPeacefull';">홈페이지
						이용 목적</span>
					<div style="font-family: 'MapoPeacefull';">
						<select class="selection-2" style="font-family: 'MapoPeacefull';"
							name="user_likes">
							<option value="1">액티비티 예약</option>
							<option value="2">숙박 예약</option>
						</select>
					</div>
					<span class="focus-input100"></span>
				</div>

				<!-- <div class="wrap-input100 validate-input" data-validate = "Message is required">
					<span class="label-input100" style="font-family: 'MapoPeacefull';">Message</span>
					<textarea class="input100" name="message" placeholder="Your message here..."></textarea>
					<span class="focus-input100"></span>
				</div> -->

				<div class="container-contact100-form-btn">
					<div class="wrap-contact100-form-btn">
						<div class="contact100-form-bgbtn"></div>
						<button class="contact100-form-btn" type="button">
							<span> 회원가입 </span>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>



	<div id="dropDownSelect1"></div>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function daumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById("roadAddress").value = roadAddr;
					//document.getElementById("jibunAddress").value = data.jibunAddress;
				}
			}).open();
		}
	</script>
	<!--===============================================================================================-->

	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath }/resources/
	vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath }/resources/
	vendor/bootstrap/js/popper.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/
	vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath }/resources/
	vendor/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch : 20,
			dropdownParent : $('#dropDownSelect1')
		});
	</script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath }/resources/
	vendor/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/
	vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath }/resources/
	vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath }/resources/
	js/main.js"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-23581568-13');
	</script>

	<%@ include file="../template/footer.jspf"%>
</body>
</html>