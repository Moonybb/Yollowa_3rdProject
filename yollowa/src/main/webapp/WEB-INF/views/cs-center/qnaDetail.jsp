<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../template/head.jspf" %>

<script src="${pageContext.request.contextPath}/resources/js/ckeditor/ckeditor.js"></script>
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
		margin-top: 50px;
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
	/* category end */
		
	/* content start */
	.box1 {
		margin: 32px auto 10px auto;
		display: flex;
		position: relative;
	}
	#titleLabel{
		width: 8%;
 	 	font-size: 20px;
 		text-align: center;
	}
	#titleInput{
	}
	.box3 {
		text-align: left;
		margin-top: 10px;
		margin-bottom: 20px;
	}
	.mb-3{
    	margin-bottom: 0.2rem !important;
	}
	div#contentBox {
		margin-top: 30px;
    	margin-bottom: 20px !important;
	}	
	#replyBox{
		margin: 2px auto 20px auto;
		display: flex;
	}
	#replyText{
		resize: none;
	}
	#replyText2{
		height: 150px;	
		resize: none;
	}
	span#cke_1_top {
	    display: none !important;
	}
	span#cke_1_bottom {
    	display: none;
	}
	button.btn.btn-outline-primary {
        height: 26.22222px;
	    padding-top: 3px;
	    padding-bottom: 3px;
	}	
	#replyBtnBox{
		text-align: right;
	}
	/* content end */
		
</style>
<script type="text/javascript">
$("link[rel='shortcut icon']").attr("href", "${pageContext.request.contextPath}/resources/img/icons/favicon.png");
	$(document).ready(function() {
		CKEDITOR.replace('replyText', {toolbar: [
            { name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo']},
           {name: 'editing', items: ['Format', 'Font', 'FontSize', 'TextColor', 'BGColor' , 'Bold', 'Italic', 'Underline', 'Strike', '-', 'RemoveFormat'] }
       ],
       	width:'900px'
		});
		
	});
	
</script>
</head>
<body>
<%@ include file="../template/header.jspf" %>
<%@ include file="../template/menu.jspf" %>
<div class="container">
	<div class="page-header">
		<p> <a href="../">메인 페이지</a> > 고객센터 > Q&amp;A </p>
		<h1>Q&amp;A <small> 이 곳은 고객님들의 질문에 답변해드리는 공간입니다.</small></h1>
	</div>
	<div class="row">
		<div id="category" class="col-md-2">
				<div class="bigList">
					<p>고객센터</p>
					<div class="smallList">
						<p><a href="${pageContext.request.contextPath }/cs-center/notice/">공지사항</a></p>
					</div>
					<div class="smallList">
						<p><a href="${pageContext.request.contextPath }/cs-center/faq/">FAQ</a></p>
					</div>
					<div class="smallList">
						<p><a href="${pageContext.request.contextPath }/cs-center/qna/">Q&amp;A</a></p>
					</div>
				</div>
		</div>
		<div class="col-md-10">
			<div class="card border-light mb-3" id="contentBox">
				<div class="card-header" id="title"><h1>${bean.title }</h1>
					<div class="row">
						<div class="col-md-4">
						<span id="writer">작성자 | ${bean.writer }</span>
						</div>
						<div class="col-md-5">
						<span id="date">작성일 | ${bean.writeddate }</span>
						</div>
						<div class="col-md-3">
						</div>
					</div>
				</div>
				<div class="card-body">
					<p class="card-text">${bean.content }</p>
				</div>
			</div>
			<c:forEach items="${reply }" var="reply">
			<div  class="card border-secondary mb-3">
				<div class="card-header">
					<div class="row">
						<div class="col-md-2">작성자: ${reply.replyWriter }</div>
						<div class="col-md-3">작성일: ${reply.updateDate }</div>
						<div class="col-md-1"></div>
						<div class="col-md-6" id="replyBtnBox">
							<c:if test="${reply.replyWriter eq usingName}">
								<button type="button" class="btn btn-outline-primary" onclick = "location.href = '${pageContext.request.contextPath }/cs-center/qna/reply/update/repno=${reply.replyNo },qnano=${reply.qnaNo }' ">수정하기</button>
								<button type="button" class="btn btn-outline-primary" onclick = "location.href = '${pageContext.request.contextPath }/cs-center/qna/reply/delete/repno=${reply.replyNo },qnano=${reply.qnaNo }' ">삭제하기</button>
							</c:if>
						</div>
 					</div>
				</div>
				<div class="card-body">
					<p class="card-text">${reply.replyText }</p>
				</div>
			</div>
			</c:forEach>
			<c:if test="${isLogin }">
			<form action="${pageContext.request.contextPath }/cs-center/qna/reply/write" method="post">
				<div id="replyBox">
					<input type="hidden" name="qnaNo" value="${bean.qnano }" />
					<textarea name="replyText" id="replyText" placeholder="댓글을 입력해 주세요" class="form-control" rows="4"></textarea>
					<input type="submit" class="btn btn-primary" value="작성하기"/>
				</div>
			</form>
			</c:if>
			<c:if test="${isLogin ne true }">
			<form action="">
				<div id="replyBox">
					<input type="hidden" name="qnaNo" value="${bean.qnano }" />
					<textarea name="replyText2" id="replyText2" placeholder="댓글을 작성하실려면 로그인 하셔야 합니다" class="form-control" rows="4" readonly></textarea>
					<input type="submit" class="btn btn-primary disabled" value="작성하기"/>
				</div>
			</form>
			</c:if>
			<div class="box4">
				<c:set var="temp" >${isMine }</c:set>
				<c:if test="${temp eq 1}">
					<input type="button" id="modify" class="btn btn-primary" onclick ="location.href='../modify/${bean.qnano }'" value="수정하기">
					<input type="button" id="delete" class="btn btn-primary" onclick ="location.href='../delete/${bean.qnano }'" value="삭제하기">
				</c:if>
				<input type="button" id="list" class="btn btn-primary" onclick ="location.href='../'" value="목록">
			</div> 
		</div>
	</div>
</div>
<%@ include file="../template/footer.jspf" %>
</body>
</html>