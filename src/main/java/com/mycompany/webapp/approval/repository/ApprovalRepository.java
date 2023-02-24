package com.mycompany.webapp.approval.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mycompany.webapp.approval.model.ApprovalCategory;

@Repository
public interface ApprovalRepository {

	public List<ApprovalCategory> selectApprovalCategory();
	
}
