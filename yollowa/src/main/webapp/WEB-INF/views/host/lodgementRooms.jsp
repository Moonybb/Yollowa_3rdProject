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
		margin-bottom: 20px;
	}
	h4{
		padding-bottom:5px;
		padding-right:10px;
		display: inline-block;
		margin-bottom: 20px;
	}
	#host{
		margin-top: 30px;
		margin-left: 20px;
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
	#sub{
		margin-top:20px;
		margin-bottom:50px;
	}
	/* category end */
	
	/***************************************************************************************************/

	/* 방 리스트 start  */
	.infoTitle{
		margin-bottom: 50px;
	}
	
	.oneRoom{
		padding:20px 20px 0px 0px;
		margin-bottom:40px;
		border-radius: 5px;
	}
	.roomSub{
		padding-right: 15px;
		display:inline-block;
		margin-bottom:10px;
		font-size: 20px;
	} 
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
	.col{
		margin-bottom:30px;
	}
	.inputs{
		width:90%;
		margin-left:15px;
	}
	.roomRemove{
		line-height: 7px;
	}
	
	/* 방 리스트 end  */
</style>

<!-- swal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<script type="text/javascript">
$("link[rel='shortcut icon']").attr("href", "${pageContext.request.contextPath}/resources/img/icons/favicon.png");
$(document).ready(function(){
	
	for(var i=0; i<100; i++){
		// 성수기 시작 날짜 00월 00일
		var startDate = $('.startDate'+i).val().substring(5,10).replaceAll('-','월 ')+'일';
		$('.startDate'+i).val(startDate);
		
		// 성수기 종료 날짜 00월 00일
		var endDate = $('.endDate'+i).val().substring(5,10).replaceAll('-','월 ')+'일';
		$('.endDate'+i).val(endDate);
		
		// 비성수기 가격 000,000원
		var offPeakPrice = $('.offPeakPrice'+i).val().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'원';
		$('.offPeakPrice'+i).val(offPeakPrice);
		
		// 성수기 가격 000,000원
		var peakPrice = $('.peakPrice'+i).val().replace(/\B(?=(\d{3})+(?!\d))/g,',')+'원';
		$('.peakPrice'+i).val(peakPrice);
		
		// 기본인원 0명
		var minPeople = $('.minPeople'+i).val()+"명";
		$('.minPeople'+i).val(minPeople);
		
		// 최대인원 8명
		var maxPeople = $('.maxPeople'+i).val()+"명";
		$('.maxPeople'+i).val(maxPeople);
		
		// 인원 추가비용 000,000원
		var extraPrice = $('.extraPrice'+i).val().replace(/\B(?=(\d{3})+(?!\d))/g,',')+'원';
		$('.extraPrice'+i).val(extraPrice);
		
	}
	
});

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



var alert = function(msg, type) {
	swal({
		title : '',
		text : msg,
		type : type,
		timer : 1500,
		customClass : 'sweet-size',
		showConfirmButton : false
	});
}

var confirm = function(msg, title, resvNum, articleNumber, roomNumber) {
	swal({
		title : title,
		text : msg,
		type : "warning",
		showCancelButton : true,
		confirmButtonClass : "btn-danger",
		confirmButtonText : "예",
		cancelButtonText : "아니오",
		closeOnConfirm : false,
		closeOnCancel : true
	}, function(isConfirm) {
		if (isConfirm) {
			swal('', '방 삭제가 완료되었습니다.', "success");
			
			setTimeout(function(){
				location.href="/yollowa/host/removeRoom/"+articleNumber+"/"+roomNumber;
			},1500);
		}else{
			return false;
		}

	});
}

