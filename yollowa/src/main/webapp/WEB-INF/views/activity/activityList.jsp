<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../template/head.jspf"%>
<style type="text/css">
/* category start */
.page-header{
	border-bottom: 1px solid lightgray;
	padding-top: 15px;
	padding-bottom: 0px;
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

.custom-control-label{
	display: block;
	margin-bottom: 10px;
}

.custom-control-label:hover {
	background-color: #EEEEED;
	cursor: pointer;
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

/* context start */
.lodgementHref:hover{
	text-decoration: none;
	cursor: pointer;
}
.lodgementHref{
	color:black;
	cursor: pointer;
}
.con{
	padding-top:25px;
}
h3{
	margin-bottom: 30px;
}
.filterDiv{
	margin-bottom:30px;
}
.form-search{
	display: inline-block;	
	/* margin-right:242px; */
}
.search-query{
	width:285px;
	padding : 0px 12px 0px 12px;
	line-height: 28px;
	display: inline-block;
}
.searchBtn{
	line-height: 22px;
	display: inline-block;
}

.sort{
	display:inline-block;
	width:180px;
}
.allList{
	padding: 0px 10px 15px 10px;
}
.oneLodge{
	width:100%;
	border: 1px solid lightgray;
	display: inline-block;
	cursor: pointer;
}
/* .oneLodge:nth-child(3n){
	margin-right:0px;
} */

.lodgeImgBox{
	max-width: 100%;
	max-width: 100%;
	overflow:hidden;
	position: relative;
}
.titleImg{
	max-width: 100%;
	left:0;
	top:0;
	position: relative;
	display:block;
	z-index:1;
	padding: 0;
}
.map{
	background-color:rgba(100,100,100,0.5);
	color:white;
	width:100%;
	z-index:2;
	padding: 0px 5px 0px 5px;
	display:inline-block;
	position: absolute;
	top:167px;
	left:0px;
}
.mapSpan{
	color:white;
	width:100%;
	z-index:2;
	display:inline-block;
	position: absolute;
	top:167px;
	left:0px;
}
.type{
	z-index:2;
	background-color: black;
	color:white;
	display:inline-block;
	padding: 1px 8px 1px 8px;
	position: absolute;
	top:0px;
	left:0px;
}
.sub{
	padding: 0px 10px 6px 10px;
	overflow: hidden;
}
.companyName{
	padding-top: 8px;
	font-size: 16px;
	overflow: hidden;
}
.price{
	padding-top: 20px;
	font-size: 18px;
	font-style: bold;
}
.reviewRate{
	color:#DCA60A;
}
/* context end */

/* dropBox start */
.wrap-drop {
background:#e7ded5;
box-shadow:3px 3px 3px rgba(0,0,0,.2);
cursor:pointer;
width:100%;
float:right;
max-width:225px;
padding:1rem;
position:relative;
z-index:3;
display: inline-block;
line-height: 10px;
}

.wrap-drop::after {
border-color:#695d52 transparent;
border-style:solid;
border-width:10px 10px 0;
content:"";
height:0;
margin-top:-4px;
position:absolute;
right:1rem;
top:50%;
width:0;
}

.wrap-drop .drop {
background:#e7ded5;
box-shadow:3px 3px 3px rgba(0,0,0,.2);
display:none;
left:0;
list-style:none;
margin-top:0;
opacity:0;
padding-left:0;
pointer-events:none;
position:absolute;
right:0;
top:100%;
z-index:2;
}

.wrap-drop .drop li a {
color:#695d52;
display:block;
padding:1rem;
text-decoration:none;
}

.wrap-drop span {
color:#928579;
}

.wrap-drop .drop li:hover a {
background-color:#695d52;
color:#e7ded5;
}

.wrap-drop.active::after {
border-width:0 10px 10px;
}

.wrap-drop.active .drop {
display:block;
opacity:1;
pointer-events:auto;
}
/* dropBox end */


/* 위치 Filter start */
.area_tot{
}
.locSelect{
	display : inline-block;
	margin-bottom: 10px;
}
.locBtn{
	width: 150px;
	margin-top: 10px;
}
.city>li{
	list-style: none;
}
.detailCity>ul>li{
	list-style: none;
}
.bicCity{
}
.bicCity, .detailCity{
	width: 300px;
	border: 1px solid lightgray;
}
.detailCity{
	margin-left: 5px;
}
.locArea{
	position: relative;
	background-color:white;
	opacity: 1;
	margin-left: 0px;
}
.detailCity>ul, .bicCity>ul{
	padding-left: 5px;
}
.detailCity>ul>li, .bicCity>ul>li{
	font-size: 15px;
	margin-top: 15px;
}
.detailCity>ul>li:hover, .bicCity>ul>li:hover{
	color: #E7B648;
	cursor: pointer;
}
#locFilterName{
	padding-bottom: 0px;
	margin-bottom: 0px;
}

/* 위치 Filter end */

</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		var filterCnt = $('#filterCnt').val();
		
		if(filterCnt!=''){
			$('.cntSpan').text(filterCnt);
		}
		
		// Inspiration: https://tympanus.net/codrops/2012/10/04/custom-drop-down-list-styling/

		function DropDown(el) {
		    this.dd = el;
		    this.placeholder = this.dd.children('span');
		    this.opts = this.dd.find('ul.drop li');
		    this.val = '';
		    this.index = -1;
		    this.initEvents();
		}

		DropDown.prototype = {
		    initEvents: function () {
		        var obj = this;
		        obj.dd.on('click', function (e) {
		            e.preventDefault();
		            e.stopPropagation();
		            $(this).toggleClass('active');
		        });
		        obj.opts.on('click', function () {
		            var opt = $(this);
		            obj.val = opt.text();
		            obj.index = opt.index();
		            obj.placeholder.text(obj.val);
		            opt.siblings().removeClass('selected');
		            opt.filter(':contains("' + obj.val + '")').addClass('selected');
		        }).change();
		    },
		    getValue: function () {
		        return this.val;
		    },
		    getIndex: function () {
		        return this.index;
		    }
		};

		$(function () {
		    // create new variable for each menu
		    var dd1 = new DropDown($('#noble-gases'));
		    // var dd2 = new DropDown($('#other-gases'));
		    $(document).click(function () {
		        // close menu on document click
		        $('.wrap-drop').removeClass('active');
		    });
		});
	
		
		<c:forEach items="${listAll}" begin="0" varStatus="num" var="bean">
			if($('.type${num.index}').text()=='outdoor'){
				$('.type${num.index}').text('아웃도어');
			}else if($('.type${num.index}').text()=="bungee"){
				$('.type${num.index}').text('번지점프');
			}else if($('.type${num.index}').text()=="cruise"){
				$('.type${num.index}').text("크루즈");
			}else if($('.type${num.index}').text()=="water"){
				$('.type${num.index}').text("수상 액티비티");
			}else if($('.type${num.index}').text()=="spa"){
				$('.type${num.index}').text("스파&테라피");
			}else if($('.type${num.index}').text()=="nature"){
				$('.type${num.index}').text("자연&테라피");
			}else if($('.type${num.index}').text()=="ski"){
				$('.type${num.index}').text("스키&겨울 스포츠");
			}else if($('.type${num.index}').text()=="kid"){
				$('.type${num.index}').text("키즈 액티비티");
			}
		</c:forEach>

		
		<c:forEach items="${listAll}" begin="0" varStatus="num" var="bean">
			var ln = "activityNumber="+${bean.activity_number};
			
			$.ajax({
				url:"list/priceSelect",
				data:ln,
				dataType:"json",
				type:"post",
				success:function(data){
					$('.price${num.index}').text(data);
					var price = $('.price${num.index}').text().replace(/\B(?=(\d{3})+(?!\d))/g,',');
					$('.price${num.index}').text('￦ '+price);
				}
			});
		</c:forEach>
		
		
		/* 지역 필터 */
		
		// 지역선택 mouseout
		$('.locSelect').mouseout(function(){
			$('.locArea').hide();
		}); 
		
		// area hide - document ready
		$('.locArea').hide();
		
		// detail city도 초기에는 경기 제외 모두 hide
		$('.gapyeong').hide();
		$('.gangwon').hide();
		$('.jeju').hide();
		$('.incheon').hide();
		$('.chungcheong').hide();
		$('.gyeongsang').hide();
		$('.busan').hide();
		$('.jeonla').hide();
		
		// 지역선택 mouseover
		$('.locSelect').mouseover(function(){
			$('.locArea').show();
			
			// 지역마다 mouseover
			// 경기 mouseover
			$('.gyeonggiSel').mouseover(function(){
				$('.gyeonggi').show();
				$('.gapyeong').hide();
				$('.gangwon').hide();
				$('.jeju').hide();
				$('.incheon').hide();
				$('.chungcheong').hide();
				$('.gyeongsang').hide();
				$('.busan').hide();
				$('.jeonla').hide();
			});
			// 가평 mouseover
			$('.gapyeongSel').mouseover(function(){
				$('.gyeonggi').hide();
				$('.gapyeong').show();
				$('.gangwon').hide();
				$('.jeju').hide();
				$('.incheon').hide();
				$('.chungcheong').hide();
				$('.gyeongsang').hide();
				$('.busan').hide();
				$('.jeonla').hide();
			});
			// 강원 mouseover
			$('.gangwonSel').mouseover(function(){
				$('.gyeonggi').hide();
				$('.gapyeong').hide();
				$('.gangwon').show();
				$('.jeju').hide();
				$('.incheon').hide();
				$('.chungcheong').hide();
				$('.gyeongsang').hide();
				$('.busan').hide();
				$('.jeonla').hide();
			});
			// 제주 mouseover
			$('.jejuSel').mouseover(function(){
				$('.gyeonggi').hide();
				$('.gapyeong').hide();
				$('.gangwon').hide();
				$('.jeju').show();
				$('.incheon').hide();
				$('.chungcheong').hide();
				$('.gyeongsang').hide();
				$('.busan').hide();
				$('.jeonla').hide();
			});
			// 인천 mouseover
			$('.incheonSel').mouseover(function(){
				$('.gyeonggi').hide();
				$('.gapyeong').hide();
				$('.gangwon').hide();
				$('.jeju').hide();
				$('.incheon').show();
				$('.chungcheong').hide();
				$('.gyeongsang').hide();
				$('.busan').hide();
				$('.jeonla').hide();
			});
			// 충청 mouseover
			$('.chungcheongSel').mouseover(function(){
				$('.gyeonggi').hide();
				$('.gapyeong').hide();
				$('.gangwon').hide();
				$('.jeju').hide();
				$('.incheon').hide();
				$('.chungcheong').show();
				$('.gyeongsang').hide();
				$('.busan').hide();
				$('.jeonla').hide();
			});
			// 경상 mouseover
			$('.gyeongsangSel').mouseover(function(){
				$('.gyeonggi').hide();
				$('.gapyeong').hide();
				$('.gangwon').hide();
				$('.jeju').hide();
				$('.incheon').hide();
				$('.chungcheong').hide();
				$('.gyeongsang').show();
				$('.busan').hide();
				$('.jeonla').hide();
			});
			// 부산 mouseover
			$('.busanSel').mouseover(function(){
				$('.gyeonggi').hide();
				$('.gapyeong').hide();
				$('.gangwon').hide();
				$('.jeju').hide();
				$('.incheon').hide();
				$('.chungcheong').hide();
				$('.gyeongsang').hide();
				$('.busan').show();
				$('.jeonla').hide();
			});
			// 전라 mouseover
			$('.jeonlaSel').mouseover(function(){
				$('.gyeonggi').hide();
				$('.gapyeong').hide();
				$('.gangwon').hide();
				$('.jeju').hide();
				$('.incheon').hide();
				$('.chungcheong').hide();
				$('.gyeongsang').hide();
				$('.busan').hide();
				$('.jeonla').show();
			});
			
		});

		
		
	});

	// 카테고리 라디오 박스
	function allActivityR(){
		$('.outdoor').show();
		$('.bungee').show();
		$('.cruise').show();
		$('.water').show();
		$('.spa').show();
		$('.nature').show();
		$('.ski').show();
		$('.kid').show();
		
		$('.cntSpan').text($('.allList').length);
	};
	
	function outdoorR(){
		$('.outdoor').show();
		$('.bungee').hide();
		$('.cruise').hide();
		$('.water').hide();
		$('.spa').hide();
		$('.nature').hide();
		$('.ski').hide();
		$('.kid').hide();

		
		$('.cntSpan').text($('.outdoor').length);
	};
	
	
	function bungeeR(){
		$('.outdoor').hide();
		$('.bungee').show();
		$('.cruise').hide();
		$('.water').hide();
		$('.spa').hide();
		$('.nature').hide();
		$('.ski').hide();
		$('.kid').hide();
		
		$('.cntSpan').text($('.bungee').length);
	};
	
	
	function cruiseR(){
		$('.outdoor').hide();
		$('.bungee').hide();
		$('.cruise').show();
		$('.water').hide();
		$('.spa').hide();
		$('.nature').hide();
		$('.ski').hide();
		$('.kid').hide();

		
		$('.cntSpan').text($('.cruise').length);
	};
	function waterR(){
		$('.outdoor').hide();
		$('.bungee').hide();
		$('.cruise').hide();
		$('.water').show();
		$('.spa').hide();
		$('.nature').hide();
		$('.ski').hide();
		$('.kid').hide();

		
		$('.cntSpan').text($('.water').length);
	};
	function spaR(){
		$('.outdoor').hide();
		$('.bungee').hide();
		$('.cruise').hide();
		$('.water').hide();
		$('.spa').show();
		$('.nature').hide();
		$('.ski').hide();
		$('.kid').hide();

		
		$('.cntSpan').text($('.spa').length);
	};
	function natureR(){
		$('.outdoor').hide();
		$('.bungee').hide();
		$('.cruise').hide();
		$('.water').hide();
		$('.spa').hide();
		$('.nature').show();
		$('.ski').hide();
		$('.kid').hide();

		
		$('.cntSpan').text($('.nature').length);
	};
	function skiR(){
		$('.outdoor').hide();
		$('.bungee').hide();
		$('.cruise').hide();
		$('.water').hide();
		$('.spa').hide();
		$('.nature').hide();
		$('.ski').show();
		$('.kid').hide();

		
		$('.cntSpan').text($('.ski').length);
	};
	function kidR(){
		$('.outdoor').hide();
		$('.bungee').hide();
		$('.cruise').hide();
		$('.water').hide();
		$('.spa').hide();
		$('.nature').hide();
		$('.ski').hide();
		$('.kid').show();

		
		$('.cntSpan').text($('.kid').length);
	};
	
	// 관련도 순 선택
	function selectOption(me){
			
		if(($(me).text()=='후기순')){
			var items = $('.reviewCount').get();
			items.sort(function(a,b){
				var aa = $(a).text();
				var bb = $(b).text();
				
				return bb-aa;
			})
			$.each(items, function(idx,ele){
				$('.existShow').append($(ele).parent().parent().parent());
			})
		}else if(($(me).text()=='별점순')){
			var items = $('.reviewRate').get();
			items.sort(function(a,b){
				var Alength = $(a).text().length;
				var aa = $(a).text().substring(1,Alength);
				
				var Blength = $(b).text().length;
				var bb = $(b).text().substring(1,Blength);
				
				return bb-aa;
			});
			$.each(items, function(idx,ele){
				$('.existShow').append($(ele).parent().parent().parent());
			});
			
		}else if(($(me).text()=='가격높은순')){
			var items = $('.price').get();
			items.sort(function(a,b){
				var Alength = $(a).text().length;
				var keyA = $(a).text().substring(2,Alength).replaceAll(",","");
				console.log("A"+keyA);

				var Blength = $(b).text().length;
				var keyB = $(b).text().substring(2,Blength).replaceAll(",","");
				
			    return keyA-keyB;
			});
			$.each(items, function(idx, ele){
				$('.existShow').prepend($(ele).parent().parent().parent());
			});
			
			
		}else if(($(me).text()=='가격낮은순')){
			var items = $('.price').get();
			console.log(items);
			items.sort(function(a,b){
				var Alength = $(a).text().length;
				var keyA = $(a).text().substring(2,Alength).replaceAll(",","");
				console.log("A"+keyA);

				var Blength = $(b).text().length;
				var keyB = $(b).text().substring(2,Blength).replaceAll(",","");
				console.log("B"+keyB);
				
				/* if (keyB > keyA) return 1;
			    if (keyA > keyB) return -1; */
			    
			    console.log("return::"+(keyA-keyB));
			    return keyA-keyB;
			});
			console.log(items);
			
			$.each(items, function(idx, ele){
				$('.existShow').append($(ele).parent().parent().parent());
			});
			
			
		}else if(($(me).text()=='최신순')){
			
			var items = $('.filterLodgeNumber').get();
			items.sort(function(a,b){
				var aa = $(a).text();
				var bb = $(b).text();
				return aa-bb;
			});
			
			$.each(items,function(idx,ele){
				$('.existShow').prepend($(ele).parent().parent());
			});
		}
	};
		
	// 지역선택 function
	function locationFilterSel(me){
		console.log('지역선택 :: '+$(me).text());	
		$('.locBtn').text($(me).text());
		var locationFilter = $(me).text();
		
		window.location.href="./filter?locationFilter="+locationFilter;

		
		/*
		var locationFilter = locationFilter+"="+$(me).text()+;
		
		$.ajax({
			type:"GET",
			url:"list/locationFilter",
			data: locationFilter,
			success:function(data){
					
			};
		}); */
	};
	
	/* function searchFunction(search){
		if(event.keyCode==13){
			var searchVal = 'searchVal='+$(search).val();
			$.ajax({
				type:'GET',
				dataType: 'json',
				url: 'list/lodgementSearch',
				data: searchVal,
				success:function(data){
					console.log('성공'+data);
				},
				error:function(e){
					alert('실패'+e);
				}
			});
		}
	}; */
	
