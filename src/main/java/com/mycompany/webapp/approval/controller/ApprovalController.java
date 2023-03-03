package com.mycompany.webapp.approval.controller;

import java.util.ArrayList;
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
import com.mycompany.webapp.group.model.Department;
import com.mycompany.webapp.group.model.Team;
import com.mycompany.webapp.group.service.IDepartmentService;
import com.mycompany.webapp.group.service.ITeamService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/approval")
public class ApprovalController {
	@Autowired
	private IDepartmentService departmentService;
	
	@Autowired
	private ITeamService teamService;
	
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
		
		//전자결재 카테고리 목록
		List<ApprovalCategory> approval_category = approvalService.getCategory();
		
		List<List<Team>> teams = new ArrayList<>();
		//부서 목록
		List<Department> departments = departmentService.getDeptList();
		
		//부서 별 팀목록
		for(Department dept : departments) {
			teams.add(teamService.getTeamListById(dept.getDeptId()));
		}
		
		//카테고리 양식
		String form = approvalService.getApprovalForm(1);
		
		model.addAttribute("departments", departments);
		model.addAttribute("teams", teams);
		model.addAttribute("approval_category", approval_category);
		model.addAttribute("form", form);
		
		return "approval/approval_form";
	}
	
	/**
	 * 전자결재 작성
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
	
	/**
	 * 전자결재 카테고리별 작성 양식 불러오기
	 * @author : LEEJIHO
	 * @param approvalCategoryId
	 * @param model
	 * @return
	 */
	@GetMapping(value="/categoryform", produces="application/text; charset=UTF-8")
	@ResponseBody
	public String getCategoryForm(@RequestParam(defaultValue="1") int approvalCategoryId, Model model) {
		log.info("실행");
		return approvalService.getApprovalForm(approvalCategoryId);
	}
	
	/**
	 * 전자결재 목록
	 * @author : LEEJIHO
	 * @param pageNo
	 * @param status : 
	 * @param model
	 * @param session
	 * @return
	 */
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
	
	@GetMapping("/templist")
	public String getApprovalTempList(@RequestParam(defaultValue="1") int pageNo, Model model, HttpSession session) {
		log.info("실행");
		Employee loginEmp = (Employee) session.getAttribute("loginEmployee");
		String empId = loginEmp.getEmpId();
		
		int approvalRow = approvalService.getTempApprovalRow(empId);
		Pager pager = new Pager(10, 5, approvalRow, pageNo);
		
		List<Approval> approvals = approvalService.getApprovalTempList(pager, empId);
		
		model.addAttribute("approvals", approvals);
		model.addAttribute("pager", pager);
		
		return "approval/approval_templist";
	}
	/**
	 * 전자결재 상세보기
	 * @author : LEEJIHO
	 * @param approvalId
	 * @param pageNo
	 * @param status
	 * @param model
	 * @return
	 */
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
