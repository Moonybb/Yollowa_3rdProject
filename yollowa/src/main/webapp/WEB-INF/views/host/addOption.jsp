<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../template/head.jspf"%>
<style rel="stylesheet" type="text/css">
	/* category start */
	.page-header{
		border-bottom: 1px solid lightgray;
		padding-top: 15px;
		padding-bottom: 25px;
	}
	.page-header>p{
		margin-top: 10px;
		margin-bottom:2px;
	}
	#category{
		border-right: 1px solid lightgray;
	}
	#category>div:first-child{
		margin-top: 30px;
	}
	#category>div{
		margin-bottom: 25px;
		padding-right:15px;
		font-size: 16px;
	}
	.smallList>p:hover {
		background-color: #EEEEED;
		cursor: pointer;
	}
	h2{
		font-size: 35px;
		display: inline-block;
	}
	h4{
		padding-bottom:5px;
		border-bottom: 2px solid lightgray;
	}
	.bigList>p{
		font-size: 18px;
		margin-bottom:5px;
	}
	.smallList{
		margin-left: 15px;
		margin-bottom: 5px;
	}
	.smallList>p {
		margin-bottom:8px;
	}
	.smallList>p>a{
		font-size:15px;
		text-decoration: none;
		display: block;
	}
	#host{
		margin-top: 30px;
		margin-left: 20px;
	}
	#sub{
		font-size:16px;
		margin-top:20px;
		margin-bottom:50px;
	}
	/* category end */
	
	/***************************************************************************************************/

	/* 방 추가등록 start  */
	.form-group, .form-inline{
		margin-bottom:30px;
	}
	.form-group > div{
		margin-left:15px;
	}
	.label_title{
		font-size:18px;
		padding-left: 10px;
		border-left: 2px solid #B167CF;
		margin-top: 10px;
		margin-bottom:10px;
	}
	#form{
		margin-top: 10px;
	}
	.form-group, .form-inline, .col{
		margin-left:15px;
		margin-bottom:30px;
	}
	.form-group > div{
		margin-left:15px;
	}
	.label_title{
		font-size:16px;
	}
	.btnAdd{
		cursor:pointer;
		margin-left:10px;
		margin-bottom:0px;
		text-decoration:none;		
		display: inline-block;
		line-height: 4px;
		border: 0px;
	}
	.btnAdd:hover{
		background-color:#E3A1ED;
	}
	.btnRemove, .roomImgRemove{
		line-height: 8px;
	}
	.oneOption{
		padding:20px 20px 20px 0px;
		margin-bottom:40px;
		border-radius: 5px;
	}
	.roomImg{
		margin-bottom:5px;
	}
	.addOptionBtn{
		background-color: #F0F0F0;
		color: black;
		border:0px;
		margin-bottom:100px;
		line-height: 50px;	
	}
	.col{
		margin-bottom:30px;
	}
	.inputs{
		width:90%;
		margin-left:15px;
	}
	/* 방 추가등록 end  */
</style>
<!-- swal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<script type="text/javascript">

/* 이미지 등록 시 미리보기 기능 */
/* function setThumbnail(event) { 
	var reader = new FileReader();
	reader.onload = function(event) {
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		document.querySelector("div#image_container").appendChild(img);
		}; 
		reader.readAsDataURL(event.target.files[0]); 
	} */ 



//빈 값 체크
function submitClick(){
	var is_empty = false;
	$('#form').find('.inputs').each(function(){
		if(!$(this).val()){
			if(!$('.subNameSelect').val()){
				is_empty = true;
			}
		}
	});
	
	if(is_empty){
		swal("빈칸이 존재합니다", "값을 전부 입력하고 다시 버튼을 클릭하세요", "warning")
	}else{
		swal("정확히 입력하셨습니다!", "액티비티 옵션이 정상적으로 추가되었습니다.", "success");
		setTimeout(function(){
			$('.addOptionBtn').prop('type','submit');
			$('.addOptionBtn').click();
		},1000);
	}
}

