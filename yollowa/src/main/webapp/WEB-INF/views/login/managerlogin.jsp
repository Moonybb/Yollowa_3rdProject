<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file="../template/head.jspf" %>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script type="text/javascript">
	$(function(){
		var failed='${failed}';
		console.log(failed);
		if(failed=="failed"){
			swal({
				title:"실패",
				text:"아이디 또는 비밀번호가 맞지 않습니다",
			    icon: "error",
			    closeOnClickOutside:false,
		    	buttons :{
			    	confirm:{
			    		text:'확인',
			    		value:true,
			    		className:'btn btn-primary'
			    	}
			    }
			}).then((result) =>{
				if(result){
					<% HttpSession session1=request.getSession();
						session1.setAttribute("failed", "");
					%>
				}
			});
		}
	});
</script>
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