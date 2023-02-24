package com.mycompany.webapp.approval.controller;

import java.util.List;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.approval.model.ApprovalCategory;
import com.mycompany.webapp.approval.service.IApprovalService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/approval")
public class ApprovalController {

	@Autowired
	private IApprovalService approvalService;
	
	/**
	 * 전자결재 작성
	 * @author : LEEJIHO
	 * @param model
	 * @return
	 */
	@GetMapping("/write")
	public String write(Model model) {
		log.info("실행");
		
		List<ApprovalCategory> approval_category = approvalService.getCategory();
		log.info(approval_category);
		
		
		String form ="<html>\r\n" + 
				"<h2>사직서</h2>\r\n" + 
				"  <table class=\"table\">\r\n" + 
				"    <thead>\r\n" + 
				"      <tr>\r\n" + 
				"        <td colspan=\"3\"><b>사직서</b></td>\r\n" + 
				"      </tr>\r\n" + 
				"      <tr>\r\n" + 
				"        <th>Firstname</th>\r\n" + 
				"        <th>Lastname</th>\r\n" + 
				"        <th>Email</th>\r\n" + 
				"      </tr>\r\n" + 
				"    </thead>\r\n" + 
				"    <tbody>\r\n" + 
				"      <tr>\r\n" + 
				"        <td>John</td>\r\n" + 
				"        <td>Doe</td>\r\n" + 
				"        <td>john@example.com</td>\r\n" + 
				"      </tr>\r\n" + 
				"      <tr>\r\n" + 
				"        <td>Mary</td>\r\n" + 
				"        <td>Moe</td>\r\n" + 
				"        <td>mary@example.com</td>\r\n" + 
				"      </tr>\r\n" + 
				"      <tr>\r\n" + 
				"        <td>July</td>\r\n" + 
				"        <td>Dooley</td>\r\n" + 
				"        <td>july@example.com</td>\r\n" + 
				"      </tr>\r\n" + 
				"    </tbody>\r\n" + 
				"  </table>\r\n" + 
				"</html>";
		
		String escape = StringEscapeUtils.escapeJava(form);
		log.info(escape); 
		
		model.addAttribute("escape", escape);
		model.addAttribute("approval_category", approval_category);
		return "approval/approval_form";
	}
	
	@GetMapping("/detail")
	public String detail() {
		log.info("실행");
		return "approval/approval_detail";
	}
	
	
}
