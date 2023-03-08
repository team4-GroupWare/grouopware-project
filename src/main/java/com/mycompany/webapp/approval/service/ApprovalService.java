package com.mycompany.webapp.approval.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.approval.model.Approval;
import com.mycompany.webapp.approval.model.ApprovalCategory;
import com.mycompany.webapp.approval.model.ApprovalLine;
import com.mycompany.webapp.approval.repository.ApprovalRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ApprovalService implements IApprovalService {
	@Autowired
	private ApprovalRepository approvalRepository;
	

	@Override
	public List<ApprovalCategory> getCategory() {
		return approvalRepository.selectApprovalCategory();
	}

	@Transactional
	public int writeApproval(Approval approval) {
		log.info("전자결재 작성 실행");
		approvalRepository.insertApproval(approval);
		
		for(int i = 0; i < approval.getApprovalLine().size(); i++) {
			approvalRepository.insertApprovalLine(approval.getApprovalLine().get(i));
		}
		
		return 2;
	}

	@Override
	public List<Approval> getApprovalList(Pager pager, String empId, String status) {
		log.info("실행");
		return approvalRepository.selectApprovalList(pager, empId, status);
	}

	@Override
	public int getApprovalRow(String empId, String status) {
		log.info("실행");
		return approvalRepository.selectApprovalCount(empId, status);
	}

	@Override
	public Approval getApprovalDetail(int approvalId) {
		log.info("실행");
		return approvalRepository.selectApprovalDetail(approvalId);
	}

	@Override
	public String getApprovalForm(int approvalCategoryId) {
		log.info("실행");
		return approvalRepository.selectApprovalForm(approvalCategoryId);
	}

	@Override
	public List<Approval> getApprovalTempList(Pager pager, String empId) {
		log.info("실행");
		return approvalRepository.selectApprovalTempList(pager, empId);
	}

	@Override
	public int getTempApprovalRow(String empId) {
		log.info("실행");
		return approvalRepository.selectTempApprovalCount(empId);
	}

	@Override
	public ApprovalLine getApprovalLine(String empId) {
		log.info("실행");
		return approvalRepository.selectApprovalLine(empId);
	}

	//전자결재 결재선 목록
	@Override
	public List<ApprovalLine> getApprovalLineList(int approvalId) {
		log.info("실행");
		return approvalRepository.selectApprovalLineList(approvalId);
	}

	//결재문서함 상태에 따른 목록 갯수
	@Override
	public int getConfirmRow(String empId, String status) {
		log.info("실행");
		return approvalRepository.selectConfirmCount(empId, status);
	}

	//결재문서함 목록
	@Override
	public List<Approval> getConfirmList(Pager pager, String empId, String status) {
		log.info("실행");
		return approvalRepository.selectConfirmList(pager, empId, status);
	}

	//해당 문서에 대한 내 결재 순서
	@Override
	public int getMySeq(int approvalId, String empId) {
		log.info("실행");
		return approvalRepository.selectMySeq(approvalId, empId);
	}

	//문서 결재(승인, 반려)
	@Transactional
	public int confirm(ApprovalLine approvalLine) {
		int row = 0;
		String status;
		int mySeq = getMySeq(approvalLine.getApprovalId(), approvalLine.getEmpId());
		if(approvalLine.getLastSeq() == mySeq) {
			if(approvalLine.getIsApproved().equals("y")) {
				status = "승인";
			} else {
				status = "반려";
			}
		} else {
			if(approvalLine.getIsApproved().equals("y")) {
				status = "진행";
			} else {
				status = "반려";
			}
		}
		
		row = approvalRepository.updateisApproved(approvalLine);
		row += approvalRepository.updateApprovalStatus(approvalLine, status);
		return row;
	}

}
