package com.proj.yollowa.controller.activity;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.proj.yollowa.interceptor.Auth;
import com.proj.yollowa.interceptor.AuthUser;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.activity.ActivityDetailPageDto;
import com.proj.yollowa.model.entity.activity.ActivityOptionVo;
import com.proj.yollowa.model.entity.activity.ActivityReservFormPageDto;
import com.proj.yollowa.model.entity.activity.ActivityVo;
import com.proj.yollowa.model.entity.lodgement.LodgementVo;
import com.proj.yollowa.model.entity.lodgement.InformationVo;
import com.proj.yollowa.model.entity.mypage.AReservInfoVo;
import com.proj.yollowa.model.service.activity.ActivityService;

@Controller
@RequestMapping("/activity/")
public class ActivityDetailController {

	@Inject
	ActivityService activityService;
	
	@RequestMapping("detail/{activity_number}")
	public String activityDetail(@AuthUser UserVo userVo, @PathVariable("activity_number") int activity_number, Model model) throws SQLException {
		// 디테일리스트
		List<ActivityDetailPageDto> list =activityService.activityDetail(activity_number,model);
		
		// 이미지들
		activityService.activityImgSelect(activity_number,model);
		
		// 기본정보들
		activityService.activityInfo(activity_number, 1, model);
		
		//리뷰
		activityService.reviewList(activity_number, 1, model);
		
		// 주소 위치
		String pin=list.get(0).getActivity_location();

		// 액티비티 이름
		String name = list.get(0).getActivity_title();
		
		// 해시태그
		String hash = list.get(0).getActivity_hashTag();
		String hashTag = hash.replaceAll("&", "  ");
		model.addAttribute("hashTag", hashTag);
		
		if(userVo==null) {
			// 로그인 안되어 있을 시
			// jsp에서 받을때 null이면 nullpoint때문에 임의적으로 0 을 보내준다.
			model.addAttribute("userNumber", 0);
		}else {
			// 로그인 되어있을 시
			model.addAttribute("userNumber", userVo.getUser_number());
		}
		
		model.addAttribute("pin", pin);
		model.addAttribute("companyName", name);
		model.addAttribute("startEndDay", list.get(0));
		model.addAttribute("article", activity_number);
		
		model.addAttribute("reviewRate", list.get(0).getActivity_reviewGradeRate());
		model.addAttribute("reviewCount", list.get(0).getActivity_reviewCount());
		
		/* 주변 액티비티 추천 start */
		double activityLat = list.get(0).getActivity_Lat();
		double activityLng = list.get(0).getActivity_Lng();
		
		List<LodgementVo> recommendList = activityService.selectLodgementRecommend(activityLat, activityLng, model); 
		
		/* 주변 액티비티 추천 end */
		return "activity/activityDetail";
	}
	
	
	// 액티비티 예약 post 
	@Auth
	@RequestMapping(value="detail/reservation/{articleNumber}", method=RequestMethod.POST)
	public String activityReservation(@PathVariable("articleNumber") int articleNumber ,@AuthUser UserVo userVo,ActivityReservFormPageDto bean,Model model) {
		
		
		// 글 이름
		List<ActivityDetailPageDto> title =activityService.activityDetail(articleNumber, model);
		model.addAttribute("companyName", title.get(0).getActivity_title());
		
		// 예약 시간
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
				
		String sdate = format1.format(System.currentTimeMillis());
		        				 		
		System.out.println(sdate);
		model.addAttribute("sdate",sdate);
		Date d = Date.valueOf(sdate);
		
		// 글번호
		model.addAttribute("articleNumber", articleNumber);
		
		
		String amountArr = bean.getAReservInfo_amount();

		// articleNumber로 등록된 옵션 전부 select
		List<ActivityOptionVo> optionList = activityService.selectOptions(articleNumber);
		
		// 사용자가 체크한 수량
		String[] amount = amountArr.split(",");
		int totalPrice = 0;
		
		List<AReservInfoVo> reservList = new ArrayList<AReservInfoVo>();
		List<ActivityOptionVo> option = new ArrayList<ActivityOptionVo>();
		
		
		for(int i=0; i<amount.length; i++) {
			AReservInfoVo aReservInfoVo = new AReservInfoVo();
			int optionNumber = optionList.get(i).getActivityOption_optionNumber();
			int optionPrice = optionList.get(i).getActivityOption_price();
			int userAmount = Integer.parseInt(amount[i]);
			
			System.out.println("optionNumber : "+optionNumber);
			// articleNumber set
			aReservInfoVo.setaReservInfo_articleNumber(articleNumber);
			// 옵션 넘버 set
			aReservInfoVo.setaReservInfo_optionNumber(optionNumber);
			// 유저넘버 set
			aReservInfoVo.setaReservInfo_userNumber(userVo.getUser_number());
			// 선택한 수량 set
			aReservInfoVo.setaReservInfo_amount(userAmount);
			// unitPrice set
			aReservInfoVo.setaReservInfo_unitPrice(optionPrice);
			// 수량 * 옵션 가격 set
			aReservInfoVo.setaReservInfo_payment(optionPrice*userAmount);
			// 현재날짜 SET
			aReservInfoVo.setaReservInfo_checkIn(d);
			
			// 리스트에 add할때에 수량이 1 이상인 것만 add 함
			if(userAmount>0) {
				reservList.add(aReservInfoVo);
				List<ActivityOptionVo> optionName = activityService.activityOptionName(optionNumber,articleNumber);
				option.addAll(optionName);
			}
			// 총가격 계산
			totalPrice += optionPrice*userAmount;
			
		}
//		System.out.println(reservList);
		InformationVo refund=activityService.activityRefund(articleNumber);
		
		
		
		model.addAttribute("refund", refund.getInformation_refundInfo());
		
		model.addAttribute("optionName", option);
		model.addAttribute("reservList", reservList);
		
		model.addAttribute("userName", userVo.getUser_name());	// 유저이름
		model.addAttribute("resultPrice", totalPrice);			// 총 결제 금액
		
		return "activity/activityReservation";
	}
	
	
	// activity 찜목록
	@Auth
	@RequestMapping(value="detail/wishInsert", method=RequestMethod.POST)
	public void lodgementWishInsert(@AuthUser UserVo userVo ,HttpServletRequest req) {
		
		int userNumber = userVo.getUser_number();
		
		System.out.println("찜목록 activityNumber :: "+req.getParameter("number"));
		int activityNumber = Integer.parseInt(req.getParameter("number"));
		
		activityService.activityWishUpdate(activityNumber, userNumber);
	}
	
	
	// activity 이니시스
	@Auth
	@RequestMapping(value="detail/Inicis/", method=RequestMethod.POST)
	public String activityInicis(@AuthUser UserVo userVo ,HttpServletRequest req,Model model) {
		
		String articleNumber=req.getParameter("articleNumber");
		String companyName=req.getParameter("companyName");
		String reservList=req.getParameter("reservList");
		String sdate=req.getParameter("sdate");
		String resultPrice=req.getParameter("resultPrice");
		String cart=req.getParameter("cart");
		
//		System.out.println("이니시스");
//		System.out.println(articleNumber);
//		System.out.println(companyName);
//		System.out.println(reservList);
//		System.out.println(sdate);
//		System.out.println(resultPrice);
//		System.out.println(cart);
		
		
		model.addAttribute("articleNumber", articleNumber);
		model.addAttribute("reservList", reservList);
		model.addAttribute("userName", userVo.getUser_name());
		model.addAttribute("userPhoneNumber", userVo.getUser_phoneNumber());
		model.addAttribute("companyName", companyName);
		model.addAttribute("resultPrice", resultPrice);
		
		return "activity/activityInicis";
	}
	
	
	
