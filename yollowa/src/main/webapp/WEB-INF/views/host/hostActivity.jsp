<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../template/head.jspf" %>
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
	#hostInfo{
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
	h2{
		font-size: 35px;
	}
	/* category end */
	
	
	/* content start */
	.list{
		margin-left:20px;
		padding-top:20px;
		padding-bottom:25px;
	}
	#sub{
		margin-top:20px;
		margin-bottom:50px;
	}
	h4{
		padding-bottom:5px;
		border-bottom: 2px solid lightgray;
	}
	h5{
		color: #7F23A4;
		padding : 3px 0px 3px 10px;
		margin-top: 20px;
		margin-bottom:25px;
		margin-right: 20px;
		display:inline-block;
		border-left: 2px solid #B167CF;
	}
	.title{
		display:inline-block;
		padding-top:3px;
		padding-bottom:3px;
		border-right: 2px solid lightgray;
		width: 150px;
		line-height: 30px;
		margin-bottom:15px;
	}
	.inputCon{
		display:inline-block;
		margin-left: 20px;
	}
	.form-control{
		display:inline-block;
		width:630px;
	}
	.btns{
		text-align: right;
	}
	.btn-outline-primary{
		margin-right:10px;
	}
	.btn-outline-danger{
		margin-left:5px;
	}
	.imgInput{
		
	}
	.titleImgFile{
		display: inline-block;
	}
	.btnAdd{
		width:120px;
		hight: 500px;
		cursor:pointer;
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
		margin-left:5px;
	}
	#location{
		display: inline-block;
	}
	.inputHash{
		width:545px;
	}
	.sub{
		font-size:17px;
		margin-top: 15px;
		color:#7F23A4;
	}
	/* .list{
		height: 250px;
		border-bottom: 1px solid lightgray;
		margin-left: 50px;
		padding-top: 20px;
		padding-bottom: 25px;
	}
	.list>img{
		width: 260px;
		height: 200px;
		overflow: hidden;
		float: left;
		margin-right: 30px;
	}
	.listContent>p{
		margin-bottom:10px;
	}
	.listContent>h4{
		margin-bottom: 20px;
	}
	.listContent>.hashtag{
		margin-bottom:0px;
		color:gray;
	}
	.modify>a{
		color: #1660A1;
	}
	.delete>a{
		color: #B81616;
	}
	.modify, .delete{
		display: inline-block;
		margin-top: 10px;
		margin-right: 20px;
	} */
	
