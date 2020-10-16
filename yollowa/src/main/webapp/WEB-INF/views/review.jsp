<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<%@ include file="template/head.jspf"%>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="../../resources/css/fontawesome-stars.css">

<style type="text/css">
 form{
	border: 1px solid;
	margin-top: 100px;
	padding: 20px;
	border-radius: 5px;
} 
form>h2{
	text-align: center;
}
#writer{
	border: none;
	background-color: white;
}
#info1,#info2,#info3,#info4{
	border: none;
	background-color: white;
}
</style>
<meta charset="UTF-8">
<script type="text/javascript" src="../../resources/js/jquery.barrating.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.js" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript">
	$(function() {
		 $('#starPoint').barrating({
		        theme: 'fontawesome-stars'
		      });
		 $('#formbtn').on('click',function(){
			var title=$('#title').val();
			var content=$('.content').val();
			if(title.length<4 || title.length>20){
				swal({
					title:"실패",
					text:"리뷰 제목은 4자 이상 20자 이하로 입력 해야 합니다.",
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
						$('#title').focus();
					}
				});
			}else if(content.length<5){
				swal({
					title:"실패",
					text:"리뷰 내용은 5자 이상 입력해야 합니다.",
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
						$('#content').focus();
					}
				});
			}
			
			if(title.length>=4&&title.length<20&&content.length>=5){
				
			
			 swal({
					title:"리뷰가 작성 되었습니다!!",
				    icon: "success",
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
						 $('#formbtn').attr('type','submit');
						 $('#formbtn').trigger('click');	
					}
				});
			}
		 });
	});
</script>
<title>리뷰 쓰기</title>
</head>

<body>
	<%@ include file="template/header.jspf"%>
	<%@ include file="template/menu.jspf"%>

	<div class="container">
	
	<!-- 받아온 값으로 숙박인지 액티비티인지 넣어주기 -->
		<c:if test="${service eq 2 }">
		<form action="${pageContext.request.contextPath }/review_write/${service}" method="post">
		<h2>숙박 리뷰 쓰기</h2>
		<input type="hidden" name="review_articleNumber" value="${reviewInfo.lReservInfo_acticleNumber }">
		<input type="hidden" name="review_reservNumber" value="${reviewInfo.lReservInfo_number }">
		<input type="hidden" name="review_category" value="${service }">
		
			<div class="form-group row">
				<label for="lodgement_companyName" class="col-sm-2 col-form-label">숙소 정보</label>
				<div class="col-sm-10">
					<input type="text" id="info1" class="form-control" value="${reviewInfo.lodgement_companyName }" readonly>
				</div>
				<label for="roomInfo_name" class="col-sm-2 col-form-label">방 정보</label>
				<div class="col-sm-10">
					<input type="text" id="info2" class="form-control" value="${reviewInfo.roomInfo_name }" readonly>
				</div>
				<label for="lReservInfo_payment" class="col-sm-2 col-form-label">결제 금액</label>
				<div class="col-sm-10">
					<input type="text" id="info2" class="form-control" value="${reviewInfo.lReservInfo_payment }" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label for="" class="col-sm-2 col-form-label">닉네임</label>
				<div class="col-sm-10">
					<input type="text" id="writer" class="form-control" name="review_writer" value="${user.user_nickName }" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label for="title" class="col-sm-2 col-form-label">제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="title" name="review_title" >
				</div>
			</div>
			<div class="form-group row">
				<label for="star" class="col-sm-2 col-form-label">별점</label>
				<div class="col-sm-10">
				<select class="form-control form-control-lg" id="starPoint" name="review_starPoint">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				</div>
			</div>
			
			<div class="form-group row">
			    <label for="contents" class="col-sm-2 col-form-label">리뷰 내용</label>
				<div class="col-sm-10">			   
			    <textarea class="form-control content"  name="review_content" rows="5" style="resize: none;" placeholder="바른 후기를 써주시기 바랍니다(5자 이상)"></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-12" style="text-align: center;">
					<button type="button" class="btn btn-primary">작성하기</button>
				</div>
			</div>
		</form>
		</c:if>
		<c:if test="${service eq 1 }">
		<form action="${pageContext.request.contextPath }/review_write/${service}" method="post">
		<input type="hidden" name="review_articleNumber" value="${reviewInfo.aReservInfo_articleNumber }">
		<input type="hidden" name="review_reservNumber" value="${reviewInfo.aReservInfo_number }">
		<input type="hidden" name="review_category" value="${service }">
		<h2>액티비티 리뷰 쓰기</h2>
		
			<div class="form-group row">
				<label for="lodgement_companyName" class="col-sm-2 col-form-label">액티비티 정보</label>
				<div class="col-sm-10">
					<input type="text" id="info1" class="form-control" value="${reviewInfo.activity_title }" readonly>
				</div>
				<label for="activityOption_name" class="col-sm-2 col-form-label">옵션 정보</label>
				<div class="col-sm-10">
					<input type="text" id="info2" class="form-control" value="${reviewInfo.activityOption_name }" readonly>
				</div>
				<label for="activityOption_subName" class="col-sm-2 col-form-label">세부 내용</label>
				<div class="col-sm-10">
					<input type="text" id="info3" class="form-control" value="${reviewInfo.activityOption_subName }" readonly>
				</div>
				<label for="lReservInfo_payment" class="col-sm-2 col-form-label">결제 금액</label>
				<div class="col-sm-10">
					<input type="text" id="info4" class="form-control" value="${reviewInfo.aReservInfo_payment }" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label for="" class="col-sm-2 col-form-label">닉네임</label>
				<div class="col-sm-10">
					<input type="text" id="writer" class="form-control" name="review_writer" value="${user.user_nickName }" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label for="title" class="col-sm-2 col-form-label">제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="title" name="review_title" >
				</div>
			</div>
			<div class="form-group row">
				<label for="star" class="col-sm-2 col-form-label">별점</label>
				<div class="col-sm-10">
				<select class="form-control form-control-lg" id="starPoint" name="review_starPoint">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				</div>
			</div>
			
			<div class="form-group row">
			    <label for="contents" class="col-sm-2 col-form-label">리뷰 내용</label>
				<div class="col-sm-10">			   
			    <textarea class="form-control content" name="review_content" rows="5" style="resize: none;" placeholder="바른 후기를 써주시기 바랍니다(5자 이상)"></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-12" style="text-align: center;">
					<button type="button" id="formbtn" class="btn btn-primary">작성하기</button>
				</div>
			</div>
		</form>
		</c:if>
	</div>
	
	<%@ include file="template/footer.jspf"%>

</body>
</html>