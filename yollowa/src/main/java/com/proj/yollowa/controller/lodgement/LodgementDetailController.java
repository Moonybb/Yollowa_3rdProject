package com.proj.yollowa.controller.lodgement;

import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.proj.yollowa.interceptor.Auth;
import com.proj.yollowa.interceptor.AuthUser;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.lodgement.InformationVo;
import com.proj.yollowa.model.entity.lodgement.LodgementDetailPageDto;
import com.proj.yollowa.model.entity.lodgement.LodgementRoomInfoVo;
import com.proj.yollowa.model.entity.mypage.LReservInfoDto;
import com.proj.yollowa.model.service.activity.ActivityService;
import com.proj.yollowa.model.service.lodgement.LodgementService;

@Controller
@RequestMapping("/lodgement/")
public class LodgementDetailController {
	
	@Inject
	LodgementService lodgementService;
	@Inject
	ActivityService activityService;
	
	// 숙박 디테일
	@RequestMapping("detail/{lodgement_number}")
	public String lodgementDetail(@AuthUser UserVo userVo, @PathVariable("lodgement_number") int number,Model model) throws SQLException {
		// 디테일리스트
		List<LodgementDetailPageDto> list =lodgementService.lodgementDetail(number,model);
		
		// 이미지들
		lodgementService.lodgementImgSelect(number,model);
		
		// 기본정보들
		lodgementService.lodgementInfo(number, 2, model);
		
		//리뷰
		activityService.reviewList(number, 2, model);
		
		// 주소 위치
		String pin=list.get(0).getLodgement_location();

		// 숙소 이름
		String name = list.get(0).getLodgement_companyName();
		
		// 해시태그
		String hash = list.get(0).getLodgement_hashTag();
		String hashTag = hash.replaceAll("&", "  ");
		model.addAttribute("hashTag", hashTag);
		
		// 세션 확인 null이 아니면 유저넘버 보내줌 (장바구니, 찜목록 로그인 안돼있을 시 swal 하기 위함) 
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
		model.addAttribute("article", number);
		
		return "lodgement/lodgementDetail";
	}

	/////////////////////////// 예약 페이지
	
