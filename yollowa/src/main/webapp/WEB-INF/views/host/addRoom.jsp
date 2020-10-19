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
	.oneRoom{
		padding:20px 20px 20px 0px;
		margin-bottom:40px;
		border-radius: 5px;
	}
	.roomImg{
		margin-bottom:5px;
	}
	.addRoomBtn{
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

/* 방 추가 */
/* var temp = 1;
function addRoom(){
	temp++;
	var oneRoom;
	oneRoom = '<div class="oneRoom oneRoom'+temp+'">';
	oneRoom += '<div class="roomRemoveDiv">';
	oneRoom += '<a onclick="removeRoom('+temp+')" class="removeRoomBtn btn btn-danger" role="btn">방 삭제</a>';
	oneRoom += '</div>';
	oneRoom += '<div class="form-group">';
	oneRoom += '<label for="roomName'+temp+'" class="label_title">'+temp+'번 방 이름</label>';
	oneRoom += '<div>';
	oneRoom += '<input type="text" class="form-control roomName" name="roomName'+temp+'" placeholder="방 이름을 입력하세요">';
	oneRoom += '</div>';
	oneRoom += '</div>';
	oneRoom += '<div class="form-group">';
	oneRoom += '<label class="label_title" for="roomImg">방 사진 등록</label>';
	oneRoom += '<a onclick="addRoomImg('+temp+')" id="addImgBtn'+temp+'" class="btnAdd btn btn-primary">사진 추가 등록</a>';
	oneRoom += '<p>1장 이상 등록 가능하며, 첫번째 사진은 해당 방 대표사진으로 등록됩니다</p>';
	oneRoom += '<div class="roomImgFile'+temp+'">';
	oneRoom += '<input type="file" class="roomImg" name="roomImg'+temp+'" /><br/>';
	oneRoom += '</div>';
	oneRoom += '</div>';
	oneRoom += '<div class="form-inline">';
	oneRoom += '<label for="peakStartDate1" class="label_title">성수기 시작 날짜</label>';
	oneRoom += '<div>';
	oneRoom += '<input type="date" class="form-control peakStartDate" name="peakStartDate'+temp+'">';
	oneRoom += '</div>';
	oneRoom += '<label for="peakEndDate'+temp+'" class="label_title">성수기 종료 날짜</label>';
	oneRoom += '<div>';
	oneRoom += '<input type="date" class="form-control peakEndDate" name="peakEndDate'+temp+'">';
	oneRoom += '</div>';
	oneRoom += '</div>';
	oneRoom += '<div class="form-inline">';
	oneRoom += '<label for="offPeakPrice'+temp+'" class="label_title">비성수기 가격</label>';
	oneRoom += '<div>';
	oneRoom += '<input type="number" class="form-control offPeakPrice" name="offPeakPrice'+temp+'"> 원';
	oneRoom += '</div>';
	oneRoom += '<label for="peakPrice'+temp+'" class="label_title peakPrice">성수기 가격</label>';
	oneRoom += '<div>';
	oneRoom += '<input type="number" class="form-control peakPrice" name="peakPrice'+temp+'"> 원';
	oneRoom += '</div>';
	oneRoom += '</div>';
	oneRoom += '<div class="form-inline">';
	oneRoom += '<label for="minPeople'+temp+'" class="label_title minPeople">기본 인원</label>';
	oneRoom += '<div>';
	oneRoom += '<select class="form-control" name="minPeople'+temp+'">';
	oneRoom += '<option>2</option>';
	oneRoom += '<option>3</option>';
	oneRoom += '<option>4</option>';
	oneRoom += '<option>5</option>';
	oneRoom += '<option>6</option>';
	oneRoom += '</select>';
	oneRoom += '명';
	oneRoom += '</div>';
	oneRoom += '<label for="maxPeople'+temp+'" class="label_title maxPeople">최대인원</label>';
	oneRoom += '<div>';
	oneRoom += '<select class="form-control" name="maxPeople'+temp+'">';
	oneRoom += '<option>3</option>';
	oneRoom += '<option>4</option>';
	oneRoom += '<option>5</option>';
	oneRoom += '<option>6</option>';
	oneRoom += '<option>7</option>';
	oneRoom += '<option>8</option>';
	oneRoom += '<option>9</option>';
	oneRoom += '<option>10</option>';
	oneRoom += '<option>11</option>';
	oneRoom += '<option>12</option>';
	oneRoom += '<option>13</option>';
	oneRoom += '<option>14</option>';
	oneRoom += '<option>15</option>';
	oneRoom += '<option>16</option>';
	oneRoom += '<option>17</option>';
	oneRoom += '<option>18</option>';
	oneRoom += '<option>19</option>';
	oneRoom += '<option>20</option>';
	oneRoom += '</select>';
	oneRoom += '명';
	oneRoom += '</div>';
	oneRoom += '<label for="extraPrice'+temp+'" class="label_title extraPrice">인원 추가 비용</label>';
	oneRoom += '<div>';
	oneRoom += '<input type="number" class="form-control extraPrice" name="extraPrice'+temp+'" placeholder="1명 추가 기준 가격"> 원';
	oneRoom += '</div>';
	oneRoom += '</div>';
	oneRoom += '</div>';
	
	$('.roomBox').append(oneRoom);
}
 */
 
/* 방 추가된 div class="oneRoom" delete */
/* function removeRoom(temp){
	console.log('oneRoom'+temp+'');
	$('.removeRoomBtn').on('click', function(){
		$('.oneRoom'+temp+'').remove();
	});
} */


/* 방 사진 추가 */
function addRoomImg(){
	$('.roomImgFile').append('<input type="file" class="roomImg" name="roomImg" id="roomImg" />\
							<button onclick="removeRoomImg()" type="button" class="roomImgRemove btn btn-danger">삭제</button><br/>'
	);
}

/* 방 디테일 사진 동적 추가된 input delete method */
function removeRoomImg(){
	$('.roomImgRemove').on('click', function(){
		$(this).prev().remove();
		$(this).next().remove();
		$(this).remove();
	});
};

//빈 값 체크
function submitClick(){
	var is_empty = false;
	$('#form').find('input').each(function(){
		if(!$(this).val()){
			is_empty = true;
		}
	});
	
	if(is_empty){
		swal("빈칸이 존재합니다", "값을 전부 입력하고 다시 버튼을 클릭하세요", "warning")
	}else{
		swal("정확히 입력하셨습니다!", "방이 정상적으로 추가되었습니다.", "success");
		setTimeout(function(){
			$('.addRoomBtn').prop('type','submit');
			$('.addRoomBtn').click();
		},1500);
	}
}
$("link[rel='shortcut icon']").attr("href", "${pageContext.request.contextPath}/resources/img/icons/favicon.png");
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
				<h2>숙박 게시글 등록</h2>
				<p id="sub">${lodgement_companyName } 방 등록 페이지 입니다.<br/>아래 내용을 빠짐 없이 입력하고 방추가하기 버튼을 클릭하세요.<p>
				
				<form id="form" action="addRoomAction/${lodgement_number }" method="post" enctype="multipart/form-data">
				  <h4 class="infoTitle">${lodgement_companyName } 방 등록하기</h4>
				  
				  <div class="roomBox">
					  <div class="oneRoom jumbotron">
					    <div class="form-group">
						  <label for="roomInfo_name" class="label_title">방 이름</label>
						  <div>
						    <input type="text" class="form-control roomName" name="roomInfo_name" placeholder="방 이름을 입력하세요">
						  </div>
					    </div>
	
						<div class="form-group">
					      <label class="label_title" for="roomImg">방 사진 등록</label>
						  <a onclick="addRoomImg()" id="addImgBtn" class="btnAdd btn btn-primary">사진 추가 등록</a>
						  <p>1장 이상 등록 가능하며, 첫번째 사진은 해당 방 대표사진으로 등록됩니다</p>
					      <div class="roomImgFile">
							<input type="file" class="roomImg" name="roomImg" /><br/>
						  </div>
					    </div>
						
					    <div class="row">
					      <div class="col">
						 	 <label for="roomInfo_peakStartDate" class="label_title">성수기 시작 날짜</label>
							  <div>
							    <input type="date" class="form-control inputs" name="roomInfo_peakStartDate">
							  </div>
					      </div>
					      <div class="col">
							  <label for="roomInfo_peakEndDate" class="label_title">성수기 종료 날짜</label>
							  <div>
							    <input type="date" class="form-control inputs" name="roomInfo_peakEndDate">
							  </div>
						  </div>
					    </div>
	
					    <div class="row">
						    <div class="col">
							  <label for="roomInfo_offPeakPrice" class="label_title">비성수기 가격</label>
							  <div>
							    <input type="number" class="form-control inputs" name="roomInfo_offPeakPrice">
							  </div>
						    </div>
						    <div class="col">
							  <label for="roomInfo_peakPrice" class="label_title">성수기 가격</label>
							  <div>
							    <input type="number" class="form-control inputs" name="roomInfo_peakPrice">
							  </div>
						    </div>
						</div>
						  
					    <div class="row">
						    <div class="col">
							  <label for="roomInfo_minPeople" class="label_title">기본 인원</label>
							  <div>
							    <input type="number" class="form-control inputs" name="roomInfo_minPeople">
							  </div>
						    </div>
						    <div class="col">
							  <label for="roomInfo_maxPeople" class="label_title">최대인원</label>
							  <div>
							    <input type="number" class="form-control inputs" name="roomInfo_maxPeople">
							  </div>
							</div>
						    <div class="col">
							  <label for="roomInfo_extraPrice" class="label_title">인원 추가 비용</label>
							  <div>
							    <input type="number" class="form-control inputs" name="roomInfo_extraPrice" placeholder="1명 추가 기준 가격">
							  </div>
						    </div>
					    </div>
					  </div>
				  </div>
				  
				  <div>
				  	<button type="button" class="addRoomBtn btn btn-primary btn-lg btn-block" onclick="submitClick();">방 추가하기</button>	
				  </div>
				  
				</form>
			</div>
			</div>
		</div>
	</div>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>