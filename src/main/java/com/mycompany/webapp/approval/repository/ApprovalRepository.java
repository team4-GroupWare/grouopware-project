package com.mycompany.webapp.approval.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.approval.model.Approval;
import com.mycompany.webapp.approval.model.ApprovalCategory;

@Repository
public interface ApprovalRepository {

	public List<ApprovalCategory> selectApprovalCategory();

	public int insertApproval(Approval approval);

	//전자결재 상태별 갯수
	public int selectApprovalCount(@Param("empId") String empId, @Param("status") String status);
	//전자결재 목록
	public List<Approval> selectApprovalList(@Param("pager") Pager pager, @Param("empId") String empId, @Param("status") String status);
	//전자결재 상세보기
	public Approval selectApprovalDetail(int approvalId);
	//전자결재 카테고리 양식
	public String selectApprovalForm(int approvalCategoryId);
	
}