</style>
<!-- swal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript">
	$(document).ready(function(){
		if($('.temp').val()==0){
			$('.temp').val("관리자 승인이 대기중인 글입니다");
		}else if($('.temp').val()==1){
			$('.temp').val("관리자 승인이 완료된 글입니다. 정상적으로 등록이 완료되었습니다.")
		}
		
		/* if($('.type').val()=='hotel'){
			$('.type').val('호텔');
		}else if($('.type').val()=='motel'){
			$('.type').val('모텔');
		}else if($('.type').val()=='pension'){
			$('.type').val('펜션');
		} */
		
		var jumbo = '<div class="jumbotron">';
		jumbo+='<h1 class="display-6">등록된 액티비티 게시글이 존재하지 않습니다.</h1>';
		jumbo+='<hr class="my-4">';
		jumbo+='<p class="lead">욜로와에 자신의 액티비티업소에 대한 글 작성하기!</p>';
		jumbo+='<a class="btn btn-primary" href="aadd" role="button">액티비티 게시글 등록</a>';
		jumbo+='</div>';
		
		if($('.inputCon').val()==null){
			$('#hostInfo').append(jumbo);
		}
		$('.activityModifySuc').hide();
		
	});
	
	/* 수정 버튼 클릭 이벤트 */
	function modiClick(a){
		swal("주의사항", "- 사진은 꼭 2장 이상 등록해야 합니다\n\n- 타이틀 이미지의 첫번째 사진이 대표사진으로 설정됩니다\n\n- 해시태그와 사진 이외의 요소는 수정이 불가능합니다", "warning");
		
		var number = $(a).next().val();
		console.log("숙박글 번호"+number);
		$('.activityModifySuc').show();
		if($(a).val()=='수정'){
			$('.activityModifyEl'+number).attr('readonly', false);
			$(a).val('수정 완료');
			$(a).remove();
			
			/* $(a).attr('type','submit'); */
			/* $('.list'+number).prepend('<form id="form" action="lodgeUpdate/${number  }" method="post" enctype="multipart/form-data">');
			$('.list'+number).append('</form>'); */
			
			var divNum = number-1;
			
			// 클래스의 마지막이 0 인 것들은 속성변화
			$('.imgInput'+number+0).prev().text('타이틀 사진 등록');
			$('.imgInput'+number+0).attr('type','file');
			$('.imgInput'+number+0).attr('accept','.jpg, .jpeg, .png, .webp');
			$('.imgInput'+number+0).css('width','610px');
			$('.imgInput'+number+0).removeClass('form-control');
			$('.imgDiv'+number).append('<a onclick="addTitleImg('+number+')" class="btnAdd btn btn-primary">사진추가 버튼</a>');	
			$('.inputCon').css('margin-left','15px');
			
			// 타이틀 사진은 두장 이상 등록해야 하기 때문에 추가 버튼을 한번 눌러줌
			$('.btnAdd').click();
			$('.titleImgRemove').remove();
			
			
			// 클래스의 마지막이 1 이상인 것들은 삭제
			for(var i=1; i<100; i++){
				$('.imgInput'+number+i).prev().remove();
				$('.imgInput'+number+i).remove();
			}

			/* 해시태그 동적 변환 (순서 조심)*/
			$('.hashInput'+number+0).prev().text('해시태그 등록');
			$('.hashInput'+number+0).val('');
			$('.hashDiv'+number).append('<a onclick="addInputHashtag('+number+')" class="btnAdd btn btn-primary">태그추가 버튼</a>');	
			
			for(var i=1; i<100; i++){
				$('.hashInput'+number+i).prev().remove();
				$('.hashInput'+number+i).remove();
			}
			
			/* 위치 수정 
			var location = '<input type="text" class="location'+number+' form-control" name="lodgement_location" id="sample5_address" placeholder="주소">';
			location += '<input type="button" class="btn btn-primary" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>';
			location += '<div id="map" style="width:100%;height:300px;margin-top:10px;display:none"></div>';
			
			$('.location'+number).prev().text('위치 등록');
			
			$('.loc'+number).remove();
			$('.location'+number).append(location);
			$('#sample5_address').css('width','520px');
			$('#sample5_address').css('margin-left','15px');
			$('#sample5_address').css('margin-right','10px'); */
			
			
		}
	}
	
	// 수정완료 버튼 클릭 이벤트
	function modiSucClick(){
		var is_empty = false;
		$('.inputCon').each(function(){
			if(!$(this).val()){
				is_empty = true;
			}
		});
		
		if(is_empty){
			swal("빈칸이 존재합니다", "값을 전부 입력하고 다시 버튼을 클릭하세요", "warning")
		}else{
			$(this).click(function(){
				if(confirm("정말로 수정하시겠습니까?")==true){
					alert("수정되었습니다");
				}else{
					return;
				}
			});
		}
	}
	
	/* 글 타이틀 사진 추가 */
	function addTitleImg(activityNumber){
		$('.titleImgFile'+activityNumber).append('<div class="title">타이틀 사진 등록</div><input type="file" id="titleImg" class="inputCon" name="titleImg" value="${requestScope[titleName] }" />\
								<button onclick="removetitleImg()" type="button" class="titleImgRemove btn btn-danger">삭제</button><br/>'
		);
	}

	/* 해쉬태그 등록 add input method (name, class ="notice") */
	function addInputHashtag(activityNumber){
		$('.hashBox'+activityNumber).append('<div class="title hashDiv${num.index }">해시태그 등록</div><input type="text" class="inputCon inputHash form-control" name="activity_hashTag" value="${requestScope[hashTagName] }" />\
								<button onclick="removeInput()" type="button" class="btnRemove btn btn-danger">삭제</button><br/>'
		);
	}
	
	/* 타이틀 디테일 사진 동적 추가된 input delete method */
	function removetitleImg(){
		$('.titleImgRemove').on('click', function(){
			$(this).prev().remove();
			$(this).prev().remove();
			$(this).next().remove();
			$(this).remove();
		});
	};
	
	/* 글 정보 태그 동적 추가된 input delete method */
	function removeInput(){
		$('.btnRemove').on('click', function(){
			$(this).prev().remove();
			$(this).prev().remove();
			$(this).next().remove();
			$(this).remove();
		});
	};
	
	/* 삭제버튼 클릭 */
	var confirm = function(msg, title, resvNum, number) {
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
			swal('', '옵션 삭제가 완료되었습니다.', "success");
			
			setTimeout(function(){
				location.href="/yollowa/host/activityDelete/"+number;
			},1000);
		}else{
			return false;
		}

	});
}

function Confirm(number) {
	confirm('해당 액티비티에 대한 옵션 정보까지 함께 삭제됩니다.', '글을 정말 삭제하시겠습니까?','' ,number);
}
	
