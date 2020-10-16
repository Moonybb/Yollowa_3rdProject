<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
  </head>
  <body>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- swal -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<script>
var IMP = window.IMP; // 생략가능
IMP.init('imp40929352'); // 가맹점 식별코드

IMP.request_pay({
    pg : 'html5_inicis', // 이니시스 웹표준 
    pay_method : 'card', // 결제수단 카드
    merchant_uid : 'merchant_' + new Date().getTime(), // 결제가된적 있는 merchant_uid로는 재결제 불가 
    name : '${roomName}', //16자 이내 권장
    amount :'${resultPrice}',	//결제 금액
    buyer_email : 'vnvnwn@gmail.com',
    buyer_name : '${userName}',
    buyer_tel : '${userPhoneNumber}'
}, function(rsp) {
    if ( rsp.success ) {
        var msg1 = '결제가 완료되었습니다';
        var msg2 = '결제 금액 : ' + rsp.paid_amount+"원";
        swal({
        	title:msg1,
        	text:msg2,
        	icon:'success',
        	closeOnClickOutside:false,
        	
        	button:{
        		confirm:{
        			text:"확인",
        			values:true,
        			className:'btn btn-success'
        		}
        	}
        }).then((result)=>{
        	if(result){
        		$.ajax({
        	    	type:"post",
        	    	data:({
        		    		articleNumber:"${articleNumber}",
        		    		companyName:"${companyName}",
        		    		roomNumber:"${roomNumber}",
        		    		roomName:"${roomName}",
        		    		checkIn:"${checkIn}",
        		    		checkOut:"${checkOut}",
        		    		resultPrice:"${resultPrice}",
        		    		cart:"${cart}"
        	    		}),
        	    	dataType:"json",
        	    	url:"${pageContext.request.contextPath}/lodgement/detail/InicisAjax",
        	    });
        	    window.location.href='http://localhost:8080/yollowa/lodgement/detail/ReservationResult/';
        	}
        });
	    
    } else {
    	var msg1 = '결제에 실패하였습니다.  ';
        var msg2 = '에러내용 : ' + rsp.error_msg;
    	swal({
        	title:msg1,
        	text:msg2,
        	icon:'error',
        	closeOnClickOutside:false,
        	
        	button:{
        		confirm:{
        			text:"확인",
        			values:true,
        			className:'btn btn-danger'
        		}
        	}
        }).then((result)=>{
        	if(result){
			    window.location.href='http://localhost:8080/yollowa/lodgement/list';
        	}
        });
    	
        
    }
});
</script>
  </body>
</html>