	//숙박 예약페이지
	@Auth 
	@RequestMapping(value =  "detail/reservation/{lodgement_number}")
	public String lodgementReservation(@PathVariable("lodgement_number") int articleNumber, HttpServletRequest req,Model model,@AuthUser UserVo user,@ModelAttribute("LReservInfoDto") LReservInfoDto LRDto) throws SQLException, ParseException{

		String cart = req.getParameter("cart");
		model.addAttribute("cart", cart);
		System.out.println("cart::::::"+cart);
		// 예약할 숙소정보
		String roomNumber =req.getParameter("roomNumber");
		String sdate =req.getParameter("sdate");
		String edate =req.getParameter("edate");
		List list =new ArrayList();
		list.add(articleNumber);
		list.add(roomNumber);
		
		model.addAttribute("sdate", sdate);
		model.addAttribute("edate", edate);
		model.addAttribute("articleNumber",articleNumber);
		model.addAttribute("roomNumber",roomNumber);
		
		// 해당 기본정보
		List<InformationVo> infoList=lodgementService.lodgementInfo(articleNumber, 2, model);
		
		model.addAttribute("infoList", infoList);
		// 예약페이지 숙소이름
		List<LodgementDetailPageDto> lodgementCompanyName= lodgementService.lodgementDetail(articleNumber,model);
		String companyName = lodgementCompanyName.get(0).getLodgement_companyName();
		model.addAttribute("companyName", companyName);
		
		// 예약페이지 방 정보
		int rn= Integer.parseInt(roomNumber);
		List<LodgementRoomInfoVo> detailList = lodgementService.lodgementReserInfo(articleNumber,rn,model);
		model.addAttribute("roomDetail", detailList);
		
		// 로그인한 유저 정보
		UserVo userBean = lodgementService.lodgementReserUser(user,model);
		
		model.addAttribute("userName", userBean.getUser_name());
		
		// 총 결제금액
		int peakPrice=detailList.get(0).getRoomInfo_peakPrice();		// 성수기 가격
		int offPeakPrice =detailList.get(0).getRoomInfo_offPeakPrice();	// 비수기가격
		
		LodgementRoomInfoVo days =lodgementService.lodgementpeakDays(articleNumber,rn,model);
		
		Date reserveStart=Date.valueOf(sdate);	// 체크인
		Date reserveEnd=Date.valueOf(edate);	//체크아웃
		
		
		Date peakStart=days.getRoomInfo_peakStartDate();	//성수기 시작날	10-20
		Date peakEnd = days.getRoomInfo_peakEndDate();		//성수기 종료날	10-23
		
		// 하루 long값 86400000
		long oneDay=86400000;
		
		
		//체크인 날이 성수기 종료날보다 높을때 or 체크아웃날이 성수기 시작날보다 낮을때 (성수기 포함 하루도없음)
		if((peakEnd.getTime()<reserveStart.getTime()) || (reserveEnd.getTime()<peakStart.getTime()) ) {		
			long a=reserveEnd.getTime()-reserveStart.getTime()+oneDay;
			int i= Long.valueOf(a/oneDay).intValue();// 숙박 일수 * 비수기 가격
//			System.out.println("완전 비성수기"+i);
			
			model.addAttribute("resultPrice", offPeakPrice*i);
			
		}
		
		// 체크인은 비수기 , 체크아웃은 성수기 사이
		else if((reserveStart.getTime()<peakStart.getTime()) && ((reserveEnd.getTime()>=peakStart.getTime()) && (reserveEnd.getTime()<=peakEnd.getTime()))) {
			int offPeakCnt =0;
			int peakCnt=0;
			long rs=reserveStart.getTime();
			long ps=peakStart.getTime();
			int p1=0;
			int p2=0;
			
			// 체크인부터 성수기시작 전까지
			boolean boo1=true;
			while(boo1) {
				offPeakCnt++;
				rs=rs+oneDay;
				if(rs == peakStart.getTime()) {
//					System.out.println("비수기날카운트"+offPeakCnt); 
					p1=offPeakCnt*offPeakPrice;
					boo1=false;
				}
			}
			
			// 성수기시작부터 체크아웃까지
			boolean boo2=true;
			while(boo2) {
				peakCnt++;
				ps=ps+oneDay;
				if(ps== reserveEnd.getTime()) {
					peakCnt++;
//					System.out.println("성수기날카운트"+peakCnt);
					p2 =peakCnt*peakPrice;
					boo2=false;
				}
			}
			model.addAttribute("resultPrice", p1+p2);
		}
		
		// 체크인은 성수기 사이, 체크아웃은 비수기 
		else if((reserveEnd.getTime()>peakEnd.getTime()) && ((reserveStart.getTime()>=peakStart.getTime()) && (reserveStart.getTime()<=peakEnd.getTime()))) {
			int offPeakCnt=0;
			int peakCnt =0;
			
			long rs=reserveStart.getTime();
			long pe=peakEnd.getTime();
			int p1=0;
			int p2=0;
			
			
			// 체크인부터 성수기끝까지
			boolean boo1=true;
			while(boo1) {
				peakCnt++;
				rs=rs+oneDay;
				if(rs == peakEnd.getTime()) {
					peakCnt++;
//					System.out.println("성수기날 카운트~"+peakCnt);
					p1 =peakCnt*peakPrice;
					boo1=false;
				}
				
			}
			
			// 성수기끝부터 체크아웃까지
			boolean boo2=true;
			while(boo2) {
				offPeakCnt++;
				pe=pe+oneDay;
				if(pe == reserveEnd.getTime()) {
//					System.out.println("비수기날 카운트~"+offPeakCnt);
					p2 = offPeakCnt*offPeakPrice;
					boo2=false;
				}
				
			}
			
			
			model.addAttribute("resultPrice", p1+p2);
		
		}
			
			 
		// 성수기 사이
		else if((reserveStart.getTime()>=peakStart.getTime()) && (reserveEnd.getTime()<=peakEnd.getTime())) {
			long a=reserveEnd.getTime()-reserveStart.getTime()+oneDay;
			int i= Long.valueOf(a/oneDay).intValue();// 숙박 일수 * 성수기 가격
//			System.out.println("완전 성수기"+i);
			
			model.addAttribute("resultPrice", peakPrice*i);
			
		}
		
		// 체크인,체크아웃이 비수기지만 사이에 성수기포함
		else {
			long peakPrev=(peakStart.getTime()-reserveStart.getTime())/oneDay;	//체크인부터 성수기시작전까지
			long peakNext=(reserveEnd.getTime()-peakEnd.getTime())/oneDay;		//성수기끝부터 체크아웃까지
			long peak=(peakEnd.getTime()-peakStart.getTime()+oneDay)/oneDay;		//성수기
			int p1,p2,p3;
			p1 = Long.valueOf(peakPrev).intValue();
			p2 = Long.valueOf(peakNext).intValue();
			p3 = Long.valueOf(peak).intValue();
//			System.out.println("성수기 전"+p1);
//			System.out.println("성수기만"+p3);
//			System.out.println("성수기 후"+p2);
			int resultPrice=(p1+p3)*offPeakPrice+p2*peakPrice;
			
			model.addAttribute("resultPrice", resultPrice);
						
		}
		
		
		return "lodgement/lodgementReservation";
	}
	
	/////////////// 이니시스 페이지
	
