<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yollowa</title>
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
	.table{
		margin-top: 30px;
	    border-top: 2px solid #D0A9F5;
	}
	.table tr{
		text-align: center;
	}
	
	tbody td:nth-child(2) {
		text-align: left;
	}
	#search {
		float: right;
	}
	.form-group * {
	    margin: 5px auto 5px auto;
	    height: 33px;
	    padding-top: 1px;
	    padding-bottom: 1px;
	}
	.pagination {
		text-align: center;
    	padding-left: revert;
   	}
	#btn-long {
	    margin: 5px auto 23px auto;
	    width: 77px;
	    height: 33px;
	    padding-top: 1px;
	    padding-bottom: 1px;
	}
	
	#writeBox{
		text-align: right;
	}
	/* content end */
		
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
		<p> <a href="../">메인 페이지</a> > 고객센터 > 공지사항 </p>
		<h1>공지사항 <small>욜로와에서 알려드립니다.</small></h1>
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
			<form id="search" action="${pageContext.request.contextPath }/cs-center/notice/" class="form-inline" method="get">
				<div class="form-group">
					<input type="hidden" name="page" value="1"/>
				    <select name="searchType" class="custom-select">
				      	<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="titleContent">제목+내용</option>
						<option value="writer">작성자</option>
				    </select>
				  	<input type="text" name="keyword" class="form-control" placeholder="검색어를 입력하세요" id="inputDefault">
					<input type="submit" id="btn-normal" value="검색하기" class="btn btn-primary" />
				</div>
			</form>
			<table class="table">
			  <thead class="thead-light">
			    <tr>
			      <th>글번호</th>
			      <th>제목</th>
			      <th>작성자</th>
			      <th>작성일</th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach items="${list }" var="notice">
			    <tr>
			      <td><a href="./detail/${notice.noticeno }">${notice.noticeno }</a></td>
			      <td><a href="./detail/${notice.noticeno }">${notice.title }</a></td>
			      <td><a href="./detail/${notice.noticeno }">${notice.writer }</a></td>
			      <td><a href="./detail/${notice.noticeno }">${notice.writeddate }</a></td>
			    </tr>
			    </c:forEach>
			  </tbody>
			</table>
			<div class="row">
				<div class="col-md-4">
					<input type="hidden" />
				</div>
				<div class="col-md-6">
					<ul class="pagination">
						<c:if test="${paging.prev }">
						 <li class="page-item"><a class="page-link" href="?page=${paging.startPage - 1 }">이전</a></li>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" varStatus="status">
							<li class="page-item"><a class="page-link" href="?page=${status.index }">${status.index }</a></li>
						</c:forEach>
						<c:if test="${paging.next && paging.endPage > 0 }">
							<li class="page-item"><a class="page-link" href="?page=${paging.endPage + 1 }">다음</a></li>
						</c:if>
					</ul>
				</div>
				<div class="col-md-2" id="writeBox">
				<c:set var="temp" >${managerVo.manager_level }</c:set>
					<c:if test="${!empty temp}">
						<input type="button" id="btn-long" value="글쓰기" class="btn btn-primary" onClick="location.href='./write'" />
				</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../template/footer.jspf" %>
</body>
</html>