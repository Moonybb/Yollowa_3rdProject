<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file="../template/head.jspf" %>
</head>
<body>
	<%@ include file="../template/header.jspf" %>
	<%@ include file="../template/menu.jspf" %>
	<div class="container">
		<form action="${pageContext.request.contextPath }/mlogin/result" method="post">
		  <div class="form-group">
		    <label for="manager_id">ID : </label>
		    <input type="text" class="form-control" name="manager_id" id="manager_id" placeholder="아이디를 입력해주세요">
		  </div>
		  <div class="form-group">
		    <label for="manager_password">Password</label>
		    <input type="password" class="form-control" id="manager_password" name="manager_password" placeholder="비밀번호를 입력해주세요">
		  </div>
		  <button type="submit" class="btn btn-primary">로그인</button>
		</form>
	</div>
	
	
	
	<%@ include file="../template/footer.jspf" %>
</body>
</html>