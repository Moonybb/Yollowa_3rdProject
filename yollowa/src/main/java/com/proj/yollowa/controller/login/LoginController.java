package com.proj.yollowa.controller.login;


import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.JsonNode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.proj.yollowa.auth.SNSLogin;
import com.proj.yollowa.auth.SnsValue;
import com.proj.yollowa.interceptor.Auth;
import com.proj.yollowa.interceptor.AuthManager;
import com.proj.yollowa.interceptor.AuthUser;
import com.proj.yollowa.model.entity.ManagerVo;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.service.login.UserService;
import com.proj.yollowa.util.socialLogin.AccessToken;
import com.proj.yollowa.util.socialLogin.UserInfo;

@Controller
public class LoginController {

	@Inject
	private UserService userService;

	@Inject
	private SnsValue naverSns;

	private JsonNode accessToken;

	@RequestMapping(value = "login/{service}/callback",method = { RequestMethod.GET,RequestMethod.POST})
	public ModelAndView SnsLoginCallback(@PathVariable String service,Model model,@RequestParam String code,HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		userService.getUserInfo(model);
		boolean boo=false;
		if(StringUtils.equals("kakao", service)) {

			JsonNode jsonToken = AccessToken.getAccessToken(code);
			accessToken=jsonToken.get("access_token");
			UserVo userVo=UserInfo.getUserVo(UserInfo.getUserInfo(accessToken));
			//유저테이블의 모든 카카오 아이디 불러오기
			List<String> allKakaoId=userService.getAllKakaoIdService();
			//카카오 아이디를 다 꺼내서 받아온 카카오아이디와 같으면 세션에 싣는다
			UserVo snsUser=null;
			for(String kakaoId:allKakaoId) {
				if(kakaoId!=null) {
					if(kakaoId.equals(userVo.getUser_kakaoId())){
						boo=true;
						break;
					}else 
						boo = false;
				}
			}
			if(boo) {
				snsUser=userService.getKakaoUserLoginService(model, userVo.getUser_kakaoId(), request);
			}else {
				System.out.println(userVo);
				mv.addObject("joinInfo", userVo);
				mv.setViewName("/login/join");
				return mv;
			}
			
		}else {
			SnsValue sns=naverSns;
			// 1. code를 이용해서 access_token 받기
			SNSLogin snsLogin = new SNSLogin(sns);
			// 2. access_token 이용해서 사용자 profile 정보 가져오기
			UserVo userVo = snsLogin.getUserProfile(code);
			List<String> allNaverId = userService.getAllNaverIdService();
			for(String naverId:allNaverId) {
				// 3. DB 해당 유저가 존재하는지 체크
				if(naverId!=null) {
					if(naverId.equals(userVo.getUser_naverId())){
						boo=true;
						break;
					}else 
						boo = false;
				}
			}
			
			if(boo) {
				// 4. 존재시 강제로그인,
				userService.getNaverUserLoginService(model, userVo.getUser_naverId(), request);
			}else {
				// 미존재시 가입페이지로
				mv.addObject("joinInfo", userVo);
				mv.setViewName("/login/join");
				return mv;
			}
			
		}
		return new ModelAndView("redirect:../");
	}



	//유저 로그인 페이지 get
	@RequestMapping(value ="login/",method = RequestMethod.GET )
	public String login(Model model) {

		SNSLogin snsLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());

		return "login/login";
	}

	//매니저 로그인 페이지 get
	@RequestMapping(value = "mlogin/",method = RequestMethod.GET)
	public String managerLogin() {
		
		
		return "login/managerlogin";
	}



	
	@RequestMapping(value = "login/result", method = RequestMethod.POST)
	public void loginResult() {
	}
	
	
	@RequestMapping(value = "mlogin/result",method =RequestMethod.POST )
	public void managerLoginResult() {
	}
	//get접근시 리다이렉팅
	@RequestMapping(value = "login/result", method = RequestMethod.GET)
	public String loginGetResult() {
		return "redirect:../";
	}
	
	
	


	//세션에 객체가 실려있을시 홈화면으로 리다이렉팅
	@Auth
	@RequestMapping(value = "logout/",method = RequestMethod.GET)
	public String logout(HttpSession session,@AuthUser UserVo userVo) throws IOException {
		if(userVo!=null) {
			session.invalidate();
			return "redirect:../";
		}

		return null;
	}
	
	//회원가입 페이지
	@RequestMapping(value = "join/",method = RequestMethod.GET)
	public String join(@AuthManager ManagerVo managerVo, @AuthUser UserVo userVo,Model model,UserVo user) throws SQLException {
		//로그인 돼 있으면 홈으로 돌린다.
		if(userVo!=null||managerVo!=null) {
			return "redirect:../";
		}
		//모든 유저 가져오기
		userService.getUserInfo(model);
		
		return "login/join";
	}
	
	
	@RequestMapping(value = "join/",method = RequestMethod.POST)
	public String join(Model model,@ModelAttribute UserVo userVo,@RequestParam String addressDetail) throws Exception {
		userService.insertUserJoinInfo(userVo, addressDetail);
		return "redirect:../login/";
	}
	
	///// 아이디 찾기
	@RequestMapping(value = "login/FindId")
	public String findId() throws SQLException {
		
		return "login/findId";
	}
	
	
	///// 패스워드 찾기
	@RequestMapping(value = "login/Findpassword")
	public String findPassword() throws SQLException{
		
		return "login/findPassword";
	}
	
	

}











