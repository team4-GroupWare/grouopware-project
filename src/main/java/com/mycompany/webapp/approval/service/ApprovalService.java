package com.mycompany.webapp.approval.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.approval.model.Approval;
import com.mycompany.webapp.approval.model.ApprovalCategory;
import com.mycompany.webapp.approval.repository.ApprovalRepository;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ApprovalService implements IApprovalService {
	@Autowired
	private ApprovalRepository approvalRepository;
	
	/**
	 * 전자결재 카테고리 목록
	 * @author : LEEJIHO
	 * @return 전자결재 카테고리 목록
	 */
	@Override
	public List<ApprovalCategory> getCategory() {
		return approvalRepository.selectApprovalCategory();
	}

	@Override
	public int writeApproval(Approval approval) {
		log.info("실행");
		return approvalRepository.insertApproval(approval);
		
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


	
}
