package com.proj.yollowa.controller.activity;

import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.service.activity.ActivityService;

@Controller
@RequestMapping("/activity/")
public class ActivityListController {
	
	@Inject
	ActivityService activityService;

	// 숙박 리스트
		@RequestMapping("list")
		public String list(Model model) throws SQLException {
			activityService.activityListAll(model);
			
			// 리스트 temp=1인 개수
			int cnt = activityService.activityListCnt();
			model.addAttribute("cnt", cnt);
			
			return "activity/activityList";
		}
		
		// 액티비티 리스트 검색
		@RequestMapping(value="actiSearch", method=RequestMethod.GET)
		public String lodgementSearch(HttpServletRequest req, Model model) {
			String search = req.getParameter("searchQuery");
			activityService.activitySearch(search, model);
			
			return "activity/activityList";
		}
			
		// 지역 filter
		@RequestMapping(value="/filter",method=RequestMethod.GET )
		public String activityLocationFilterPage(HttpServletRequest req, Model model) {
			String locationFilter = req.getParameter("locationFilter");
			
			// 사용자가 선택한 필터 ex) 남양주/양주/파주
			activityService.activityLocationFilterSelect(locationFilter, model);
			
			model.addAttribute("locationFilter", locationFilter);
			
			return "activity/activityList";
			
		}
	
	
	
}















