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
		text-align: right;
		margin-top: 10px;
	}
	#submitBtn {
	}
	/* content end */
		
</style>
<script type="text/javascript">
$(document).ready(function() {
	CKEDITOR.replace('editor',
		    {
	      height : '500px',  //에디터 높이
	      startupFocus : false,
	      filebrowserUploadUrl:'${pageContext.request.contextPath }/fileupload'
    });
	
});
</script>
</head>
<body>
<%@ include file="../template/header.jspf" %>
<%@ include file="../template/menu.jspf" %>
<div class="container">
	<div class="page-header">
		<p> <a href="../">메인 페이지</a> > 고객센터 > Faq</p>
		<h1>Faq <small> 고객님들께서 자주 물으시는 사항에 대해 알려드립니다.</small></h1>
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
			<form method="post" action="write">
				<div class="box1">
					<label for="title" id="titleLabel">제목</label>
					<input type="text" name="title" class="form-control" id="titleInput" placeholder="제목을 입력해 주세요" />
				</div>
				<div class="box2">
					<textarea name="content" id="editor" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				<div class="box3">
					<input type="submit" id="submitBtn" class="btn btn-primary" value="작성하기">
				</div> 
			</form>
		</div>
	</div>
</div>
<%@ include file="../template/footer.jspf" %>
</body>
</html>