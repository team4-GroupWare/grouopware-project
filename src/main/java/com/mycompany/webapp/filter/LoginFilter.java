package com.mycompany.webapp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mycompany.webapp.employee.model.Employee;

import lombok.extern.log4j.Log4j2;
@Log4j2
public class LoginFilter implements Filter {
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		log.info("실행");
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession();
		
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		log.info("loginEmployee: "+ employee);
		if(employee == null) {
			response.sendRedirect(request.getContextPath() + "/employee/login");
			return;
		}
		
		chain.doFilter(request, response);
	}

	

}
