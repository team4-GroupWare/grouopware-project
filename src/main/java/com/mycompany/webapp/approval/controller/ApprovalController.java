package com.mycompany.webapp.approval.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.approval.service.IApprovalService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/approval")
public class ApprovalController {

	@Autowired
	private IApprovalService approvalService;
	
	@GetMapping("/write")
	public String write() {
		log.info("실행");
		return "approval/approval_form";
	}
}
