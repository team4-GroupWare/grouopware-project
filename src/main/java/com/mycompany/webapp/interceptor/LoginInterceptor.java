package com.mycompany.webapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.mycompany.webapp.employee.model.Employee;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class LoginInterceptor implements HandlerInterceptor {
	/**
	 * @author : LEEYESEUNG
	 * @return : controller 실행 여부
	 * @param request : session을 얻기 위함 
	 * @param response : redirect를 하기 위함
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// Controller 전처리
		// true 리턴시 controller를 실행 (false는 실행x)
		log.info("실행");
		HttpSession session = request.getSession();
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		if(employee == null) {
			response.sendRedirect(request.getContextPath() + "/employee/login");
			return false;
		}
		 return true;
	}
}
