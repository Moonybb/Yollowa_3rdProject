package com.proj.yollowa.controller.login;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Lookup;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.proj.yollowa.model.entity.UserVo;
import com.proj.yollowa.model.service.mypage.MypageService;

@RestController
public class LoginAjaxController {

	@Inject
	MypageService mypageService;
	
	@RequestMapping(value = "login/FindIdAjax")
	public Object findIdAjax(HttpServletRequest req) throws SQLException{
		String name =req.getParameter("name");
		String phoneNumber = req.getParameter("phoneNumber");
		
		UserVo user =mypageService.findId(name,phoneNumber);
		
		
		return user;
	}
	
	@RequestMapping(value = "login/FindPasswordAjax")
	public Object findPasswordAjax(HttpServletRequest req) throws SQLException{
		String name =req.getParameter("name");
		String id = req.getParameter("id"); 
		String phoneNumber = req.getParameter("phoneNumber");
		UserVo user =mypageService.findPassword(name,id,phoneNumber);
		
		
		return user;
	}
}
