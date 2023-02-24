package com.mycompany.webapp.approval.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.approval.model.ApprovalCategory;
import com.mycompany.webapp.approval.repository.ApprovalRepository;

@Service
public class ApprovalService implements IApprovalService {
	@Autowired
	private ApprovalRepository approvalRepository;
	
	/**
	 * 전자결재 카테고리 목록
	 * @author : LEEJIHO
	 * @return
	 */
	@Override
	public List<ApprovalCategory> getCategory() {
		return approvalRepository.selectApprovalCategory();
	}
	
}
