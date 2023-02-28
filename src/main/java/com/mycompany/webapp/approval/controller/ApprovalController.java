package com.mycompany.webapp.approval.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.approval.model.Approval;
import com.mycompany.webapp.approval.model.ApprovalCategory;
import com.mycompany.webapp.approval.service.IApprovalService;
import com.mycompany.webapp.employee.model.Employee;

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
	 * @return : approval/approval_form.jsp
	 */
	@GetMapping("/write")
	public String getApprovalForm(Model model) {
		log.info("실행");
		
		List<ApprovalCategory> approval_category = approvalService.getCategory();
		//log.info(approval_category);
		
		model.addAttribute("approval_category", approval_category);
		String form = "<table border=\"1\" style=\"border-collapse: collapse; width: 100%; height: 397.438px; border-width: 1.5px; border-color: rgb(0, 0, 0);\"><colgroup><col style=\"width: 16.7464%;\"><col style=\"width: 16.7464%;\"><col style=\"width: 16.7464%;\"><col style=\"width: 16.7464%;\"><col style=\"width: 16.7464%;\"><col style=\"width: 16.2679%;\"></colgroup><tbody><tr style=\"height: 70.7969px;\"><td colspan=\"6\" style=\"text-align: center; height: 70.7969px; border-width: 1.5px; border-color: rgb(0, 0, 0);\"><span style=\"font-size: 24pt;\" data-mce-style=\"font-size: 24pt;\"><strong>기안서</strong></span></td></tr><tr style=\"height: 22.3906px;\"><td style=\"height: 22.3906px; border-width: 1.5px; border-color: rgb(0, 0, 0); text-align: center;\"><strong>기안부서</strong></td><td style=\"height: 22.3906px; border-width: 1.5px; border-color: rgb(0, 0, 0);\"><br></td><td style=\"height: 22.3906px; border-width: 1.5px; border-color: rgb(0, 0, 0); text-align: center;\"><strong>기안자</strong></td><td style=\"height: 22.3906px; border-width: 1.5px; border-color: rgb(0, 0, 0);\"><br></td><td style=\"height: 22.3906px; border-width: 1.5px; border-color: rgb(0, 0, 0); text-align: center;\"><strong>기안일</strong></td><td style=\"height: 22.3906px; border-width: 1.5px; border-color: rgb(0, 0, 0);\">23.</td></tr><tr style=\"height: 0px;\"><td style=\"height: 304.25px; border-width: 1.5px; border-color: rgb(0, 0, 0);\" colspan=\"6\" rowspan=\"4\"><table border=\"1\" style=\"border-collapse: collapse; width: 100.621%; height: 136px;\"><colgroup><col style=\"width: 17.532%;\"><col style=\"width: 32.3044%;\"><col style=\"width: 15.4217%;\"><col style=\"width: 34.7394%;\"></colgroup><tbody><tr><td style=\"text-align: center;\"><strong>문서&nbsp;번호</strong> </td><td><br></td><td style=\"text-align: center;\"><strong>기안부서</strong></td><td><br></td></tr><tr><td style=\"text-align: center;\"><strong>분류</strong></td><td><br></td><td style=\"text-align: center;\"><strong>협조부서</strong></td><td><br></td></tr><tr><td style=\"text-align: center;\"><strong>제목</strong></td><td colspan=\"3\"><br></td></tr><tr><td colspan=\"4\"><p>관련 사항을 아래와 같이 기안&nbsp;하오니&nbsp;검토 후 재가&nbsp;바랍니다.</p><p>-&nbsp;아&nbsp;래&nbsp;-</p><p>1.</p><p><br data-mce-bogus=\"1\"></p><p><br data-mce-bogus=\"1\"></p><p>3.&nbsp;적용시점&nbsp;:&nbsp;결재 후&nbsp;즉시&nbsp;.</p><p><br data-mce-bogus=\"1\"></p><p><br data-mce-bogus=\"1\"></p><p><br data-mce-bogus=\"1\"></p><p><br data-mce-bogus=\"1\"></p><p>4.&nbsp;첨부.</p><p><br data-mce-bogus=\"1\"></p><p><br data-mce-bogus=\"1\"></p><p><br data-mce-bogus=\"1\"></p><p style=\"text-align: center;\" data-mce-style=\"text-align: center;\">-&nbsp;이 상&nbsp;-</p></td></tr></tbody></table></td></tr><tr style=\"height: 0px;\"></tr><tr style=\"height: 0px;\"></tr><tr style=\"height: 304.25px;\"></tr></tbody></table>\r\n";
		
		model.addAttribute("form", form);
		return "approval/approval_form";
	}
	
	/**
	 * 
	 * @author : LEEJIHO
	 * @param approval : 전자결재 VO
	 * @param model
	 * @return
	 */
	@PostMapping("/write")
	public String writeApproval(Approval approval, Model model) {
		log.info("실행");
		approvalService.writeApproval(approval);
		
		return "redirect:/approval/write";
	}
	
	@GetMapping("/categoryform")
	@ResponseBody
	public String getCategoryForm(@RequestParam(defaultValue="1") int approvalCategoryId, Model model) {
		return null;
	}
	
	
	@GetMapping("/list")
	public String getApprovalList(@RequestParam(defaultValue="1") int pageNo, @RequestParam(value="status", defaultValue="") String status, Model model, HttpSession session) {
		log.info("실행");
		Employee loginEmp = (Employee) session.getAttribute("loginEmployee");
		String empId = loginEmp.getEmpId();
		
		int approvalRow = approvalService.getApprovalRow(empId, status);
		Pager pager = new Pager(10, 5, approvalRow, pageNo);
		
		List<Approval> approvals = approvalService.getApprovalList(pager, empId, status);
		
		model.addAttribute("approvals", approvals);
		model.addAttribute("pager", pager);
		model.addAttribute("status", status);
		
		return "approval/approval_list";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int approvalId, @RequestParam int pageNo, @RequestParam() String status, Model model) {
		log.info("실행");
		
		Approval approval = approvalService.getApprovalDetail(approvalId);
		
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("status", status);
		model.addAttribute("approval", approval);
		
		return "approval/approval_detail";
	}
	
}