function Alert() {
	alert('gg', 'success');
}
function Confirm(articleNumber, roomNumber) {
	confirm('해당 방에대한 모든 정보가 삭제됩니다. 그래도 삭제하시겠습니까?', '방을 삭제하시겠습니까?','' ,articleNumber , roomNumber);
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
			<p>${userName }님 호스트 페이지 입니다.</p>
			
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
				<%-- <p id="sub">${lodgement_companyName }에 등록 된 방 현황입니다.<p> --%>
				
				<h4 class="infoTitle">${lodgement_companyName }에 등록된 방 목록</h4>
				<a href="/yollowa/host/addRoom/${lodgement_number }" class="btn btn-outline-success">방 추가하기</a>
				<div class="roomBox">
					
				  <c:forEach items="${roomList }" var="bean" begin="0" varStatus="num">
				    <p class="roomSub">${bean.roomInfo_name }</p>
				    <a class="roomRemove btn btn-outline-danger" onclick="Confirm(${bean.roomInfo_articleNumber },${bean.roomInfo_roomNumber})">방 삭제</a>
				    <div class="oneRoom jumbotron">
					    <%-- <div class="form-group">
						  <label for="roomInfo_name" class="label_title">방 이름</label>
						  <div>
						    <input type="text" class="form-control roomName" value="${bean.roomInfo_name }" readonly/>
						  </div>
					    </div> --%>
	
						<%-- <div class="form-group">
					      <label class="label_title" for="roomImg">등록 된 방 사진</label>
						  <!-- <a onclick="addRoomImg()" id="addImgBtn" class="btnAdd btn btn-primary">사진 추가 등록</a> -->
					      <div class="roomImgFile">
							<input type="text" class="form-control roomImg" value="${bean.roomInfo_img }" readonly />
						  </div>
					    </div> --%>
						
					    <div class="row">
					      <div class="col">
						 	 <label for="roomInfo_peakStartDate" class="label_title">성수기 시작 날짜</label>
							  <div>
							    <input type="text" class="form-control inputs startDate${num.index }" name="roomInfo_peakStartDate" value="${bean.roomInfo_peakStartDate }" readonly />
							  </div>
					      </div>
					      <div class="col">
							  <label for="roomInfo_peakEndDate" class="label_title">성수기 종료 날짜</label>
							  <div>
							    <input type="text" class="form-control inputs endDate${num.index }" name="roomInfo_peakEndDate" value="${bean.roomInfo_peakEndDate }" readonly />
							  </div>
						  </div>
						  <div class="col">
							  <label for="roomInfo_offPeakPrice" class="label_title">비성수기 가격</label>
							  <div>
							    <input type="text" class="form-control inputs offPeakPrice${num.index }" name="roomInfo_offPeakPrice" value="${bean.roomInfo_offPeakPrice }" readonly />
							  </div>
						    </div>
						    <div class="col">
							  <label for="roomInfo_peakPrice" class="label_title">성수기 가격</label>
							  <div>
							    <input type="text" class="form-control inputs peakPrice${num.index }" name="roomInfo_peakPrice" value="${bean.roomInfo_peakPrice }" readonly />
							  </div>
						    </div>
					    </div>
	
					    <div class="row">
						    <div class="col">
							  <label for="roomInfo_minPeople" class="label_title">기본 인원</label>
							  <div>
							    <input type="text" class="form-control inputs minPeople${num.index }" name="roomInfo_minPeople" value="${bean.roomInfo_minPeople }" readonly />
							  </div>
						    </div>
						    <div class="col">
							  <label for="roomInfo_maxPeople" class="label_title">최대 인원</label>
							  <div>
							    <input type="text" class="form-control inputs maxPeople${num.index }" name="roomInfo_maxPeople" value="${bean.roomInfo_maxPeople }" readonly />
							  </div>
							</div>
						    <div class="col">
							  <label for="roomInfo_extraPrice" class="label_title">인원 추가 비용</label>
							  <div>
							    <input type="text" class="form-control inputs extraPrice${num.index }" name="roomInfo_extraPrice" value="${bean.roomInfo_extraPrice }" readonly />
							  </div>
						    </div>
					    </div>
					  </div>
				    </c:forEach>
				</div>
					
			</div>
			</div>
		</div>
	</div>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>