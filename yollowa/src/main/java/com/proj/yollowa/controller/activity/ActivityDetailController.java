package com.proj.yollowa.controller.activity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.proj.yollowa.interceptor.Auth;
import com.proj.yollowa.interceptor.AuthUser;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.activity.ActivityDetailPageDto;
import com.proj.yollowa.model.entity.activity.ActivityOptionVo;
import com.proj.yollowa.model.entity.activity.ActivityReservFormPageDto;
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
		
		return "activity/activityDetail";
	}
	
	
	// 액티비티 예약 post 
	@Auth
	@RequestMapping(value="detail/reservation", method=RequestMethod.POST)
	public String activityReservation(@AuthUser UserVo userVo,ActivityReservFormPageDto bean) {
		
		int articleNumber = bean.getAReservInfo_articleNumber();
		String amountArr = bean.getAReservInfo_amount();

		// articleNumber로 등록된 옵션 전부 select
		List<ActivityOptionVo> optionList = activityService.selectOptions(articleNumber);
		
		// 사용자가 체크한 수량
		String[] amount = amountArr.split(",");
		int totalPrice = 0;
		
		AReservInfoVo aReservInfoVo = new AReservInfoVo();
		List<AReservInfoVo> reservList = new ArrayList<AReservInfoVo>();
		
		for(int i=0; i<amount.length; i++) {
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
			
			// 리스트에 add할때에 수량이 1 이상인 것만 add 함
			if(userAmount>0) {
				reservList.add(aReservInfoVo);
			}
			// 총가격 계산
			totalPrice += optionPrice*userAmount;
			
		}
		System.out.println("reservList :: "+reservList);
		System.out.println("총 가격 :: "+totalPrice);
		
		return null;
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
	
	
}
