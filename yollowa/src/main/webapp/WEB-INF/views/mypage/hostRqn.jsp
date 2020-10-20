<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	#radios span {
	    margin-right: 30px;
	    display: inline-block;
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
		$('.sub').click(function(){
			var companyNumber=$('#hostrqn_companyNumber').val();
			var companyName=$('#hostrqn_companyName').val();
			
			if(companyNumber==''||companyName==''){
				swal({
					 	title:'실패',
					    text: '사업자 번호 또는 업소명이 비었습니다.',
					    icon:'error',
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
				
			}
			if(companyNumber!=''&&companyName!=''){
				swal({
				 	title:'성공',
				    text: '신청이 완료 되었습니다',
				    icon:'success',
			    	buttons :{
				    	confirm:{
				    		text:'확인',
				    		value:true,
				    		className:'btn btn-primary'
				    	}
				    }
				}).then((result) =>{
					if(result){
						$('.sub').attr('type','submit');
						$('.sub').trigger("click");
						window.location.href="../mypage/2";
					}
				});
			}
			
		
		})
	});
</script>
</head>
<body>
	<%@ include file="../template/header.jspf"%>
	<%@ include file="../template/menu.jspf"%>
	<%@ include file="../template/mypagemenu1.jspf" %>
			<div class="col-md-9">
				<div class="jumbotron">
					<h3>사업자 여러분을 환영합니다!!</h3>
					<p class="lead">
					${bean.user_name } 씨 함께 할 수 있게 되어 기뻐요.<br/> 
					저희는 ${bean.user_name } 씨와 함께 할 수 있기를 기다리고 있었답니다.<br/>
					그럼 정식으로 파트너 사업주의 권한을 얻기 위해서 다음의 신청 절차를 진행해주세요.
					</p>
					<hr class="my-4">
					<p>
					<h4>신청 방법</h4>
					<p class="lead">
					신청 양식을 작성한 후 신청하기를 누르면 다음 페이지로 넘어갑니다.<br/>
					다음 페이지에서는 신청서 파일을 다운 받으실 수 있습니다.<br/>
					해당 신청서를 작성 후 이메일이나 Fax를 통해 보내주셔야 정식 접수가 됩니다.<br/>
					이메일 : partner@yollowa.com | Fax : 02-6007-0000<br/>
					<br/>
					신청 처리에는 1~3일이 소요됩니다. 파트너 센터: 02-3486-0000
					</p>
					<h4>신청서</h4>
					<form method="post" action="${pageContext.request.contextPath }/mypage/hostRqn/applyed">
						<div class="form-group">
						  <fieldset disabled="disabled">
						    <label class="control-label" for="disabledInput">신청자</label>
						    <input class="form-control" id="disabledInput" type="text" placeholder="신청인을 입력하세요" disabled="disabled" value="${bean.user_name }"/>
						  </fieldset>
						</div>
						<div class="form-group">
							 <label class="control-label" for="disabledInput">유형</label>
							 <div class="custom-control custom-radio" id="radios">
							 	<span>
								   <input type="radio" id="customRadio1" name="hostrqn_info" class="custom-control-input" checked="checked" value="1">
								   <label class="custom-control-label" for="customRadio1">숙박</label>
							    </span>
							 	<span>
								   <input type="radio" id="customRadio2" name="hostrqn_info" class="custom-control-input" value="2">
								   <label class="custom-control-label" for="customRadio2">액티비티</label>
							    </span>
							 </div>
						</div>
						<div class="form-group">
						  <label class="col-form-label" for="hostrqn_companyNumber">사업자 번호</label>
						  <input type="hidden" name="hostrqn_userNo" value="${bean.user_number }" />
						  <input type="text" name="hostrqn_companyNumber" class="form-control" placeholder="사업자 번호를 입력하세요" id="hostrqn_companyNumber">
						</div>
						<div class="form-group">
						  <label class="col-form-label" for="hostrqn_companyName">업소명</label>
						  <input type="text" name="hostrqn_companyName" class="form-control" placeholder="영업소 이름을 입력하세요" id="hostrqn_companyName">
						</div>
						<button type="button" class="btn btn-primary btn-lg sub">신청하기</button>
					</form>
				</div>
			</div>
	<%@ include file="../template/mypagemenu2.jspf" %>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>