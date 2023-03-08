package com.mycompany.webapp.approval.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.approval.model.Approval;
import com.mycompany.webapp.approval.model.ApprovalCategory;
import com.mycompany.webapp.approval.model.ApprovalLine;
import com.mycompany.webapp.approval.service.IApprovalService;
import com.mycompany.webapp.employee.model.Employee;
import com.mycompany.webapp.employee.service.EmployeeService;
import com.mycompany.webapp.employee.service.IEmployeeService;
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
	public String writeApproval(@ModelAttribute Approval approval, Model model) {
		log.info("실행");
		
		for(int i = 0; i < approval.getApprovalLine().size(); i++) {
			approval.getApprovalLine().get(i).setSeq(i+1);
		}
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
	 * 선택한 결재선 사원 정보
	 * @author : LEEJIHO
	 * @param line
	 * @param model
	 * @return
	 */
	@PostMapping(value="/employee")
	@ResponseBody
	public List<ApprovalLine> getEmployeeInfo(@RequestParam(value="line[]") String[] line, Model model) {
		log.info("실행");
		
		List<ApprovalLine> approvalLines = new ArrayList<>();
		
		for(int i = 0; i < line.length; i++) {
			ApprovalLine approvalLine = approvalService.getApprovalLine(line[i]);
			approvalLine.setSeq(i+1);
			approvalLines.add(approvalLine);
		}
		
		return approvalLines;
	}
	
	/**
	 * 전자결재 내 문서함(내가 작성한 기안들) 목록
	 * @author : LEEJIHO
	 * @param pageNo : 현재 페이지
	 * @param status : 승인 상태
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("/mylist")
	public String getMyApprovalList(@RequestParam(defaultValue="1") int pageNo, @RequestParam(value="status", defaultValue="") String status, Model model, HttpSession session) {
		log.info("실행");
		Employee loginEmp = (Employee) session.getAttribute("loginEmployee");
		String empId = loginEmp.getEmpId();
		
		int approvalRow = approvalService.getApprovalRow(empId, status);
		Pager pager = new Pager(10, 5, approvalRow, pageNo);
		
		List<Approval> approvals = approvalService.getApprovalList(pager, empId, status);
		//전자결재 카테고리 목록
		List<ApprovalCategory> approval_category = approvalService.getCategory();
				
		model.addAttribute("approvals", approvals);
		model.addAttribute("pager", pager);
		model.addAttribute("status", status);
		model.addAttribute("approval_category", approval_category);
		
		return "approval/approval_mylist";
	}
	
	/**
	 * 전자결재 결재문서함(내가 결재해야하는 문서들) 목록
	 * @author : LEEJIHO
	 * @param pageNo : 현재 페이지
	 * @param status : 승인 상태
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("/list")
	public String getApprovalList(@RequestParam(defaultValue="1") int pageNo, @RequestParam(value="status", defaultValue="") String status, Model model, HttpSession session) {
		log.info("실행");
		Employee loginEmp = (Employee) session.getAttribute("loginEmployee");
		String empId = loginEmp.getEmpId();
		
		int confirmRow = approvalService.getConfirmRow(empId, status);
		Pager pager = new Pager(10, 5, confirmRow, pageNo);
		
		List<Approval> approvals = approvalService.getConfirmList(pager, empId, status);
		//전자결재 카테고리 목록
		List<ApprovalCategory> approval_category = approvalService.getCategory();
		
		model.addAttribute("approvals", approvals);
		model.addAttribute("pager", pager);
		model.addAttribute("status", status);
		model.addAttribute("approval_category", approval_category);
		
		return "approval/approval_list";
	}
	
	/**
	 * 임시저장 목록
	 * @author : LEEJIHO
	 * @param pageNo
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("/templist")
	public String getApprovalTempList(@RequestParam(defaultValue="1") int pageNo, Model model, HttpSession session) {
		log.info("실행");
		Employee loginEmp = (Employee) session.getAttribute("loginEmployee");
		String empId = loginEmp.getEmpId();
		
		int approvalRow = approvalService.getTempApprovalRow(empId);
		Pager pager = new Pager(10, 5, approvalRow, pageNo);
		
		List<Approval> approvals = approvalService.getApprovalTempList(pager, empId);
		//전자결재 카테고리 목록
		List<ApprovalCategory> approval_category = approvalService.getCategory();
				
		model.addAttribute("approvals", approvals);
		model.addAttribute("pager", pager);
		model.addAttribute("approval_category", approval_category);
		
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
	public String detail(@RequestParam int approvalId, @RequestParam int pageNo, @RequestParam() String status, Model model, HttpSession session) {
		log.info("실행");
		Employee loginEmp = (Employee) session.getAttribute("loginEmployee");
		String empId = loginEmp.getEmpId();
		
		//전자결재 문서 상세 정보
		Approval approval = approvalService.getApprovalDetail(approvalId);
		//전자결재 결재선 리스트
		List<ApprovalLine> approvalLines = approvalService.getApprovalLineList(approval.getApprovalId());
		//해당 전자결재 문서에 대한 내 결재 순서
		int mySeq = approvalService.getMySeq(approvalId, empId) - 1;
		int myTurn = 0;
		
		for(int i = 0; i < approvalLines.size(); i++) {
			if(mySeq == -1) { //결재선이 아닐 때
				myTurn = 0;
				break;
			} else if(mySeq == 0) { //첫번째 순서일때
				if(approvalLines.get(mySeq).getIsApproved() == null) {
					myTurn = 1;
					break;
				}
				if(approvalLines.get(mySeq).getIsApproved() != null) {
					myTurn = 0;
					break;
				}
			} else if(!approval.getStatus().equals("승인") &&
					!approval.getStatus().equals("반려") &&
					approvalLines.get(mySeq-1).getIsApproved() != null && 
					approvalLines.get(mySeq).getIsApproved() == null) { //첫번째 순서가 아닐때
				myTurn = 1;
			}
		}
		
		log.info(myTurn);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("status", status);
		model.addAttribute("approval", approval);
		model.addAttribute("approvalLines", approvalLines);
		model.addAttribute("mySeq", mySeq);
		model.addAttribute("myTurn", myTurn);
		
		return "approval/approval_detail";
	}
	
	@PostMapping("/confirm")
	public String confirm(ApprovalLine approvalLine, HttpSession session) {
		Employee loginEmp = (Employee) session.getAttribute("loginEmployee");
		String empId = loginEmp.getEmpId();
		approvalLine.setEmpId(empId);
		
		approvalService.confirm(approvalLine);
		
		return "redirect:/approval/list";
	}
	
}