	// 결제 완료시 ajax
	@Auth
	@RequestMapping(value = "detail/InicisAjax",method = RequestMethod.POST)
	public void InicisAjax(HttpServletRequest req,@AuthUser UserVo user) throws SQLException, ParseException {
		String articleNumber= req.getParameter("articleNumber");
		String companyName= req.getParameter("companyName");
		String checkI= req.getParameter("checkIn");
		String resultPrice= req.getParameter("resultPrice");
		String reservList= req.getParameter("reservList");
		
//		System.out.println("리절브리스트:"+reservList);
		String[] optionNumberList=reservList.split("optionNumber=");
		String[] unitPriceList=reservList.split("unitPrice=");
		String[] paymentList=reservList.split("payment=");
		String[] amountList=reservList.split("amount=");
		
		String[] ol=null;
		String[] ul=null;
		String[] pl=null;
		String[] al=null;
		
//		for(int i=0;i<optionNumberList.length;i++) {
//			System.out.println(optionNumberList[i]);
//		}
//		for(int i=0;i<unitPriceList.length;i++) {
//			System.out.println(unitPriceList[i]);
//		}
//		for(int i=0;i<paymentList.length;i++) {
//			System.out.println(paymentList[i]);
//		}
//		for(int i=0;i<amountList.length;i++) {
//			System.out.println(amountList[i]);
//		}
		


		int userNumber =user.getUser_number();
		String userPhoneNumber =user.getUser_phoneNumber();
		
		String cart=req.getParameter("cart");
//		System.out.println("결제완료 ajax:::"+cart);
		

		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String ss=sdf.format(new java.util.Date());
		java.sql.Date checkOut= java.sql.Date.valueOf(ss);
		DateFormat Format = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = checkOut;
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, 90);
        String d=Format.format(cal.getTime());
        
        Date cDate=Date.valueOf(d);
        
		for(int i=1;i<optionNumberList.length;i++) {
			ol=optionNumberList[i].split(",");	//optionNumber
			ul=unitPriceList[i].split(",");		//unitPrice
			pl=paymentList[i].split(",");		//payment
			al=amountList[i].split(",");		//amountList
					
			if(cart.isEmpty()) {
//				System.out.println("바로 결제");
//				System.out.println("articleNumber:"+Integer.parseInt(articleNumber));
//				System.out.println("optionNumber:"+Integer.parseInt(ol[0]));
//				System.out.println("amount:"+Integer.parseInt(al[0]));
//				System.out.println("unitPrice:"+Integer.parseInt(ul[0]));
//				System.out.println("payment:"+Integer.parseInt(pl[0]));
				
				//유저넘버 , 글번호 , 옵션 넘버, 상품개수 , 예약날,종료일,폰넘버,개당가격, 결제금액
				activityService.AReservInfoInsert(userNumber,Integer.parseInt(articleNumber),Integer.parseInt(ol[0]),Integer.parseInt(al[0]),userPhoneNumber,Integer.parseInt(ul[0]),Integer.parseInt(pl[0]),cDate);
			}else {
				System.out.println("바구니결제");
				int c = Integer.parseInt(cart);
				//activityService.AReservInfoUpdate(c);
			}
		}
		
		
		
		
		
	}
	
	// 예약완료 페이지
	@RequestMapping(value = "detail/ReservationResult/")
	public String lodgementReservationResult(Model model,HttpServletRequest req) throws SQLException{
		
		return "activity/activityReservationResult";
	}
	
	
}
