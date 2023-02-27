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
	
	@GetMapping("/receivelist")
	public String getReceiveEmail(Model model,HttpSession session,@RequestParam(defaultValue="1") int pageNo) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		int emailRow = emailService.getReceiveEmailRows(employee.getEmpId());
		Pager pager = new Pager(10, 5, emailRow, pageNo);
		List<EmailList> emailList = emailService.getReceiveEmailList(pager, employee.getEmpId());
		log.info("list 개수: "+emailList.size());
		model.addAttribute("emailList", emailList);
		model.addAttribute("pager", pager);
		String type = "receive";
		model.addAttribute("type", type);
		return "email/emaillist";
	}
	
	@GetMapping("/sendlist")
	public String getSendEmail(Model model, HttpSession session, @RequestParam(defaultValue="1") int pageNo) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		int emailRow = emailService.getSendEmailRows(employee.getEmpId());
		Pager pager = new Pager(10, 5, emailRow, pageNo);
		List<EmailList> emailList = emailService.getSendEmailList(pager, employee.getEmpId());
		model.addAttribute("emailList", emailList);
		model.addAttribute("pager", pager);
		return "email/sendlist";
	}
	
	@GetMapping("/readlist")
	public String getReadEmail(Model model, HttpSession session,@RequestParam(defaultValue="1") int pageNo) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		int emailRow = emailService.getReadEmailRows(employee.getEmpId());
		Pager pager = new Pager(10, 5, emailRow, pageNo);
		List<EmailList> emailList = emailService.getReadEmailList(pager, employee.getEmpId());
		model.addAttribute("emailList", emailList);
		model.addAttribute("pager", pager);
		return "email/sendlist";
	}
	
	@GetMapping("/unreadlist")
	public String getUnReadEmail(Model model, HttpSession session, @RequestParam(defaultValue="1") int pageNo) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		int emailRow = emailService.getUnReadEmailRows(employee.getEmpId());
		Pager pager = new Pager(10, 5, emailRow, pageNo);
		List<EmailList> emailList = emailService.getUnReadEmailList(pager, employee.getEmpId());
		model.addAttribute("emailList", emailList);
		model.addAttribute("pager", pager);
		return "email/sendlist";
	}
	@GetMapping("/trashlist")
	public String getTrashEmail(Model model, HttpSession session,@RequestParam(defaultValue="1") int pageNo) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		int emailRow = emailService.getTrashEmailRows(employee.getEmpId());
		Pager pager = new Pager(10, 5, emailRow, pageNo);
		List<EmailList> emailList = emailService.getTrashEmailList(pager, employee.getEmpId());
		model.addAttribute("emailList", emailList);
		model.addAttribute("pager", pager);
		String type = "trash";
		model.addAttribute("type", type);
		return "email/emaillist";
	}
	
	@GetMapping("/importantlist")
	public String getImportantEmail(Model model, HttpSession session, @RequestParam(defaultValue="1") int pageNo) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		int emailRow = emailService.getImportantEmailRows(employee.getEmpId());
		Pager pager = new Pager(10, 5, emailRow, pageNo);
		List<EmailList> emailList = emailService.getImportantEmail(pager, employee.getEmpId());
		model.addAttribute("emailList", emailList);
		model.addAttribute("pager", pager);
		String type = "important";
		model.addAttribute("type", type);
		return "email/emaillist";
	}
	
	@GetMapping("/templist")
	public String getTempEmail(Model model, HttpSession session, @RequestParam(defaultValue="1") int pageNo) {
		log.info("실행");
		Employee employee = (Employee) session.getAttribute("loginEmployee");
		int emailRow = emailService.getTempEmailRows(employee.getEmpId());
		Pager pager = new Pager(10, 5, emailRow, pageNo);
		List<EmailList> emailList = emailService.getTempEmail(pager, employee.getEmpId());
		model.addAttribute("emailList", emailList);
		model.addAttribute("pager", pager);
		String type = "temp";
		model.addAttribute("type", type);
		return "email/emaillist";
		
	}
}
