package com.proj.yollowa.controller.admin;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.proj.yollowa.interceptor.Auth;
import com.proj.yollowa.interceptor.Auth.Role;
import com.proj.yollowa.interceptor.AuthManager;
import com.proj.yollowa.model.adminpage.AdminDao;
import com.proj.yollowa.model.entity.ManagerVo;
import com.proj.yollowa.model.entity.SearchVo;
import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.entity.admin.HostrqnApprovalVo;
import com.proj.yollowa.model.entity.cs.NoticeVo;
import com.proj.yollowa.model.service.admin.AdminpageService;


@Controller
@RequestMapping("/admin")
public class AdminpageController {

	@Inject
	AdminpageService adminpageService;
	
	//관리자 페이지 메인 화면 출력
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model, @AuthManager ManagerVo managerVo) {
		if(managerVo == null) {
			return "redirect:../mlogin/";
		}
		return "admin/adminpageIndex";
	}
	
	//호스트 권한을 요청한 유저의 목록을 출력
	@RequestMapping(value = "/hostApprovalStandbyList/", method = RequestMethod.GET)
	public String hostApprovalList(Model model, @AuthManager ManagerVo managerVo,
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="keyword" ,required=false, defaultValue="") String keyword,
			@RequestParam(value="reqsearch" ,required=false, defaultValue="false") String reqsearch
			) throws SQLException {
		if(managerVo == null) {
			return "redirect:../../mlogin/";
		}
		SearchVo searchVo = new SearchVo();
		searchVo.setSearchType(searchType);
		searchVo.setKeyword(keyword);
		if(reqsearch.equals("true")) {

			searchVo.setSearchType("hostrqn_userNO");
		}
		
		searchVo.setPage(page);
		searchVo.setTotalCnt(adminpageService.countHosrqnService(searchVo));
		model.addAttribute("paging", searchVo);
		System.out.println("##"+searchVo);
		
		model.addAttribute("list", adminpageService.getHostApprovalStandbyListService(searchVo));
		
		return "admin/hostApprovalStandbyList";
	}
	
	//호스트 권한을 부여한다
	@RequestMapping(value = "/hostApprovalStandbyList/hostApproval/hostrqn_no={hostrqn_no},userLevel={user_level}", method = RequestMethod.GET)
	public String hostApproval(@PathVariable("hostrqn_no") int hostrqn_no, @PathVariable("user_level") int user_level, @AuthManager ManagerVo managerVo) throws SQLException {
		if(managerVo == null) {
			return "redirect:../../../mlogin/";
		}
		HostrqnApprovalVo hostrqnApprovalVo = adminpageService.getHostApprovalStandbyService(hostrqn_no);
		UserVo userVo=adminpageService.updateHostPreProcessService(hostrqnApprovalVo.getHostrqn_userNo(), hostrqn_no);
		userVo.setUser_level(user_level);
		adminpageService.updateUserLevelToHostService(userVo, hostrqnApprovalVo.getHostrqn_info());
		adminpageService.deleteOneHostrqnService(hostrqn_no);
		return "redirect:../";
	}
	
	//엑티비티 판매 글 중 등록 승인 대기 중인 목록을 표시한다
	@RequestMapping(value = "/activityApprovalStandbyList/", method = RequestMethod.GET)
	public String activityApprovalStandbyList(Model model, @AuthManager ManagerVo managerVo,
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="keyword" ,required=false, defaultValue="") String keyword
			) throws SQLException {
		if(managerVo == null) {
			return "redirect:../../mlogin/";
		}
		SearchVo searchVo = new SearchVo();
		searchVo.setSearchType(searchType);
		searchVo.setKeyword(keyword);
		searchVo.setPage(page);
		searchVo.setPerPageNum(5);
		searchVo.setTotalCnt(adminpageService.countActivityApprovalStandbyListService(searchVo));
		model.addAttribute("paging", searchVo);
		System.out.println("##"+searchVo);
		
		model.addAttribute("list", adminpageService.getActivityApprovalStandbyListService(searchVo));
		
		return "admin/activityApprovalStandbyList";
	}
	
	//엑티비티 판매 글 중 등록 승인 대기 글 하나를 승인한다
	@RequestMapping(value = "/activityApprovalStandbyList/updateActivityTemp/{activity_number}", method = RequestMethod.GET)
	public String updateActivityTempToApproved(@PathVariable int activity_number, @AuthManager ManagerVo managerVo) throws SQLException {
		if(managerVo == null) {
			return "redirect:../../../mlogin/";
		}
		adminpageService.updateActivityTempToApprovedService(activity_number);
		return "redirect:../";
	}
	
	//숙박 판매 글 중 등록 승인 대기 중인 목록을 표시한다
	@RequestMapping(value = "/lodgementApprovalStandbyList/", method = RequestMethod.GET)
	public String lodgementApprovalStandbyList(Model model, @AuthManager ManagerVo managerVo,
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="keyword" ,required=false, defaultValue="") String keyword
			) throws SQLException {
		if(managerVo == null) {
			return "redirect:../../mlogin/";
		}
		SearchVo searchVo = new SearchVo();
		searchVo.setSearchType(searchType);
		searchVo.setKeyword(keyword);
		searchVo.setPage(page);
		searchVo.setPerPageNum(5);
		searchVo.setTotalCnt(adminpageService.countLodgementApprovalStandbyListService(searchVo));
		model.addAttribute("paging", searchVo);
		System.out.println("##"+searchVo);
		model.addAttribute("list", adminpageService.getLodgementApprovalStandbyListService(searchVo));
		return "admin/lodgementApprovalStandbyList";
	}
	
	//숙박 판매 글 중 등록 승인 대기 글 하나를 승인한다
	@RequestMapping(value = "/lodgementApprovalStandbyList/updateLodgementTemp/{lodgement_number}", method = RequestMethod.GET)
	public String updateLodgementTempToApproved(@PathVariable int lodgement_number, @AuthManager ManagerVo managerVo) throws SQLException {
		if(managerVo == null) {
			return "redirect:../../../mlogin/";
		}
		adminpageService.updateLodgementTempToApprovedService(lodgement_number);
		return "redirect:../";
	}
	
	//관리자 계정의 목록을 출력
	@RequestMapping(value = "/managerList/", method = RequestMethod.GET)
	public String managerList(Model model, @AuthManager ManagerVo managerVo,
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="keyword" ,required=false, defaultValue="") String keyword
			) throws SQLException {
		if(managerVo == null) {
			return "redirect:../../mlogin/";
		}
		SearchVo searchVo = new SearchVo();
		searchVo.setSearchType(searchType);
		searchVo.setKeyword(keyword);
		searchVo.setPage(page);
		searchVo.setTotalCnt(adminpageService.countManagerList(searchVo));
		model.addAttribute("paging", searchVo);
		System.out.println("##"+searchVo);
		
		model.addAttribute("list", adminpageService.getManagerListService(searchVo));
		
		return "admin/managerList";
	}
	
	//관리자 계정 상세 내용 출력
	@RequestMapping(value = "/managerList/detail/{manager_number}", method = RequestMethod.GET)
	public String getManager(Model model, @PathVariable int manager_number, @AuthManager ManagerVo managerVo) throws SQLException {
		if(managerVo == null) {
			return "redirect:../../../mlogin/";
		}
		model.addAttribute("bean", adminpageService.getManagerService(manager_number));
		
		return "admin/managerDetail";
	}
	
	@RequestMapping("/managerList/add")
	public String managerAddPage(@AuthManager ManagerVo managerVo) {
		if(managerVo == null) {
			return "redirect:../../../mlogin/";
		}
		return "admin/managerAdd";
	}
	
	@RequestMapping(value = "/managerList/add", method = RequestMethod.POST)
	public String managerAdd(@ModelAttribute ManagerVo bean, @AuthManager ManagerVo managerVo) throws SQLException {
		if(managerVo == null) {
			return "redirect:../../../mlogin/";
		}
		adminpageService.insertManagerService(bean);
		return "redirect:./";
	}
	
	//관리자 계정 수정 페이지 출력
	@RequestMapping(value = "/managerList/update/{manager_number}", method = RequestMethod.GET)
	public String managerModifyPage(Model model, @PathVariable int manager_number, @AuthManager ManagerVo managerVo) throws SQLException {
		if(managerVo == null) {
			return "redirect:../../../mlogin/";
		}
		model.addAttribute("bean", adminpageService.getManagerService(manager_number));
		
		return "admin/managerModify";
	}
	
	//관리자 계정 수정 사항 UPDATE
	@RequestMapping(value = "/managerList/update/{manager_number}", method = RequestMethod.POST)
	public ModelAndView updateManager(@PathVariable int manager_number, @ModelAttribute ManagerVo bean, @AuthManager ManagerVo managerVo) throws SQLException {
		if(managerVo == null) {
			return new ModelAndView("redirect:../../../mlogin/");
		}
		adminpageService.updateManagerService(bean);
		
		return new ModelAndView("redirect:../detail/"+manager_number);
	}
	
	//관리자 계정 삭제
	@RequestMapping(value = "/managerList/delete/{manager_number}", method = RequestMethod.GET)
	public String deleteManager(@PathVariable int manager_number, @AuthManager ManagerVo managerVo) throws SQLException {
		if(managerVo == null) {
			return "redirect:../../../mlogin/";
		}
		adminpageService.deleteManagerService(manager_number);
		
		return "redirect:../";
	}
	
}
