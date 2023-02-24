package com.mycompany.webapp.email.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.email.model.EmailList;
import com.mycompany.webapp.email.service.IEmailService;
import com.mycompany.webapp.employee.model.Employee;

import lombok.extern.log4j.Log4j2;

/**
 * 
 * @author LEEYESEUNG
 *
 */
@Controller
@Log4j2
@RequestMapping("/email")
public class EmailController {
	
	@Autowired
	IEmailService emailService;
	
	@GetMapping("/list")
	public String getReceiveEmail(Model model,HttpSession session,@RequestParam(defaultValue="1") int pageNo) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		int emailRow = emailService.getReceiveEmailRows(employee.getEmpId());
		Pager pager = new Pager(10, 5, emailRow, pageNo);
		List<EmailList> emailList = emailService.getEmailList(pager, employee.getEmpId());
		log.info("list 개수: "+emailList.size());
		model.addAttribute("emailList", emailList);
		model.addAttribute("pager", pager);
		return "email/emaillist";
	}

}
