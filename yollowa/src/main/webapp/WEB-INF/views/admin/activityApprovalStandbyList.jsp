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
	.pagingBox{
		display: flex;
		position: relative;
	}
	.pagination {
		margin: 10px 205px auto 350px;
		width: 100%;
	}
	#btn-long {
	    margin: 5px auto 5px auto;
	    width: 120%;
	    height: 33px;
	    padding-top: 1px;
	    padding-bottom: 1px;
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
		<p> <a href="../">메인 페이지</a> > 관리자 페이지 > 액티비티 게시글 관리 </p>
		<h1>액티비티 게시글 관리 <small></small></h1>
	</div>
	<div class="row">
		<div id="category" class="col-md-3">
				<div class="bigList">
					<p>파트너 관리</p>
					<div class="smallList">
						<p><a href="${pageContext.request.contextPath }/admin/hostApprovalStandbyList/">사업자 승인</a></p>
					</div>
					<div class="smallList">
						<p><a href="${pageContext.request.contextPath }/admin/lodgementApprovalStandbyList/">숙박 게시글 관리</a></p>
					</div>
					<div class="smallList">
						<p><a href="${pageContext.request.contextPath }/admin/activityApprovalStandbyList/">액티비티 게시글 관리</a></p>
					</div>
					<p>사원 관리</p>
					<div class="smallList">
						<p><a href="${pageContext.request.contextPath }/admin/managerList/">관리자 관리</a></p>
					</div>
				</div>
		</div>
		<div class="col-md-9">
			<form id="search" action="${pageContext.request.contextPath }/admin/activityApprovalStandbyList/" class="form-inline">
				<div class="form-group">
				    <select name="searchType" class="custom-select">
				      	<option value="activity_usernumber">사업자</option>
				    </select>
				  	<input name="keyword" type="text" class="form-control" placeholder="검색어를 입력하세요" id="inputDefault">
					<input type="submit" id="btn-normal" value="검색하기" class="btn btn-primary" />
				</div>
			</form>
			<table class="table">
			  <thead class="thead-light">
			    <tr>
			      <th>번호</th>
			      <th>대표이미지</th>
			      <th>제목</th>
			      <th>업주명</th>
			      <th>상태</th>
			      <th>승인하기</th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach items="${list }" var="list">
			    <tr>
					<td>${list.activity_number }</td>
					<td><img alt="" src="../../${list.activity_img }" width="100px" height="100px"></td>
					<td>${list.activity_title }</td>
					<td>${list.user_name }</td>
					<td>대기중</td>
					<td><a href="./updateActivityTemp/${list.activity_number}">승인하기</a></td>
			    </tr>
			    </c:forEach>
			  </tbody>
			</table>
			<div class="pagingBox">
				<div class="paging">
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
			</div>
		</div>
	</div>
</div>
<%@ include file="../template/footer.jspf" %>
</body>
</html>