	// 숙박 결제
	@Auth
	@RequestMapping(value = "detail/Inicis/",method = RequestMethod.POST)
	public String lodgementInicis(Model model,HttpServletRequest req,@AuthUser UserVo user) throws SQLException {
		String articleNumber= req.getParameter("articleNumber");
		String companyName= req.getParameter("companyName");
		String roomNumber= req.getParameter("roomNumber");
		String roomName= req.getParameter("roomName");
		String checkIn= req.getParameter("checkIn");
		String checkOut= req.getParameter("checkOut");
		String resultPrice= req.getParameter("resultPrice");
		
		String userName =user.getUser_name();
		String userPhoneNumber = user.getUser_phoneNumber();
		
		
		model.addAttribute("articleNumber", articleNumber);
		model.addAttribute("companyName", companyName);
		model.addAttribute("roomNumber", roomNumber);
		model.addAttribute("roomName", roomName);
		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut", checkOut);
		model.addAttribute("resultPrice", resultPrice);
		model.addAttribute("userName", userName);
		model.addAttribute("userPhoneNumber", userPhoneNumber);
		
		String cart = req.getParameter("cart");
		model.addAttribute("cart", cart);
		System.out.println("이니시스 페이지 카트::"+cart);
		
		return "lodgement/lodgementInicis";
	}
	
	// 결제 완료시 ajax
	@Auth
	@RequestMapping(value = "detail/InicisAjax",method = RequestMethod.POST)
	public void InicisAjax(HttpServletRequest req,@AuthUser UserVo user) throws SQLException, ParseException {
		String articleNumber= req.getParameter("articleNumber");
		String companyName= req.getParameter("companyName");
		String roomNumber= req.getParameter("roomNumber");
		String roomName= req.getParameter("roomName");
		String checkI= req.getParameter("checkIn");
		String checkO= req.getParameter("checkOut");
		String resultPrice= req.getParameter("resultPrice");
		int userNumber =user.getUser_number();
		String userPhoneNumber =user.getUser_phoneNumber();
		
		String cart=req.getParameter("cart");
		System.out.println("결제완료 ajax:::"+cart);
		
		
		java.sql.Date checkIn=java.sql.Date.valueOf(checkI);
		java.sql.Date checkOut=java.sql.Date.valueOf(checkO);
		
		if(cart.isEmpty()) {
			System.out.println("바로 결제");
			//유저넘버 , 글번호 , 방번호 , 체크인 , 체크아웃 , 폰번 , 예약한 날짜 , 결제금액 , 예약 상태 , 장바구니 상태
			lodgementService.LReservInfoInsert(userNumber,Integer.parseInt(articleNumber),Integer.parseInt(roomNumber),checkIn,checkOut,userPhoneNumber,Integer.parseInt(resultPrice));
		}else {
			System.out.println("바구니결제");
			int c = Integer.parseInt(cart);
			lodgementService.LReservInfoUpdate(c);
		}
		
		
	}
	
	// 예약완료 페이지
	@RequestMapping(value = "detail/ReservationResult/")
	public String lodgementReservationResult(Model model,HttpServletRequest req) throws SQLException{
		
		return "lodgement/lodgementReservationResult";
	}
	
	// 환불 이니시스
	@RequestMapping("test")
	public String canclePay() throws SQLException{
		
		return "lodgement/test";
	}
	
	
	// 장바구니 ajax controller
	@Auth
	@RequestMapping(value="detail/cartInsert", method=RequestMethod.POST)
	public void lodgementCartInsert(@AuthUser UserVo userVo,HttpServletRequest req){
		
		int articleNumber = Integer.parseInt(req.getParameter("articleNumber"));
		int roomNumber= Integer.parseInt(req.getParameter("roomNumber"));
		System.out.println(articleNumber);
		System.out.println(roomNumber);
		String sdate = req.getParameter("sdate");
		String edate = req.getParameter("edate");
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		Date startDate;
		Date endDate;
		
		startDate = Date.valueOf(sdate);
		endDate = Date.valueOf(edate);
		
		// insert 하기 전에 받아온 정보들로 roomInfo에서 날짜 상대적으로 가격을 받아낸다 (시작날짜 기준)
		int payment = lodgementService.roomPaymentSelect(roomNumber, startDate, endDate);
		
		// 위에서 성수기인지 비성수기인지 사용자가 선택한 날짜로 확인 후 반환된 payment를 가지고 insert
		lodgementService.lodgementCartInsert(articleNumber, roomNumber, startDate, endDate, payment, userVo);
		
//		try {
//			startDate = (java.sql.Date) transFormat.parse(sdate);
//			endDate = (java.sql.Date) transFormat.parse(edate);
//			System.out.println(startDate);
//			System.out.println(endDate);
//
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
		
	}
	
	// Lodgement 찜목록
	@Auth
	@RequestMapping(value="detail/wishInsert", method=RequestMethod.POST)
	public void lodgementWishInsert(@AuthUser UserVo userVo ,HttpServletRequest req) {
		
		int userNumber = userVo.getUser_number();
		
		System.out.println("찜목록 lodgementNumber :: "+req.getParameter("number"));
		int lodgementNumber = Integer.parseInt(req.getParameter("number"));
		
		lodgementService.lodgementWishUpdate(lodgementNumber, userNumber);
	}
}
