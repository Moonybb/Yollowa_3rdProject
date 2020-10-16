package com.proj.yollowa.controller.activity;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.proj.yollowa.model.entity.lodgement.LodgementDetailPageDto;
import com.google.gson.Gson;
import com.proj.yollowa.model.entity.lodgement.LodgementRoomInfoVo;
import com.proj.yollowa.model.entity.lodgement.LodgementVo;
import com.proj.yollowa.model.service.activity.ActivityService;
import com.proj.yollowa.model.service.lodgement.LodgementService;


@RestController
@RequestMapping("/activity/")
public class ActivityAjaxController {
	
	@Inject
	ActivityService activityService;
	
	@RequestMapping(value="list/priceSelect", method=RequestMethod.POST)
	public Object priceSelect(HttpServletRequest req) {
//		System.out.println(req.getParameter("lodgementNumber"));
		int activityNumber = Integer.parseInt(req.getParameter("activityNumber"));
		int price = activityService.priceSelect(activityNumber);
		return price;
	}
	
	
}





