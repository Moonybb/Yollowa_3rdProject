package com.proj.yollowa.controller.home;

import java.sql.SQLException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.proj.yollowa.interceptor.Auth;
import com.proj.yollowa.interceptor.AuthUser;
import com.proj.yollowa.model.entity.ReviewVo;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.service.mypage.MypageService;

@Controller
public class HomeController {
	
	@Inject
	MypageService myPageService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "home";
	}
	
	@Auth
	@RequestMapping(value = "/review_write/{service}/{reservNumber}" ,method=RequestMethod.GET)
	public String wRiteReview(Model model,@AuthUser UserVo userVo,@PathVariable String service,@PathVariable("reservNumber") int reservNumber) throws SQLException {
		
		if(userVo==null) {
			return "../";
		}
		myPageService.getReviewInfoService(model, service, reservNumber);
		
		return "review";
	}
	@Auth
	@RequestMapping(value = "/review_write/{service}" ,method=RequestMethod.POST)
	public String wRiteReview(Model model,@AuthUser UserVo userVo,@ModelAttribute ReviewVo reviewVo,@PathVariable("service") String service) throws SQLException {
		
		
		
		if(userVo==null) {
			return "../";
		}
		myPageService.insertReviewService(reviewVo, userVo.getUser_number(), service);
		return "redirect:/mypage/completed/"+reviewVo.getReview_category();
	}
}
