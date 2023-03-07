package com.mycompany.webapp.approval.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.approval.model.Approval;
import com.mycompany.webapp.approval.model.ApprovalCategory;
import com.mycompany.webapp.approval.model.ApprovalLine;

@Repository
public interface ApprovalRepository {
	//전자결재 카테고리 목록
	public List<ApprovalCategory> selectApprovalCategory();
	//전자결재 작성
	public int insertApproval(Approval approval);

	//전자결재 상태별 갯수
	public int selectApprovalCount(@Param("empId") String empId, @Param("status") String status);
	//전자결재 목록
	public List<Approval> selectApprovalList(@Param("pager") Pager pager, @Param("empId") String empId, @Param("status") String status);
	//전자결재 임시저장 갯수
	public int selectTempApprovalCount(String empId);
	//전자결재 임시저장 목록
	public List<Approval> selectApprovalTempList(@Param("pager")Pager pager, @Param("empId") String empId);
	//전자결재 상세보기
	public Approval selectApprovalDetail(int approvalId);
	//전자결재 카테고리 양식
	public String selectApprovalForm(int approvalCategoryId);
	//전자결재 결재선 사원정보
	public ApprovalLine selectApprovalLine(String empId);
	//전자결재 결재선 저장
	public int insertApprovalLine(ApprovalLine approvalLine);
	
}
