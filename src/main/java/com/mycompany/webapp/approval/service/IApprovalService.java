package com.mycompany.webapp.approval.service;

import java.util.List;

import com.mycompany.webapp.approval.model.Approval;
import com.mycompany.webapp.approval.model.ApprovalCategory;

public interface IApprovalService {
	
	//전자결재 카테고리 목록
	public List<ApprovalCategory> getCategory();

	//전자결재 작성
	public int writeApproval(Approval approval);

	//전자결재 목록
	public List<Approval> getApprovalList();

	//전자결재 상태에 따른 목록 갯수
	public int getApprovalRow(String empId, String status);

}
