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
	#sub{
		margin-top:20px;
		margin-bottom:50px;
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
	/* category end */
	
	/***************************************************************************************************/
	
	
	/* 기본정보 등록 start */
	#hostWrite{
		margin-top: 30px;
		margin-left: 20px;
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
	.infoTitle{
		margin-top: 40px;
		margin-bottom: 10px;
		padding-bottom: 5px;
		border-bottom: 2px solid lightgray;
	}
	.location{
		width :680px;
		float:left;
	}
	.type_label{
		margin-right:15px;
	}
	#image_container{
		margin-top:20px;
	}
	#image_container>img{
		border-radius:10px;
		margin-right:15px;
		width:120px;
		height:120px;
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
	.btnRemove, .titleImgRemove{
		line-height: 8px;
	}
	.titleImg{
		margin-bottom:5px;
	}
	.hashtag, .notice, .basic_info, .add_people, .service, .refund_info{
		width:705px;
		display:inline-block;
		margin-bottom:10px;
	}
	#submit{
		margin-top:50px;
	}
	
	/* 기본정보 등록 end */

	/***************************************************************************************************/

</style>
<!-- sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- map -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d3d2ea55cf19b317302dd07f8c2c3117&libraries=services"></script>

<script type="text/javascript">

/* 이미지 등록 시 미리보기 기능 */
function setThumbnail(event) { 
	var reader = new FileReader();
	reader.onload = function(event) {
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		document.querySelector("div#image_container").appendChild(img);
		}; 
		reader.readAsDataURL(event.target.files[0]); 
	}

/* 해쉬태그 등록 add input method (name, class ="notice") */
function addInputHashtag(){
	$('.addInputHashtag').append('<input type="text" class="form-control hashtag" name="lodgement_hashTag" />\
							<button onclick="removeInput()" type="button" class="btnRemove btn btn-danger">삭제</button><br/>'
	);
}

/* 공지사항 등록 add input method (name, class ="notice") */
function addInputNotice(){
	$('.addInputNotice').append('<input type="text" class="form-control notice" name="information_notice" />\
							<button onclick="removeInput()" type="button" class="btnRemove btn btn-danger">삭제</button><br/>'
	);
}

/* 기본정보 등록 add input method (name, class ="basic_info") */
function addInputBasicInfo(){
	$('.addInputBasicInfo').append('<input type="text" class="form-control basic_info" name="information_basicInfo" />\
							<button onclick="removeInput()" type="button" class="btnRemove btn btn-danger">삭제</button><br/>'
	);
}

/* 인원 추가정보 등록 add input method (name, class ="basic_info") */
function addInputAddPeople(){
	$('.addInputAddPeople').append('<input type="text" class="form-control add_people" name="information_addPeopleInfo" />\
							<button onclick="removeInput()" type="button" class="btnRemove btn btn-danger">삭제</button><br/>'
	);
}

/* 편의시설 및 서비스 등록 add input method (name, class ="basic_info") */
function addInputService(){
	$('.addInputService').append('<input type="text" class="form-control service" name="information_service" />\
							<button onclick="removeInput()" type="button" class="btnRemove btn btn-danger">삭제</button><br/>'
	);
}

/* 취소 및 환불규정 등록 add input method (name, class ="basic_info") */
function addInputRefundInfo(){
	$('.addInputRefundInfo').append('<input type="text" class="form-control refund_info" name="information_refundInfo" />\
							<button onclick="removeInput()" type="button" class="btnRemove btn btn-danger">삭제</button><br/>'
	);
}


/* 글 타이틀 사진 추가 */
function addTitleImg(){
	$('.titleImgFile').append('<input type="file" class="titleImg" name="titleImg" accept=".jpg, .jpeg, .png, .webp" onchange="setThumbnail(event);"/>\
							<button onclick="removetitleImg()" type="button" class="titleImgRemove btn btn-danger">삭제</button><br/>'
	);
}

/* 글 정보 태그 동적 추가된 input delete method */
function removeInput(){
	$('.btnRemove').on('click', function(){
		$(this).prev().remove();
		$(this).next().remove();
		$(this).remove();
	});
};

/* 타이틀 디테일 사진 동적 추가된 input delete method */
function removetitleImg(){
	$('.titleImgRemove').on('click', function(){
		$(this).prev().remove();
		$(this).next().remove();
		$(this).remove();
	});
};


