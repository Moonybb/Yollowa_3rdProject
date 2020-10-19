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
	#sub{
		margin-top:20px;
		margin-bottom:50px;
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
	.btns{
		margin-top: 30px;
		margin-bottom: 20px;
	}
	.btns>p{
		margin-bottom:10px;
		padding-left: 10px;
		border-left: 2px solid #91079F;
	}
	.btns>a{
		margin-left:20px;
	}
	.jumbotron{
		padding-top: 40px;
		padding-bottom: 30px;
	}
</style>
<script type="text/javascript">
$("link[rel='shortcut icon']").attr("href", "${pageContext.request.contextPath}/resources/img/icons/favicon.png");
</script>
</head>
<body>
<%@ include file="../template/header.jspf" %>
<%@ include file="../template/menu.jspf" %>
<div class="container">
	<div class="page-header">
		<p> <a href="../">메인 페이지</a> > 호스트 페이지 </p>
		<h1>호스트 페이지 <small> Host page</small></h1>
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
		<div id="hostInfo">
			<div class="jumbotron">
			  <h1 class="display-4">${userName }님 호스트페이지</h1>
			  <p class="lead">어서오세요, 욜로와 호스트 페이지입니다.</p>
			  <hr class="my-4">
			  <div class="btns">
			  	<p>${userName }님, 본인이 등록하신 글을 확인하세요!</p>	
				<a class="btn btn-outline-warning" id="lodgementBtn" href="lodgement" role="button">본인 숙박 글</a>
				<a class="btn btn-outline-primary" id="activityBtn" href="activity" role="button">본인 액티비티 글</a>
			  </div>
			  <div class="btns">
			  	<p>${userName }님, 지금 바로 본인의 업소를 소개하는 글을 작성해보세요!</p>	
				<a class="btn btn-outline-warning" id="addLodgementBtn" href="ladd" role="button">숙박 글 작성</a>
				<a class="btn btn-outline-primary" id="addActivityBtn" href="aadd" role="button">액티비티 글 작성</a>
			  </div>
			</div>
		</div>		
		</div>
	</div>
</div>
<%@ include file="../template/footer.jspf" %>
</body>
</html>