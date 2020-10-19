package com.proj.yollowa.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.proj.yollowa.model.entity.ManagerVo;
import com.proj.yollowa.model.entity.login.ManagerLoginVo;
import com.proj.yollowa.service.login.UserService;

public class MloginInterceptor extends HandlerInterceptorAdapter implements SessionNames{
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	UserService loginService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String manager_id = request.getParameter("manager_id");
		String manager_password = request.getParameter("manager_password");
		
		ManagerLoginVo managerLoginVo=new ManagerLoginVo(manager_id,manager_password);
		ManagerVo managerVo = loginService.loginManagerService(managerLoginVo);
		HttpSession session = request.getSession();
		
		if(managerVo!=null) {
			//가져왔을때 널이 아니면 세션에 실어줌.
			session.setAttribute(MLOGIN, loginService.loginManagerService(managerLoginVo));
			response.sendRedirect("../");
		}else {
			session.setAttribute("failed", "failed");
			response.sendRedirect("./");
		}
		return false;
		
		
	}
}
