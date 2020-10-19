<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<c:url value="/resources/js/jquery-1.12.4.js" var="jquery"/>
	<c:url value="/resources/js/bootstrap.js" var="bootstrap"/>
	<c:url value="/resources/css/bootstrap.min.css" var="bootstrapCSS"></c:url>
	<c:url value="/" var="root"></c:url>
	<link rel="stylesheet" type="text/css" href="${bootstrapCSS }">
	<script type="text/javascript" src="${jquery }"></script>
	<script type="text/javascript" src="${bootstrap }"></script>
	<script type="text/javascript" src="">
	$("link[rel='shortcut icon']").attr("href", "${pageContext.request.contextPath}/resources/img/icons/favicon.png");
	</script>
<meta charset="UTF-8">
<title>Yollowa</title>
</head>
<body>

</body>
</html>
