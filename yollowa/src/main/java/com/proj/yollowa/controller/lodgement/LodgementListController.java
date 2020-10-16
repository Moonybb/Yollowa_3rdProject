package com.proj.yollowa.controller.lodgement;

import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.proj.yollowa.model.service.lodgement.LodgementService;

@Controller
@RequestMapping("/lodgement/")
public class LodgementListController {
	
	@Inject
	LodgementService lodgementService;
	
	// 숙박 리스트
	@RequestMapping("list")
	public String list(Model model) throws SQLException {
		lodgementService.lodgementListAll(model);
		
		// 리스트 temp=1인 개수
		int cnt = lodgementService.lodgementListCnt();
		model.addAttribute("cnt", cnt);
		
		return "lodgement/lodgementList";
	}
	
	// 검색
	@RequestMapping(value="lodgeSearch", method=RequestMethod.GET)
	public String lodgementSearch(HttpServletRequest req, Model model) {
		String search = req.getParameter("searchQuery");
		lodgementService.lodgementSearch(search, model);
		
		return "lodgement/lodgementList";
	}
		
	// 지역 filter
	@RequestMapping(value="/filter",method=RequestMethod.GET )
	public String lodgementLocationFilterPage(HttpServletRequest req, Model model) {
		String locationFilter = req.getParameter("locationFilter");
		
		// 사용자가 선택한 필터 ex) 남양주/양주/파주
		lodgementService.lodgementLocationFilterSelect(locationFilter, model);
		
		model.addAttribute("locationFilter", locationFilter);
		
		return "lodgement/lodgementList";
		
	}
}





