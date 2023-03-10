package com.mycompany.webapp.approval.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.approval.model.Approval;
import com.mycompany.webapp.approval.model.ApprovalCategory;
import com.mycompany.webapp.approval.model.ApprovalFile;
import com.mycompany.webapp.approval.model.ApprovalLine;
import com.mycompany.webapp.approval.model.RefEmployee;

public interface IApprovalService {
	
	//전자결재 카테고리 목록
	public List<ApprovalCategory> getCategory();

	//전자결재 카테고리 별 작성양식 불러오기
	public String getApprovalForm(int approvalCategoryId);
		
	//전자결재 작성
	public int writeApproval(Approval approval);
	
	//내 문서함 목록
	public List<Approval> getApprovalList(Pager pager, String empId, String status, int approvalCategoryId);

	//내 문서함 상태에 따른 목록 갯수
	public int getApprovalRow(String empId, String status, int approvalCategoryId);

	//전자결재 상세보기
	public Approval getApprovalDetail(int approvalId);

	//전자결재 임시저장 목록
	public List<Approval> getApprovalTempList(Pager pager, String empId);

	//전자결재 임시저장 갯수
	public int getTempApprovalRow(String empId);

	//전자결재 결재선 선택 시 사원정보
	public ApprovalLine getApprovalLine(String empId);

	/**
	 * 전자결재 결재선 목록
	 * @author : LEEJIHO
	 * @param approvalId : 해당 문서 아이디
	 * @return List<ApprovalLine> : 결재선 목록
	 */
	public List<ApprovalLine> getApprovalLineList(int approvalId);

	/**
	 * 결재문서함 상태에 따른 목록 갯수
	 * @author : LEEJIHO
	 * @param empId
	 * @param status
	 * @return
	 */
	public int getConfirmRow(String empId, String status, int approvalCategoryId);

	/**
	 * 결재문서함 목록
	 * @author : LEEJIHO
	 * @param pager
	 * @param empId
	 * @param status
	 * @return
	 */
	public List<Approval> getConfirmList(Pager pager, String empId, String status, int approvalCategoryId);

	/**
	 * 해당 문서에 대한 내 결재 순서
	 * @author : LEEJIHO
	 * @param approvalId
	 * @param empId
	 * @return
	 */
	public int getMySeq(int approvalId, String empId);

	/**
	 * 문서 결재
	 * @author : LEEJIHO
	 * @param approvalLine
	 */
	public int confirm(ApprovalLine approvalLine);

	/**
	 * 해당 문서에 대한 첨부파일 목록
	 * @author : LEEJIHO
	 * @param approvalId
	 * @return
	 */
	public List<ApprovalFile> getApprovalFileList(int approvalId);

	/**
	 * 전자결재 파일 정보
	 * @author : LEEJIHO
	 * @param approvalFileId
	 * @return
	 */
	public ApprovalFile getFile(int approvalFileId);

	/**
	 * 전자결재 참조 문서 갯수
	 * @author : LEEJIHO
	 * @param empId
	 * @return
	 */
	public int getRefApprovalRow(String empId);

	/**
	 * 전자결재 참조 목록
	 * @author : LEEJIHO
	 * @param pager
	 * @param empId
	 * @return
	 */
	public List<Approval> getRefApprovalList(Pager pager, String empId);

	/**
	 * 전자결재 문서 참조 사원 정보
	 * @author : LEEJIHO
	 * @param approvalId
	 * @return
	 */
	public RefEmployee getReferEmpInfo(int approvalId);


}