// 빈 값 체크
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
		swal("모두 정확히 입력하셨습니다", "5초 뒤 승인 요청을 합니다.\n관리자의 승인이 이루어지면 글이 정상적으로 등록됩니다.", "success");
		setTimeout(function(){
			$('.submit').prop('type','submit');
			$('.submit').click();
		},4000);
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
			<div id="hostWrite">
				<h2>숙박 게시글 등록</h2>
				<p id="sub">아래 입력박스들을 모두 기입해야 글 등록이 가능합니다<p>
				
				<form id="form" action="ladd" method="post" enctype="multipart/form-data">
				  <h4 class="infoTitle">기본정보 등록</h4>
				  
				  <div class="form-group">
				  	<label class="label_title" for="lodgement_category">타입</label><br/>
				  	<div>
					  	<label class="radio-inline type_label">
						<input type="radio" name="lodgement_category" id="hotel" value="hotel"> 호텔
						</label>
						<label class="radio-inline type_label">
						<input type="radio" name="lodgement_category" id="motel" value="motel"> 모텔
						</label>
						<label class="radio-inline type_label">
						<input type="radio" name="lodgement_category" id="Pension" value="pension"> 펜션
						</label>
						<label class="radio-inline type_label">
						<input type="radio" name="lodgement_category" id="resort" value="resort"> 리조트/콘도
						</label>
						<label class="radio-inline type_label">
						<input type="radio" name="lodgement_category" id="guest" value="guest"> 게스트하우스
						</label>
					</div>
				  </div>

					<div class="form-group">
						<label for="lodgement_comapanyName" class="label_title">업체명</label>
						<p>계정에 사업자로 등록되어 있는 업체명이 표시되며 선택사항이 존재하지 않으면 글 등록에 제한됩니다</p>
						<div>
							<select name="lodgement_companyName" class="form-control custom-select">
							<option selected>업체명을 선택해 주세요</option>
							<c:forEach items="${companys}" var="companyName">
								<option value="${companyName }">${companyName }</option>
							</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="lodgement_location" class="label_title">위치 등록(도로명 주소)</label><br/>
						<div>		
							<input type="text" class="location form-control" name="lodgement_location" id="sample5_address" placeholder="주소">
							<input type="button" class="btn btn-primary" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
							<input type="hidden" class="Lat" name="lodgement_Lat" value="위도"/>
							<input type="hidden" class="Lng" name="lodgement_Lng" value="경도"/>
							<div id="map" style="width:100%;height:300px;margin-top:10px;display:none"></div>
						</div>
					</div>
					
					<div class="form-group">
				      <label class="label_title" for="lodgement_hashTag">해시태그</label>
					  <a onclick="addInputHashtag()" class="btnAdd btn btn-primary">태그 추가</a>
				      <p>해시태그는 5개까지 등록 가능하며 앞에 '#' 을 붙여서 작성해주세요</p>
				      <div class="addInputHashtag">
				      	<input type="text" class="form-control hashtag" name="lodgement_hashTag" placeholder="#욜로와단독"/><br/>
  					  </div>
				  	</div>

					<div class="form-group">
				      <label class="label_title" for="titleImg">타이틀 사진 등록</label>
					  <a onclick="addTitleImg()" class="btnAdd btn btn-primary">사진 추가 등록</a>
					  <p>꼭 2장 이상 등록 가능하며, 첫번째 사진은 해당 글 대표사진으로 등록됩니다</p>
				      <div class="titleImgFile">
						<input type="file" class="titleImg" name="titleImg" accept=".jpg, .jpeg, .png, .webp" onchange="setThumbnail(event);"/><br/>
						<input type="file" class="titleImg" name="titleImg" accept=".jpg, .jpeg, .png, .webp" onchange="setThumbnail(event);"/><br/>
					  </div>
					  <div id="image_container"></div>
				    </div>

					<div class="form-group">
				    <label class="label_title" for="information_comment">사장님 한마디 등록</label>
				    <div>
					<textarea class="form-control" rows="3" name="information_comment" id="comment" placeholder="손님을 끌어들일 달콤한 멘트를 작성하세요"></textarea>
					</div>
				  </div>

				  <div class="form-group">
				    <label class="label_title" for="information_notice">공지사항 등록</label>
					<a onclick="addInputNotice()" class="btnAdd btn btn-primary" role="btn">태그 추가</a>
				    <div class="addInputNotice">
				    	<input type="text" class="form-control notice" name="information_notice" placeholder="공지사항 정보"/>
					</div>
				  </div>

				  <div class="form-group">
				    <label class="label_title" for="information_basicInfo">기본정보 등록</label>
					<a onclick="addInputBasicInfo()" class="btnAdd btn btn-primary">태그 추가</a>
				    <div class="addInputBasicInfo">
				    	<input type="text" class="form-control basic_info" name="information_basicInfo" placeholder="체크인아웃 정보 및 주차가능 여부 등"/>
					</div>
				  </div>

				  <div class="form-group">
				    <label class="label_title" for="information_addPeopleInfo">인원 추가정보 등록</label>
					<a onclick="addInputAddPeople()" class="btnAdd btn btn-primary">태그 추가</a>
				    <div class="addInputAddPeople">
				    	<input type="text" class="form-control add_people" name="information_addPeopleInfo" placeholder="인원추가 정보"/>
					</div>
				  </div>

				  <div class="form-group">
				    <label class="label_title" for="information_service">편의시설 및 서비스 등록</label>
					<a onclick="addInputService()" class="btnAdd btn btn-primary">태그 추가</a>
				    <div class="addInputService">
				    	<input type="text" class="form-control service" name="information_service" placeholder="편의시설 및 서비스"/>
					</div>
				  </div>

				  <div class="form-group">
				    <label class="label_title" for="information_refundInfo">취소 및 환불규정 등록</label>
					<a onclick="addInputRefundInfo()" class="btnAdd btn btn-primary">태그 추가</a>
				    <div class="addInputRefundInfo">
				    	<input type="text" class="form-control refund_info" name="information_refundInfo" placeholder="취소 및 환불규정"/>
					</div>
				  </div>
				  
				  
				  <button type="button" class="submit btn btn-primary btn-lg btn-block" onclick="submitClick();">글 등록하기</button>				  
				</form>
			</div>
		</div>
		</div>
	</div>
	<%@ include file="../template/footer.jspf"%>
</body>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        
                        $(".Lat").val(coords["Ha"]);
                        $(".Lng").val(coords["Ga"]);
                        
                        
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>

</html>