</script>
</head>
<body>
	<%@ include file="../template/header.jspf"%>
	<%@ include file="../template/menu.jspf"%>
	<div class="container">
		<div class="page-header">
			<p>
				<a href="../">메인 페이지</a> > 호스트 페이지
			</p>
			<h1>
				호스트 페이지 <small> Host page</small>
			</h1>
			<p>${hostName }님 호스트 페이지 입니다.</p>
			
		</div>
		<div class="row">
			<div id="category" class="col-md-3">
				<div class="bigList">
					<p>호스트 페이지</p>
					<div class="smallList">
						<p><a href="${pageContext.request.contextPath }/host/">호스트 페이지</a></p>
					</div>
				</div>
				<div class="bigList">
					<p>글 보기</p>
					<div class="smallList">
						<p><a href="${pageContext.request.contextPath }/host/lodgement">내가 작성한 숙박 글</a></p>
						<p><a href="${pageContext.request.contextPath }/host/activity">내가 작성한 액티비티 글</a></p>
					</div>
				</div>
				<div class="bigList">
					<p>글 등록하기</p>
					<div class="smallList">
						<p><a href="${pageContext.request.contextPath }/host/ladd">숙박 게시글 등록</a></p>
					</div>
					<div class="smallList">
						<p><a href="${pageContext.request.contextPath }/host/aadd">엑티비티 게시글 등록</a></p>
					</div>
				</div>
			</div>
			<div class="col-md-9">
			<div id="host">
				<h2>액티비티 게시글 옵션 등록</h2>
				<p id="sub">${activity_title } 옵션 등록 페이지 입니다.<br/>아래 내용을 빠짐 없이 입력하고 방추가하기 버튼을 클릭하세요.<p>
				
				<form id="form" action="addOptionAction/${activity_number }" method="post">
				  <h4 class="infoTitle">${activity_title } 옵션 등록하기</h4>
				  
				  <div class="optionBox">
					  <div class="oneOption jumbotron">
						<div class="row">
							<div class="col">
								<label for="activityOption_name" class="label_title">옵션 이름</label>
								<div>
									<input type="text" class="form-control inputs"name="activityOption_name" placeholder="옵션 이름을 입력하세요">
								</div>
							</div>
							<div class="col">
								<label for="activityOption_subName" class="label_title">옵션 종류</label>
								<div>
									<label class="mr-sm-2 sr-only" for="activityOption_subName">Preference</label>
								      <select class="custom-select mr-sm-2 inputs subNameSelect" id="inlineFormCustomSelect" name="activityOption_subName">
								        <option value="" selected>선택하세요</option>
								        <option value="1인">1인</option>
								        <option value="2인">2인</option>
								        <option value="3인">3인</option>
								        <option value="4인">4인</option>
								        <option value="">--------------------------</option>
								        <option value="2시간">2시간</option>
								        <option value="4시간">4시간</option>
								        <option value="6시간">6시간</option>
								        <option value="12시간">12시간</option>
								        <option value="종일권">종일권</option>
								        <option value="">--------------------------</option>
								        <option value="1회">1회</option>
								        <option value="2회">2회</option>
								        <option value="3회">3회</option>
								        <option value="4회">4회</option>
								        <option value="">--------------------------</option>
								        <option value="시즌권">시즌권</option>
								        
								      </select>
								</div>
							</div>
							<div class="col">
								<label for="activityOption_price" class="label_title">옵션 가격</label>
								<div>
									<input type="number" class="form-control inputs" name="activityOption_price" placeholder="옵션 가격 (숫자만)">
								</div>
							</div>
						</div>
					  </div>
				  </div>
				  
				  <div>
				  	<button type="button" class="addOptionBtn btn btn-primary btn-lg btn-block" onclick="submitClick();">옵션 추가하기</button>	
				  </div>
				  
				</form>
			</div>
			</div>
		</div>
	</div>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>