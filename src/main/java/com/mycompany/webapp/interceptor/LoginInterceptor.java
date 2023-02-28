package com.mycompany.webapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.webapp.employee.model.Employee;

import lombok.extern.log4j.Log4j2;
@Log4j2
public class LoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("실행1");
		HttpSession session = request.getSession();
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		if(employee == null) {
			log.info("실행2");
			response.sendRedirect(request.getContextPath()+"/employee/login");
			return false;
		} 
		log.info("실행3");
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("실행");
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		log.info("실행");
	}
}
