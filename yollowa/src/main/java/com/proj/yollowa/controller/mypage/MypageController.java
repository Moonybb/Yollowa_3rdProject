package com.proj.yollowa.controller.mypage;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.proj.yollowa.interceptor.Auth;
import com.proj.yollowa.interceptor.AuthUser;
import com.proj.yollowa.model.entity.ManagerVo;
import com.proj.yollowa.model.entity.SearchVo;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.admin.HostrqnApprovalVo;
import com.proj.yollowa.model.service.cs.QnaReplyService;
import com.proj.yollowa.model.service.cs.QnaService;
import com.proj.yollowa.model.service.mypage.MypageService;
import com.proj.yollowa.service.login.UserService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Inject
	MypageService mypageService;
	@Inject
	QnaService qnaService;
	@Inject
	QnaReplyService qnaReplyService;
	@Inject
	MypageService myPageService;
	
	@Auth
	@RequestMapping(value = "/{service}",method = RequestMethod.GET)
	public String index(@AuthUser UserVo userVo,Model model,@PathVariable("service") String service) throws SQLException {
		UserVo user=mypageService.userDetailService(model,userVo.getUser_number());
		if(user==null) {
			return "redirect:../";
		}
		mypageService.lReservationInfoService(model, userVo.getUser_number(),service);
		return "mypage/mypageIndex";
	}
	@Auth
	@RequestMapping(value = "/completed/{service}",method = RequestMethod.GET)
	public String used(@AuthUser UserVo userVo,Model model,@PathVariable("service") String service) throws SQLException {
		UserVo user=mypageService.userDetailService(model,userVo.getUser_number());
		if(user==null) {
			return "redirect:../";
		}
		mypageService.lUserCompletedInfoService(model, userVo.getUser_number(),service);
		return "mypage/completed";
	}
	@Auth
	@RequestMapping(value = "/completed/overHistory",method = RequestMethod.GET)
	public String overHistory(@AuthUser UserVo userVo,Model model) throws SQLException {
		UserVo user=mypageService.userDetailService(model,userVo.getUser_number());
		String service=null;
		if(user==null) {
			return "redirect:../";
		}
		mypageService.getActivityOverHistory(model, userVo.getUser_number(),service);
		return "mypage/overHistory";
	}
	@Auth
	@RequestMapping(value = "/cart/{service}",method = RequestMethod.GET)
	public String cart(@AuthUser UserVo userVo,Model model,@PathVariable("service") String service) throws SQLException {
		UserVo user=mypageService.userDetailService(model,userVo.getUser_number());
		if(user==null) {
			return "redirect:../";
		}
		mypageService.lUserCartInfoService(model, userVo.getUser_number(),service);
		return "mypage/cart";
	}
	@Auth
	@RequestMapping(value = "/wishlist/{service}",method =RequestMethod.GET )
	public String wishList(@AuthUser UserVo userVo, Model model,@PathVariable("service") String service) throws SQLException{
		UserVo user=mypageService.userDetailService(model,userVo.getUser_number());
		if(user==null) {
			return "redirect:../";
		}
		mypageService.userWishListService(model, userVo, service);
		
		return "mypage/wishlist";
	}
	@Auth
	@RequestMapping(value = "/userinfo",method =RequestMethod.GET )
	public String userinfo(@AuthUser UserVo userVo, Model model) throws SQLException{
		UserVo user=mypageService.userDetailService(model,userVo.getUser_number());
		if(user==null) {
			return "redirect:../";
		}
		
		return "mypage/userinfo";
	}
	
	@Auth
	@RequestMapping(value = "/cart/delete/",method=RequestMethod.GET)
	public String deleteCart(HttpServletRequest req,@AuthUser UserVo userVo,Model model) {
		try {
			int result=mypageService.cartDeleteService(req.getParameter("service"), Integer.parseInt(req.getParameter("reservNumber")), userVo.getUser_number());
			if(result>0) {
				return "mypage/cart";
			}
			
		} catch (Exception e) {
			return "";
		}
		return null;
	}
	///ajax
	@Auth
	@RequestMapping(value = "/userinfo/searchpw",method = RequestMethod.POST)
	@ResponseBody
	public Object searchpw(@AuthUser UserVo userVo,@RequestParam String password) throws SQLException {
		
		System.out.println(password);
		
		return mypageService.searchPassword(userVo.getUser_id(), password);
	}
	
	@Auth
	@RequestMapping(value = "/userinfo/changepw",method = RequestMethod.GET)
	public String changePw() {
		return "mypage/changepw";
	}
	
	@Auth
	@RequestMapping(value = "/userinfo/changepw",method = RequestMethod.POST)
	@ResponseBody
	public String changePw(@AuthUser UserVo userVo,@RequestParam String password) throws SQLException {
		System.out.println(password);
		mypageService.changePasswordService(userVo.getUser_number(),password);
		
		return "success";
	}
	////////////
	
	
	
	
	
	///ajax
	@Auth
	@RequestMapping(value = "/userinfo/dsearchpw",method = RequestMethod.POST)
	@ResponseBody
	public Object searchPw(@AuthUser UserVo userVo,@RequestParam String password) throws SQLException {
		
		System.out.println(password);
		
		return mypageService.searchPassword(userVo.getUser_id(), password);
	}
	@Auth
	@RequestMapping(value = "/userinfo/deleteuser",method = RequestMethod.GET)
	public String deleteUser() {
		
		return "mypage/deleteuser";
	}
	@Auth
	@RequestMapping(value = "/userinfo/deleteuser",method = RequestMethod.POST)
	@ResponseBody
	public Object deleteUser(@AuthUser UserVo userVo,@RequestParam String password,HttpServletRequest request) throws SQLException {
		
		request.getSession().invalidate();
		
		return mypageService.deleteUser(userVo.getUser_number());
	}
	//////////////////

	
	//사업자 권한을 신청할 수 있는 페이지 뷰
	@Auth
	@RequestMapping(value = "/hostRqn",method = RequestMethod.GET)
	public String hostRqn(@AuthUser UserVo userVo,Model model) throws SQLException {
		UserVo user=mypageService.userDetailService(model,userVo.getUser_number());
		if(user==null) {
			return "redirect:../";
		}
		System.out.println(userVo.getUser_level()+"|||"+userVo.getUser_name());
		model.addAttribute("bean", userVo);
		return "mypage/hostRqn";
	}
	//사업자 권한을 신청한다
	@Auth
	@RequestMapping(value = "/hostRqn/applyed",method = RequestMethod.POST)
	public String hostRqnApplyed(@AuthUser UserVo userVo,Model model, @ModelAttribute HostrqnApprovalVo paramVo) throws SQLException {
		System.out.println("is Working");
		UserVo user=mypageService.userDetailService(model,userVo.getUser_number());
		if(user==null) {
			return "redirect:../";
		}
		System.out.println("@@@@@@@@@@@@"+paramVo);
		mypageService.insertHostrqnServise(paramVo);
		return "redirect:../mypage/2";
	}
	//사용자가 작성한 리뷰를 표시한다
	@Auth
	@RequestMapping(value = "/myreview",method = RequestMethod.GET)
	public String myReview(Model model, @AuthUser UserVo userVo,
			@RequestParam(value="page", required=false, defaultValue="1") int page) throws SQLException {
		UserVo user=mypageService.userDetailService(model,userVo.getUser_number());
		if(user==null) {
			return "redirect:../";
		}
		SearchVo searchVo = new SearchVo();
		searchVo.setSearchType("");
		searchVo.setKeyword(user.getUser_nickName());
		searchVo.setPage(page);
		searchVo.setPerPageNum(5);
		searchVo.setTotalCnt(mypageService.getReviewCountService(searchVo));
		
		
		model.addAttribute("list", mypageService.getAllMyReviewListService(searchVo));
		model.addAttribute("paging", searchVo);
		System.out.println("paging"+searchVo);

		return "mypage/myreview";
	}
	
	//로그인 중인 사용자가 작성한 qna를 조회한다
	@Auth
	@RequestMapping(value = "/myqna", method = RequestMethod.GET)
	public String noticeList(Model model, 
			@AuthUser UserVo userVo
			) throws SQLException, UnsupportedEncodingException {
		String userNick = userVo.getUser_nickName();
		System.out.println("유저명:"+userNick);
		userNick = URLEncoder.encode(userNick, "UTF-8");
		return "redirect:../cs-center/qna/?page=1&searchType=writer&keyword="+userNick;
	}
	
}
