<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YOLLOWA</title>
<%@ include file="../template/head.jspf"%>
<style type="text/css">
ul {
	list-style: none;
}

.mypageLink {
	color: black;
	text-decoration: none;
}

.mypageLink:hover {
	color: black;
	text-decoration: none;
}

.row {
	font-size: 1.000rem;
}

.card {
	border-radius: 5px;
}

.card-link {
	display: block;
	color: #433387;
}

.card-link:hover {
	color: #433387;
}
	table {
	   width: 100%;
	   margin-bottom: 20px;
	/*    border: 1px solid #444444;
	   border-bottom: 1px solid #444444 !important; */
	 }
	 
 	.table{
		margin-top: 30px;
	    border-top: 2px solid #D0A9F5;
	}
	.table tr{
		text-align: center;
	}
	.reviewBox1{
	}
	
	th.tCompany {
    width: 23%;
	}
	
	td.tTitle {
	    width: 61%;
	}

	td.tReviewedDate {
    	width: 18%;
	}

	.tStarNum{
		color: #DCA60A
	} 
	
	td.tStar {
    width: 5%;
	}
	
	.tImg {
		text-align: center;
	}
	th, td {
		padding: 5px 5px 5px 5px; 
	}
	
	
</style>
<script type="text/javascript">
$("link[rel='shortcut icon']").attr("href", "${pageContext.request.contextPath}/resources/img/icons/favicon.png");
	$(function() {
		$('.card-body p>a').on('mouseenter', function() {
			$(this).css('color', '#C6BFE7');
		}).on('mouseleave', function() {
			$(this).css('color', '#433387');
		});

	});
</script>
</head>
<body>
	<%@ include file="../template/header.jspf"%>
	<%@ include file="../template/menu.jspf"%>
	<%@ include file="../template/mypagemenu1.jspf" %>
	<div class="col-md-9">
				<c:forEach items="${list }" var="list" >
						<table>
						<thead>
							<tr class="table-primary">
								<th class="tCompany">${list.company }</th>
								<th class="tTitle"><span class="sTitle">${list.title}</span></th>
								<td class="tStar"><span class="tStarNum">★${list.starNum }</span></td>
								<td class="tReviewedDate">${list.reviewedDate }</td>
							</tr>
						</thead>
						<tbody>
						<tr class="table-default">
							<td class="tContent" rowspan="1" colspan="3">${list.content }</td>
						</tr>
						<tr>
						</tr>
						</tbody>
							</table>
				</c:forEach>
				<div class="row">
				<div class="col-md-4">
					<input type="hidden" />
				</div>
				<div class="col-md-6">
					<ul class="pagination">
						<c:if test="${paging.prev }">
						 <li class="page-item"><a class="page-link" href="?page=${paging.startPage - 1 }&searchType=${paging.searchType }&keyword=${paging.keyword }">이전</a></li>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" varStatus="status">
							<li class="page-item"><a class="page-link" href="?page=${status.index }&searchType=${paging.searchType }&keyword=${paging.keyword }">${status.index }</a></li>
						</c:forEach>
						<c:if test="${paging.next && paging.endPage > 0 }">
							<li class="page-item"><a class="page-link" href="?page=${paging.endPage + 1 }&searchType=${paging.searchType }&keyword=${paging.keyword }">다음</a></li>
						</c:if>
					</ul>
				</div>
			</div>
	</div>
	<%@ include file="../template/mypagemenu2.jspf" %>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>