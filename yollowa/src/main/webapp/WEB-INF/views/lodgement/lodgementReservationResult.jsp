<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../template/head.jspf"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- swal -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style type="text/css">
</style>
<script type="text/javascript">
	var count = 2;
	var counter = setInterval(timer,1000);
	
	function timer(){
		$("#timer").text(count);
		if(count<=0){
			clearInterval(counter);
			
			$("#timer").text("0");
			location.href="${pageContext.request.contextPath}";
			
		}
		
		count--;
	}
</script>

<meta charset="UTF-8">
<title>결제완료</title>
</head>
<body>
	<%@ include file="../template/header.jspf"%>
	<%@ include file="../template/menu.jspf"%>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div style="margin: 260px auto; text-align: center;">
					<p style="font-size: 40px;">예약이 완료되었습니다</p>
					<span id="timer" style="margin:0px auto; font-size: 25px; padding-top: 20px;">3</span>
					<span style=" font-size: 25px; padding-top: 20px;">초 후에 메인으로 이동합니다</span>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>


	<%@ include file="../template/footer.jspf"%>
</body>


</html>