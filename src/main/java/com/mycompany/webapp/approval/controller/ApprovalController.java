package com.mycompany.webapp.approval.controller;

import java.util.List;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.approval.model.Approval;
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
	 * 전자결재 작성 폼 불러오기
	 * @author : LEEJIHO
	 * @param model
	 * @return
	 */
	@GetMapping("/write")
	public String getApprovalForm(Model model) {
		log.info("실행");
		
		List<ApprovalCategory> approval_category = approvalService.getCategory();
		//log.info(approval_category);
		
		model.addAttribute("approval_category", approval_category);
		String form = "<table border=\"1\" style=\"border-collapse: collapse; width: 100%; height: 678.375px; border-width: 1.5px; border-color: rgb(0, 0, 0);\"><colgroup><col style=\"width: 16.7553%;\"><col style=\"width: 16.7553%;\"><col style=\"width: 13.2447%;\"><col style=\"width: 20.1064%;\"><col style=\"width: 16.7553%;\"><col style=\"width: 16.4362%;\"></colgroup><tbody><tr style=\"height: 70.7917px;\"><td colspan=\"6\" style=\"text-align: center; height: 70.7917px; border-width: 1.5px; border-color: rgb(0, 0, 0);\"><span style=\"font-size: 24pt;\" data-mce-style=\"font-size: 24pt;\"><strong>사직서﻿</strong></span></td></tr><tr style=\"height: 22.3958px;\"><td style=\"border-width: 1.5px; border-color: rgb(0, 0, 0); text-align: center; height: 22.3958px;\"><strong>소속</strong></td><td style=\"border-width: 1.5px; border-color: rgb(0, 0, 0); height: 22.3958px;\" colspan=\"2\"><strong><br></strong></td><td style=\"border-width: 1.5px; border-color: rgb(0, 0, 0); height: 22.3958px; text-align: center;\"><strong>직위</strong></td><td style=\"border-width: 1.5px; border-color: rgb(0, 0, 0); text-align: center; height: 22.3958px;\" colspan=\"2\"><strong><br></strong></td></tr><tr style=\"height: 22.3958px;\"><td style=\"border-width: 1.5px; border-color: rgb(0, 0, 0); text-align: center; height: 22.3958px;\"><strong>성명</strong></td><td style=\"border-width: 1.5px; border-color: rgb(0, 0, 0); height: 22.3958px;\" colspan=\"2\"><strong><br></strong></td><td style=\"border-width: 1.5px; border-color: rgb(0, 0, 0); height: 22.3958px; text-align: center;\"><strong>생년월일</strong></td><td style=\"border-width: 1.5px; border-color: rgb(0, 0, 0); text-align: center; height: 22.3958px;\" colspan=\"2\"><strong><br></strong></td></tr><tr style=\"height: 22.3958px;\"><td style=\"border-width: 1.5px; border-color: rgb(0, 0, 0); text-align: center; height: 22.3958px;\"><strong>입사년월일</strong></td><td style=\"border-width: 1.5px; border-color: rgb(0, 0, 0); height: 22.3958px;\" colspan=\"2\"><strong><br></strong></td><td style=\"border-width: 1.5px; border-color: rgb(0, 0, 0); height: 22.3958px; text-align: center;\"><strong>주민등록번호</strong></td><td style=\"border-width: 1.5px; border-color: rgb(0, 0, 0); text-align: center; height: 22.3958px;\" colspan=\"2\">-</td></tr><tr style=\"height: 22.3958px;\"><td style=\"border-width: 1.5px; border-color: rgb(0, 0, 0); text-align: center; height: 22.3958px;\"><strong>주소</strong></td><td style=\"border-width: 1.5px; border-color: rgb(0, 0, 0); height: 22.3958px;\" colspan=\"5\"><br data-mce-bogus=\"1\"></td></tr><tr style=\"height: 0px;\"><td style=\"height: 518px; border-width: 1.5px; border-color: rgb(0, 0, 0);\" colspan=\"6\" rowspan=\"4\"><p style=\"text-align: center;\" data-mce-style=\"text-align: center;\">상기 본인은&nbsp; &nbsp; &nbsp; 년&nbsp; &nbsp;월&nbsp; &nbsp; 일자로 일신상의 사유로</p><p style=\"text-align: center;\" data-mce-style=\"text-align: center;\">사직서를 제추하오니 조치하여 주시기 바랍니다.</p><p><br data-mce-bogus=\"1\"></p><p><br data-mce-bogus=\"1\"></p><p style=\"text-align: right;\" data-mce-style=\"text-align: right;\">년&nbsp; &nbsp;월&nbsp; &nbsp;일&nbsp; &nbsp;</p><p style=\"text-align: right;\" data-mce-style=\"text-align: right;\">신청인 :&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(인)&nbsp; &nbsp;</p></td></tr><tr style=\"height: 0px;\"></tr><tr style=\"height: 0px;\"></tr><tr style=\"height: 518px;\"></tr></tbody></table>";
		
		model.addAttribute("form", form);
		return "approval/approval_form";
	}
	
	@PostMapping("/write")
	public String writeApproval(Approval approval, Model model) {
		return null;
	}
	
	@GetMapping("/category/form")
	@ResponseBody
	public String getCategoryForm(@RequestParam(defaultValue="1") int approvalCategoryId, Model model) {
		return null;
	}
	
	
	@GetMapping("/list")
	public String getApprovalList() {
		
		return null;
	}
	
	@GetMapping("/detail")
	public String detail() {
		log.info("실행");
		return "approval/approval_detail";
	}
	
}
