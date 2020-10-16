package com.proj.yollowa.controller.mypage;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.proj.yollowa.interceptor.Auth;
import com.proj.yollowa.interceptor.AuthUser;
import com.proj.yollowa.model.entity.SearchVo;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.admin.HostrqnApprovalVo;
import com.proj.yollowa.model.service.cs.QnaReplyService;
import com.proj.yollowa.model.service.cs.QnaService;
import com.proj.yollowa.model.service.mypage.MypageService;
import com.proj.yollowa.model.service.mypage.MypageServiceJK;

@Controller
@RequestMapping("/mypage")
public class MypageControllerJK {

	@Inject
	MypageService myPageService;
	@Inject
	MypageServiceJK mypageServiceJK;
	@Inject
	QnaService qnaService;
	@Inject
	QnaReplyService qnaReplyService;
	
	
	//사업자 권한을 신청할 수 있는 페이지 뷰
	@Auth
	@RequestMapping(value = "/hostRqn",method = RequestMethod.GET)
	public String hostRqn(@AuthUser UserVo userVo,Model model) throws SQLException {
		UserVo user=myPageService.userDetailService(model,userVo.getUser_number());
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
		UserVo user=myPageService.userDetailService(model,userVo.getUser_number());
		if(user==null) {
			return "redirect:../";
		}
		System.out.println("@@@@@@@@@@@@"+paramVo);
		mypageServiceJK.insertHostrqnServise(paramVo);
		return "redirect:../hostRqn";
	}
	//사용자가 작성한 리뷰를 표시한다
	@Auth
	@RequestMapping(value = "/myreview",method = RequestMethod.GET)
	public String myReview(Model model, @AuthUser UserVo userVo,
			@RequestParam(value="page", required=false, defaultValue="1") int page) throws SQLException {
		UserVo user=myPageService.userDetailService(model,userVo.getUser_number());
		if(user==null) {
			return "redirect:../";
		}
		SearchVo searchVo = new SearchVo();
		searchVo.setSearchType("");
		searchVo.setKeyword(user.getUser_nickName());
		searchVo.setPage(page);
		searchVo.setPerPageNum(5);
		searchVo.setTotalCnt(mypageServiceJK.getReviewCountService(searchVo));
		
		
		model.addAttribute("list", mypageServiceJK.getAllMyReviewListService(searchVo));
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