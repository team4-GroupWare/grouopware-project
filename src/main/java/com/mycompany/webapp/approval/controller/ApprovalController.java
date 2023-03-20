package com.mycompany.webapp.approval.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.approval.model.Approval;
import com.mycompany.webapp.approval.model.ApprovalCategory;
import com.mycompany.webapp.approval.model.ApprovalFile;
import com.mycompany.webapp.approval.model.ApprovalLine;
import com.mycompany.webapp.approval.model.RefEmployee;
import com.mycompany.webapp.approval.service.IApprovalService;
import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.component.Uri;
import com.mycompany.webapp.employee.model.Employee;
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
	private IEmployeeService employeeService;
	
	@Autowired
	private ITeamService teamService;
	
	@Autowired
	private IApprovalService approvalService;
	
	/**
	 * 전자결재 카테고리별 작성 양식 불러오기
	 * @author : LEEJIHO
	 * @param approvalCategoryId : 결재양식 카테고리 아이디
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
	 * 전자결재 작성 폼 불러오기
	 * @author : LEEJIHO
	 * @param model
	 * @return : approval/approval_form.jsp
	 */
	@GetMapping("/write")
	public String getApprovalForm(Model model, HttpSession session) {
		log.info("실행");
		Employee loginEmp = (Employee) session.getAttribute("loginEmployee");
		
		//전자결재 카테고리 목록
		List<ApprovalCategory> approval_category = approvalService.getCategory();
		
		List<List<Team>> teams = new ArrayList<>();
		//부서 목록
		List<Department> departments = departmentService.getDeptList();
		
		//부서 별 팀목록
		for(Department dept : departments) {
			teams.add(teamService.getTeamListById(dept.getDeptId()));
		}
		
		if(loginEmp.getManagerId() != null) {
			//manager 정보
			Employee manager = employeeService.getEmp(loginEmp.getManagerId());
			model.addAttribute("manager", manager);
		} else {
			model.addAttribute("manager", null);
		}
		
		//카테고리 양식
		String form = approvalService.getApprovalForm(1);
		
		model.addAttribute("departments", departments);
		model.addAttribute("teams", teams);
		model.addAttribute("approval_category", approval_category);
		model.addAttribute("form", form);
		
		return "approval/approval_writeform";
	}
	
	/**
	 * 전자결재 작성
	 * @author : LEEJIHO
	 * @param approval : 전자결재 VO
	 * @param model
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/write", produces="application/json")
	public Uri writeApproval(@ModelAttribute Approval approval, Model model) {
		log.info("실행");
		if(approval.getTitle() == null) {
			approval.setTitle("(제목없음)");
		}
		
		if(approval.getApprovalLine() != null) {
			for(int i = 0; i < approval.getApprovalLine().size(); i++) {
				approval.getApprovalLine().get(i).setSeq(i+1);
			}
		}
		approvalService.writeApproval(approval);
		
		Uri uri = new Uri();
		if(approval.getTempApproval().equals("y")) { //임시저장일 경우 임시저장 목록으로 return
			uri.setUri("/approval/templist");
		} else if (approval.getTempApproval().equals("n")) { //제출일 경우 내 문서함 목록으로 return
			uri.setUri("/approval/mylist");
		}
		
		return uri;
	}
	
	/**
	 * 임시저장 수정 폼
	 * @author : LEEJIHO
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("/tempForm")
	public String getApprovalTempForm(@RequestParam int approvalId, Model model, HttpSession session) {
		log.info("실행");
		Employee loginEmp = (Employee) session.getAttribute("loginEmployee");
		
		//전자결재 카테고리 목록
		List<ApprovalCategory> approval_category = approvalService.getCategory();
		
		List<List<Team>> teams = new ArrayList<>();
		//부서 목록
		List<Department> departments = departmentService.getDeptList();
		
		//부서 별 팀목록
		for(Department dept : departments) {
			teams.add(teamService.getTeamListById(dept.getDeptId()));
		}
		
		if(loginEmp.getManagerId() != null) {
			//manager 정보
			Employee manager = employeeService.getEmp(loginEmp.getManagerId());
			model.addAttribute("manager", manager);
		} else {
			model.addAttribute("manager", null);
		}
		
		//임시저장한 내용 불러오기
		Approval approval = approvalService.getApprovalDetail(approvalId);
		//카테고리 양식
		String form = approvalService.getApprovalForm(approval.getApprovalCategoryId());
		//전자결재 결재선 리스트
		List<ApprovalLine> approvalLines = approvalService.getApprovalLineList(approvalId);
		
		model.addAttribute("departments", departments);
		model.addAttribute("teams", teams);
		model.addAttribute("approval_category", approval_category);
		model.addAttribute("form", form);
		model.addAttribute("approval", approval);
		model.addAttribute("approvalLines", approvalLines);
		
		return "approval/approval_tempform";
	}
	
	/**
	 * 임시저장 수정
	 * @author : LEEJIHO
	 * @param approval : 전자결재
	 * @param model
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/updateTemp", produces="application/json")
	public Uri updateTempApproval(@ModelAttribute Approval approval, Model model) {
		log.info("updateTempApproval실행");
		
		if(approval.getApprovalLine() != null) {
			for(int i = 0; i < approval.getApprovalLine().size(); i++) {
				approval.getApprovalLine().get(i).setSeq(i+1);
				approval.getApprovalLine().get(i).setApprovalId(approval.getApprovalId());
			}
		}
		
		approvalService.updateApproval(approval);

		Uri uri = new Uri();	
		if(approval.getTempApproval().equals("y")) { //임시저장일 경우 임시저장 목록으로 return
			uri.setUri("/approval/templist");
		} else if (approval.getTempApproval().equals("n")) { //제출일 경우 내 문서함 목록으로 return
			uri.setUri("/approval/mylist");
		}
		//log.info("uri : " + uri);
		return uri;
	}
	
	/**
	 * 선택한 결재선 사원 정보
	 * @author : LEEJIHO
	 * @param line : 선택한 결재선 목록
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
	@GetMapping({"/mylist", "/mylist/{approvalCategoryId}"})
	public String getMyApprovalList(@PathVariable(required = false) Integer approvalCategoryId, @RequestParam(defaultValue="1") int pageNo, @RequestParam(value="status", defaultValue="") String status, Model model, HttpSession session) {
		Employee loginEmp = (Employee) session.getAttribute("loginEmployee");
		String empId = loginEmp.getEmpId();
		
		if(approvalCategoryId == null) {
			approvalCategoryId = 0;
		}
		
		int approvalRow = approvalService.getApprovalRow(empId, status, approvalCategoryId);
		Pager pager = new Pager(10, 5, approvalRow, pageNo);
		
		//전자결재 목록
		List<Approval> approvals = approvalService.getApprovalList(pager, empId, status, approvalCategoryId);
		//전자결재 카테고리 목록
		List<ApprovalCategory> approval_category = approvalService.getCategory();
				
		model.addAttribute("approvals", approvals);
		model.addAttribute("pager", pager);
		model.addAttribute("status", status);
		model.addAttribute("approval_category", approval_category);
		model.addAttribute("approvalCategoryId", approvalCategoryId);
		
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
	@GetMapping({"/confirmlist", "/confirmlist/{approvalCategoryId}"})
	public String getApprovalList(@PathVariable(required = false) Integer approvalCategoryId, @RequestParam(defaultValue="1") int pageNo, @RequestParam(value="status", defaultValue="") String status, Model model, HttpSession session) {
		log.info("실행");
		Employee loginEmp = (Employee) session.getAttribute("loginEmployee");
		String empId = loginEmp.getEmpId();
		
		if(approvalCategoryId == null) {
			approvalCategoryId = 0;
		}
		
		int confirmRow = approvalService.getConfirmRow(empId, status, approvalCategoryId);
		Pager pager = new Pager(10, 5, confirmRow, pageNo);
		
		List<Approval> approvals = approvalService.getConfirmList(pager, empId, status, approvalCategoryId);
		//전자결재 카테고리 목록
		List<ApprovalCategory> approval_category = approvalService.getCategory();
		
		model.addAttribute("approvals", approvals);
		model.addAttribute("pager", pager);
		model.addAttribute("status", status);
		model.addAttribute("approval_category", approval_category);
		model.addAttribute("approvalCategoryId", approvalCategoryId);
		
		return "approval/approval_confirmlist";
	}
	
	/**
	 * 임시저장 목록
	 * @author : LEEJIHO
	 * @param pageNo : 현재 페이지
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping({"/templist", "/templist/{approvalCategoryId}"})
	public String getApprovalTempList(@PathVariable(required = false) Integer approvalCategoryId, @RequestParam(defaultValue="1") int pageNo, Model model, HttpSession session) {
		log.info("실행");
		Employee loginEmp = (Employee) session.getAttribute("loginEmployee");
		String empId = loginEmp.getEmpId();
		
		if(approvalCategoryId == null) {
			approvalCategoryId = 0;
		}
		
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
	 * @param approvalId : 전자결재 문서 아이디
	 * @param pageNo : 현재 페이지
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
		//전자결재 문서 참조 사원 정보
		RefEmployee refEmp = approvalService.getReferEmpInfo(approvalId);
		
		//전자결재 결재선 리스트
		List<ApprovalLine> approvalLines = approvalService.getApprovalLineList(approvalId);
		//전자결재 문서의 첨부파일 목록
		List<ApprovalFile> approvalFiles = approvalService.getApprovalFileList(approvalId);
		
		//해당 전자결재 문서에 대한 내 결재 순서
		int mySeq = approvalService.getMySeq(approvalId, empId) - 1;
		int myTurn = 0; //0: 내 결재순서, 1: 내 결재순서가 아님
		
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

		model.addAttribute("pageNo", pageNo);
		model.addAttribute("status", status);
		model.addAttribute("approval", approval);
		model.addAttribute("approvalLines", approvalLines);
		model.addAttribute("approvalFiles", approvalFiles);
		model.addAttribute("mySeq", mySeq);
		model.addAttribute("myTurn", myTurn);
		model.addAttribute("refEmp", refEmp);
		
		return "approval/approval_detail";
	}
	
	/**
	 * 전자결재 승인, 반려 처리
	 * @author : LEEJIHO
	 * @param approvalLine : 전자결재 결재선
	 * @param session
	 * @return
	 */
	@PostMapping("/confirm")
	public String confirm(ApprovalLine approvalLine, Approval approval, HttpSession session) {
		Employee loginEmp = (Employee) session.getAttribute("loginEmployee");
		String empId = loginEmp.getEmpId();
		approvalLine.setEmpId(empId);
		
		approvalService.confirm(approvalLine, approval);
		
		return "redirect:/approval/confirmlist";
	}
	
	/**
	 * 전자결재 파일 다운로드
	 * @author : LEEJIHO
	 * @param userAgent
	 * @param approvalFileId
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@GetMapping("/filedownload")
	public ResponseEntity<byte[]> fileDownLoad(@RequestHeader("User-Agent") String userAgent, @RequestParam("approvalFileId") int approvalFileId) throws UnsupportedEncodingException {
		log.info("실행");
		ApprovalFile approvalFile = approvalService.getFile(approvalFileId);
		final HttpHeaders headers = new HttpHeaders();
		
		String[] mtypes = approvalFile.getApprovalFileContentType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
		headers.setContentLength(approvalFile.getApprovalFileSize());
		
		String fileName = URLEncoder.encode(approvalFile.getApprovalFileName(), "UTF-8");
		fileName = fileName.replaceAll("\\+", "%20");
		headers.setContentDispositionFormData("attachment", fileName);
		
		return new ResponseEntity<byte[]>(approvalFile.getApprovalFileData(), headers, HttpStatus.OK);
	}
	
	/**
	 * 전자결재 참조함 목록
	 * @author : LEEJIHO
	 * @param pageNo : 현재 페이지
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("/reflist")
	public String getApprovalRefList(@RequestParam(defaultValue="1") int pageNo, Model model, HttpSession session) {
		log.info("실행");
		Employee loginEmp = (Employee) session.getAttribute("loginEmployee");
		String empId = loginEmp.getEmpId();
		
		int approvalRow = approvalService.getRefApprovalRow(empId);
		Pager pager = new Pager(10, 5, approvalRow, pageNo);
		
		//전자결재 참조함 목록
		List<Approval> approvals = approvalService.getRefApprovalList(pager, empId);
		//전자결재 카테고리 목록
		List<ApprovalCategory> approval_category = approvalService.getCategory();
				
		model.addAttribute("approvals", approvals);
		model.addAttribute("pager", pager);
		model.addAttribute("approval_category", approval_category);
		
		return "approval/approval_reflist";
	}
	
	/**
	 * 전자결재 문서 삭제
	 * @author : LEEJIHO
	 * @param approvalId
	 * @return
	 */
	@PostMapping("/delete")
	public String deleteApproval(@RequestParam("approvalId") int[] approvalId) {
		log.info("deleteApproval실행");
		for(int i = 0; i < approvalId.length; i++) {
			log.info("approvalId : " + approvalId[i]);
			approvalService.deleteApproval(approvalId[i]);
		}
		
		return "redirect:/approval/templist";
	}
}
