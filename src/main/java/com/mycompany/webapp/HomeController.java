package com.mycompany.webapp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.webapp.email.model.MainEmailList;
import com.mycompany.webapp.email.service.IEmailService;
import com.mycompany.webapp.employee.model.Employee;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class HomeController {
	
	@Autowired
	IEmailService emailService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		List<MainEmailList> sendEmailList = emailService.getSendMainEmailList(employee.getEmpId());
		model.addAttribute("sendEmailList", sendEmailList);
		List<MainEmailList> receiveEmailList = emailService.getReceiveMainEmailList(employee.getEmpId());
		model.addAttribute("receiveEmailList", receiveEmailList);
		return "main";
	}
	
}