</script>
</head>
<body>
<%@ include file="../template/header.jspf" %>
<%@ include file="../template/menu.jspf" %>
<div class="container">
	<div class="page-header">
		<p> <a href="../">메인 페이지</a> > 호스트 페이지 </p>
		<h1>호스트 페이지 <small> Host page</small></h1>
		<p>${userVo.user_name }님 호스트 페이지 입니다.</p>
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
		<div id="hostInfo">
			<h2>나의 글 정보</h2>
			<p id="sub">- 사업자께서 등록하신 욜로와 글 등록 정보입니다.<br/>- 본인의 작성 글의 정보를 확인할 수 있으며 옵션등록이 가능합니다.</p>
			<h4>액티비티 게시글 정보</h4>
			<c:forEach items="${activityList }" begin="0" varStatus="num" var="bean">
			
			<input type="hidden" id="imgPath" value="${path }"></input>
			
			<div class="activityBox">
				<h5>${bean.activity_title }</h5>
				<a href="/yollowa/activity/detail/${bean.activity_number }" class="btn btn-outline-primary">상세 페이지로 이동</a>
				<a href="activityOptions/${bean.activity_number }" class="btn btn-outline-success">옵션 등록 현황</a><br/>
				<div class="list${bean.activity_number }">
						
					<form id="form" action="activityUpdate/${bean.activity_number  }" method="post" enctype="multipart/form-data">
							
					<div class="title">업체명</div>
					<input type="text" class="inputCon form-control" name="activity_companyName" value="${bean.activity_title }" readonly="readonly"/>

					<div class="title">타입</div>
					<input type="text" class="inputCon type form-control" value="${bean.activity_category }" readonly="readonly"/>
										
					<div class="titleImgFile${bean.activity_number  }">
						<div class="title imgDiv${bean.activity_number  }">대표 이미지</div>
						<c:set var="sizeNumber" value="titleImgSize${num.index }" ></c:set>
						<c:forEach begin="0" end="${requestScope[sizeNumber]-1 }" varStatus="number">
						
							<c:set var="titleName" value="imgName${num.index }${number.index }"></c:set>
							<c:if test="${0 ne number.index }">
								<div class="title">디테일 이미지 ${number.index }</div>
							</c:if>
							<input type="text" id="titleImg" class="imgInput${bean.activity_number }${number.index } inputCon form-control activityModifyEl${bean.activity_number }" name="titleImg" value="${requestScope[titleName] }"  readonly="readonly" />
						</c:forEach>
							
					</div>
					
					<div class="title">위치</div>
					<input type="text" class="inputCon form-control" name="activity_location" value="${bean.activity_location }"  readonly="readonly"/>
					<div class="hashBox${bean.activity_number }">

					<div class="title hashDiv${bean.activity_number }">해시태그</div>
					<c:set var="hashTagSize" value="hashTagSize${num.index }"></c:set>
					<c:forEach begin="0" end="${requestScope[hashTagSize]-1 }" varStatus="number">
						<c:set var="hashTagName" value="hashTag${num.index }${number.index }"></c:set>
						<c:if test="${0 ne number.index }">
							<div class="title">해시태그${number.index+1 }</div>
						</c:if>
						<input type="text" class="hashInput${bean.activity_number }${number.index } inputCon form-control activityModifyEl${bean.activity_number }" name="activity_hashTag" value="${requestScope[hashTagName] }"  readonly="readonly"/>
					</c:forEach>
					</div>
					<div class="title">후기 수</div>
					<input type="text" class="inputCon form-control" value="${bean.activity_reviewCount }"  readonly="readonly" />
					<div class="title">좋아요 수</div>
					<input type="text" class="inputCon form-control" value="${bean.activity_goodCount }"  readonly="readonly" />
					<div class="title">평점</div>
					<input type="text" class="inputCon form-control" value="${bean.activity_reviewGradeRate }"  readonly="readonly" />
					<div class="title">글 등록 현황</div>
					<input type="text" class="inputCon temp form-control" value="${bean.activity_temp }"  readonly="readonly" />
					
					<div class="btns">
						<input type="button" class="btn btn-outline-warning activityModify${bean.activity_number }" onclick="modiClick(this);" value="수정"></input>
						<input type="hidden" value="${bean.activity_number }"></input>
						<button type="submit" class="btn btn-outline-warning activityModifySuc">수정 완료</button>
						<a class="removeBtn btn btn-outline-danger" onclick="Confirm(${bean.activity_number });">삭제</a>
					</div>
					
				</form>

				</div>
			</div>
			</c:forEach>
			
		</div>		
		</div>
	</div>
</div>
<%@ include file="../template/footer.jspf" %>
</body>
</html>