</script>
<meta charset="UTF-8">
<title>액티비티</title>
</head>
<body>
	<%@ include file="../template/header.jspf"%>
	<%@ include file="../template/menu.jspf"%>
	<div class="container">
		<div id="headerUp" class="page-header">
			<p>
				<a href="../">메인 페이지</a> > <a href="list"> 액티비티 페이지</a>
			</p>
			<h1>
				<a class="lodgementHref" href="list">액티비티 <small>Activity</small></a>
			</h1>

		<!-- 위치 filter -->
		<div class="area_tot locSelect">
		<div class="btn btn-primary locBtn">지역 설정</div>
			<div class="locArea row">
				<div class="bicCity col-md-3">
					<ul class="city">
						<li class="gyeonggiSel">경기</li>
						<li class="gapyeongSel">가평</li>
						<li class="gangwonSel">강원</li>
						<li class="jejuSel">제주</li>
						<li class="incheonSel">인천</li>
						<li class="chungcheongSel">충청</li>
						<li class="gyeongsangSel">경상</li>
						<li class="busanSel">부산</li>
						<li class="jeonlaSel">전라</li>
					</ul>
				</div>
				<div class="detailCity col-md-6">
					<ul class="gyeonggi">
						<li onclick="locationFilterSel(this);">경기 전체</li>
						<li onclick="locationFilterSel(this);">양평/용문</li>
						<li onclick="locationFilterSel(this);">포천/연천</li>
						<li onclick="locationFilterSel(this);">남양주/양주/파주</li>
						<li onclick="locationFilterSel(this);">안산/대부</li>
						<li onclick="locationFilterSel(this);">용인/여주/이천</li>
						<li onclick="locationFilterSel(this);">화성/안성</li>
					</ul>
					<ul class="gapyeong">
						<li onclick="locationFilterSel(this);">가평 전체</li>
						<li onclick="locationFilterSel(this);">남이섬/가평읍</li>
						<li onclick="locationFilterSel(this);">아침고요수목원/상면</li>
						<li onclick="locationFilterSel(this);">쁘띠프랑스/청평/설악</li>
						<li onclick="locationFilterSel(this);">명지산/가평북부</li>
					</ul>
					<ul class="gangwon">
						<li onclick="locationFilterSel(this);">강원 전체</li>
						<li onclick="locationFilterSel(this);">경포/강릉</li>
						<li onclick="locationFilterSel(this);">속초/고성</li>
						<li onclick="locationFilterSel(this);">양양</li>
						<li onclick="locationFilterSel(this);">동해/삼척</li>
						<li onclick="locationFilterSel(this);">강촌/춘천</li>
						<li onclick="locationFilterSel(this);">평창/횡성/원주</li>
						<li onclick="locationFilterSel(this);">정선/영월</li>
						<li onclick="locationFilterSel(this);">홍천/인제/화천/철원</li>
					</ul>
					<ul class="jeju">
						<li onclick="locationFilterSel(this);">제주 전체</li>
						<li onclick="locationFilterSel(this);">제주/애월</li>
						<li onclick="locationFilterSel(this);">협재/한림</li>
						<li onclick="locationFilterSel(this);">함덕/월정/구좌</li>
						<li onclick="locationFilterSel(this);">성산/표선/남원</li>
						<li onclick="locationFilterSel(this);">서귀포/중문</li>
						<li onclick="locationFilterSel(this);">산방산/대정</li>
					</ul>
					<ul class="incheon">
						<li onclick="locationFilterSel(this);">인천 전체</li>
						<li onclick="locationFilterSel(this);">영종도/중구/을왕리</li>
						<li onclick="locationFilterSel(this);">강화</li>
						<li onclick="locationFilterSel(this);">옹진/영흥도</li>
					</ul>
					<ul class="chungcheong">
						<li onclick="locationFilterSel(this);">충북 전체</li>
						<li onclick="locationFilterSel(this);">충남 전체</li>
						<li onclick="locationFilterSel(this);">만리포/태안</li>
						<li onclick="locationFilterSel(this);">꽃지/안면도</li>
						<li onclick="locationFilterSel(this);">대천/보령</li>
						<li onclick="locationFilterSel(this);">단양/제천/괴산/충주</li>
						<li onclick="locationFilterSel(this);">서산/예산/아산/서천</li>
						<li onclick="locationFilterSel(this);">공주/보은/청주/금산</li>
					</ul>
					<ul class="gyeongsang">
						<li onclick="locationFilterSel(this);">경북 전체</li>
						<li onclick="locationFilterSel(this);">경남 전체</li>
						<li onclick="locationFilterSel(this);">거제</li>
						<li onclick="locationFilterSel(this);">통영/고성</li>
						<li onclick="locationFilterSel(this);">남해</li>
						<li onclick="locationFilterSel(this);">경주</li>
						<li onclick="locationFilterSel(this);">영덕/울진/포항/울릉도</li>
						<li onclick="locationFilterSel(this);">산청/합천/하동</li>
						<li onclick="locationFilterSel(this);">문경/상주/성주/안동</li>
						<li onclick="locationFilterSel(this);">울산</li>
						<li onclick="locationFilterSel(this);">청도/밀양</li>
						<li onclick="locationFilterSel(this);">김해/양산</li>
					</ul>
					<ul class="busan">
						<li onclick="locationFilterSel(this);">부산 전체</li>
						<li onclick="locationFilterSel(this);">해운대</li>
						<li onclick="locationFilterSel(this);">기장</li>
						<li onclick="locationFilterSel(this);">강서</li>
					</ul>
					<ul class="jeonla">
						<li onclick="locationFilterSel(this);">전북 전체</li>
						<li onclick="locationFilterSel(this);">전남 전체</li>
						<li onclick="locationFilterSel(this);">여수</li>
						<li onclick="locationFilterSel(this);">순천/광양/영광/구례</li>
						<li onclick="locationFilterSel(this);">변산반도/전주/무주</li>
					</ul>
				</div>
			</div>
		</div>

		</div>
		
		<div class="row">
			<div id="category" class="col-md-3">
				<div class="bigList arrowUp">
					<p>종류</p>
					<div class="smallList">
						<div class="custom-control custom-radio">
							<input type="radio" id="allActivity" class="custom-control-input" name="lodList" value="allActivity" checked="checked" onclick="allActivityR();">
							<label class="custom-control-label" for="allActivity">전체</label>
						</div>
						<div class="custom-control custom-radio">
							<input type="radio" id="outdoor" class="custom-control-input" name="lodList" value="outdoor" onclick="outdoorR();">
							<label class="custom-control-label" for="outdoor">아웃도어</label>
						</div>
						<div class="custom-control custom-radio">
							<input type="radio" id="bungee" class="custom-control-input" name="lodList" value="bungee" onclick="bungeeR();">
							<label class="custom-control-label" for="bungee">번지점프</label>
						</div>
						<div class="custom-control custom-radio">
							<input type="radio" id="cruise" class="custom-control-input" name="lodList" value="cruise" onclick="cruiseR();">
							<label class="custom-control-label" for="cruise">크루즈</label>
						</div>
						<div class="custom-control custom-radio">
							<input type="radio" id="water" class="custom-control-input" name="lodList" value="water" onclick="waterR();">
							<label class="custom-control-label" for="water">수상 액티비티</label>
						</div>
						<div class="custom-control custom-radio">
							<input type="radio" id="spa" class="custom-control-input" name="lodList" value="spa" onclick="spaR();">
							<label class="custom-control-label" for="spa">스파&테라피</label>
						</div>
						<div class="custom-control custom-radio">
							<input type="radio" id="nature" class="custom-control-input" name="lodList" value="nature" onclick="natureR();">
							<label class="custom-control-label" for="nature">자연&와일드 라이프</label>
						</div>
						<div class="custom-control custom-radio">
							<input type="radio" id="ski" class="custom-control-input" name="lodList" value="naskiture" onclick="skiR();">
							<label class="custom-control-label" for="ski">스키&겨울 스포츠</label>
						</div>
						<div class="custom-control custom-radio">
							<input type="radio" id="kid" class="custom-control-input" name="lodList" value="kid" onclick="kidR();">
							<label class="custom-control-label" for="kid">키즈 액티비티</label>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-9">
			<div class="con">
				<h3 id="locFilterName">${locationFilter }</h3>
				<h3><span class="cntSpan">${cnt}</span>건의 검색 결과</h3>
				<input type="hidden" id="filterCnt" value="${filterCnt }">
				<div class="row filterDiv">
					<div class="col-md-8">
						  <!-- 검색 form -->
						  <form action="./actiSearch" method="GET" class="form-search">
							<input type="text" id="searchQuery" name="searchQuery" class="form-control search-query" placeholder="검색어를 입력하세요" />
							<button type="submit" class="btn btn-secondary searchBtn">
							  <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
								<path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
							  </svg>
							</button>
						  </form>
					</div>
					<div class="col-md-4">
						<div class="wrap-drop" id="noble-gases">
						    <span>관련도순</span>
						    <ul class="drop">
						        <li><a onclick="selectOption(this);">후기순</a></li>
						        <li><a onclick="selectOption(this);">별점순</a></li>
						        <li><a onclick="selectOption(this);">가격높은순</a></li>
						        <li><a onclick="selectOption(this);">가격낮은순</a></li>
						        <li><a onclick="selectOption(this);">최신순</a></li>
						    </ul>
						</div>
					</div>
				</div>
				
				<div id="lodgeList" class="existShow row">
					<c:forEach items="${listAll}" begin="0" varStatus="num" var="bean"> 
						<div class="${bean.activity_category } allList col-md-4" onclick="location.href='detail/${bean.activity_number}'">
							<div class="oneLodge">
								<div class="lodgeImgBox">
								  <div class="type type${num.index }">${bean.activity_category}</div>
								  <img class="titleImg col-md" style="height:187px;" alt="" src="/activity/titleImg/${bean.activity_img }">
								  <div class="map">
									  <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-geo-alt" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									    <path fill-rule="evenodd" d="M12.166 8.94C12.696 7.867 13 6.862 13 6A5 5 0 0 0 3 6c0 .862.305 1.867.834 2.94.524 1.062 1.234 2.12 1.96 3.07A31.481 31.481 0 0 0 8 14.58l.208-.22a31.493 31.493 0 0 0 1.998-2.35c.726-.95 1.436-2.008 1.96-3.07zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
									    <path fill-rule="evenodd" d="M8 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
									  </svg>
									  <span>${bean.activity_location }</span>
								  </div>
								</div>
								<div class="sub">
								  <div class="companyName">${bean.activity_title}</div>
								  <span class="reviewRate">★${bean.activity_reviewGradeRate} </span><span> (리뷰 </span><span class="reviewCount">${bean.activity_reviewCount}</span><span>건)</span>
								  <div class="price price${num.index }">등록된 방 없음</div>
								</div>
								<div class="filterLodgeNumber" style="display:none;">${bean.activity_number }</div>
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