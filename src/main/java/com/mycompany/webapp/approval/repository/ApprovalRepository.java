package com.mycompany.webapp.approval.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.approval.model.Approval;
import com.mycompany.webapp.approval.model.ApprovalCategory;
import com.mycompany.webapp.approval.model.ApprovalFile;
import com.mycompany.webapp.approval.model.ApprovalLine;
import com.mycompany.webapp.approval.model.RefEmployee;
import com.mycompany.webapp.component.Pager;

@Repository
public interface ApprovalRepository {
	//전자결재 카테고리 목록
	public List<ApprovalCategory> selectApprovalCategory();
	//전자결재 작성
	public int insertApproval(Approval approval);
	//전자결재 파일
	public int insertApprovalFile(ApprovalFile file);

	//전자결재  내 문서함 상태별 갯수
	public int selectApprovalCount(@Param("empId") String empId, @Param("status") String status, @Param("approvalCategoryId") int approvalCategoryId);
	
	/**
	 * 결재문서함 상태별 갯수
	 * @author : LEEJIHO
	 * @param empId
	 * @param status
	 * @return
	 */
	public int selectConfirmCount(@Param("empId") String empId, @Param("status") String status, @Param("approvalCategoryId") int approvalCategoryId);
	
	/**
	 * 결재문서함 목록
	 * @author : LEEJIHO
	 * @param pager
	 * @param empId
	 * @param status
	 * @param approvalCategoryId
	 * @return
	 */
	public List<Approval> selectApprovalList(@Param("pager") Pager pager, @Param("empId") String empId, 
						@Param("status") String status, @Param("approvalCategoryId") int approvalCategoryId);
	
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
	
	/**
	 * 전자결재 결재선 목록
	 * @author : LEEJIHO
	 * @param approvalId
	 */
	public List<ApprovalLine> selectApprovalLineList(int approvalId);
	
	/**
	 * 결재문서함 목록
	 * @author : LEEJIHO
	 * @param pager
	 * @param empId
	 * @param status
	 * @return
	 */
	public List<Approval> selectConfirmList(@Param("pager") Pager pager, @Param("empId") String empId, 
				@Param("status") String status, @Param("approvalCategoryId") int approvalCategoryId);
	
	/**
	 * 해당 문서에 대한 내 결재 순서
	 * @author : LEEJIHO
	 * @param approvalId
	 * @param empId
	 * @return
	 */
	public int selectMySeq(@Param("approvalId") int approvalId, @Param("empId") String empId);
	
	/**
	 * 결재선 승인, 반려 update
	 * @author : LEEJIHO
	 * @param approvalLine
	 * @return
	 */
	public int updateisApproved(ApprovalLine approvalLine);
	
	/**
	 * 전자결재 문서 상태 update
	 * @author : LEEJIHO
	 * @param approvalLine
	 * @param status
	 * @return
	 */
	public int updateApprovalStatus(@Param("approvalLine") ApprovalLine approvalLine, @Param("status") String status);
	
	/**
	 * 해당 문서에 대한 첨부파일 목록
	 * @author : LEEJIHO
	 * @param approvalId
	 * @return
	 */
	public List<ApprovalFile> selectApprovalFileList(int approvalId);
	
	/**
	 * 전자결재 파일 정보
	 * @author : LEEJIHO
	 * @param approvalFileId
	 * @return
	 */
	public ApprovalFile selectApprovalFile(int approvalFileId);
	
	/**
	 * 전자결재 참조 문서 갯수
	 * @author : LEEJIHO
	 * @param empId
	 * @return
	 */
	public int selectRefApprovalCount(String empId);
	
	/**
	 * 전자결재 참조 목록
	 * @author : LEEJIHO
	 * @param pager
	 * @param empId
	 * @return
	 */
	public List<Approval> selectRefApprovalList(@Param("pager")Pager pager, @Param("empId") String empId);
	
	/**
	 * 전자결재 문서 참조 사원 정보
	 * @author : LEEJIHO
	 * @param approvalId
	 * @return
	 */
	public RefEmployee selectRefEmployeeByApprovalId(int approvalId);
	
	/**
	 * 전자결재 문서 수정 (임시저장 수정 및 제출)
	 * @author : LEEJIHO
	 * @param approval
	 */
	public void updateApproval(Approval approval);
	
	/**
	 * 전자결재선 삭제
	 * @author : LEEJIHO
	 * @param approvalId
	 * @return
	 */
	public int deleteApprovalLine(int approvalId);
	
	/**
	 * 전자결재 문서 삭제
	 * @author : LEEJIHO
	 * @param approvalId
	 * @return
	 */
	public int deleteApproval(int approvalId);
	
}
