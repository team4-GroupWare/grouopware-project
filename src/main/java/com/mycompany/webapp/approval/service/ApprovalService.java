package com.mycompany.webapp.approval.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.approval.model.Approval;
import com.mycompany.webapp.approval.model.ApprovalCategory;
import com.mycompany.webapp.approval.model.ApprovalFile;
import com.mycompany.webapp.approval.model.ApprovalLine;
import com.mycompany.webapp.approval.model.RefEmployee;
import com.mycompany.webapp.approval.repository.ApprovalRepository;
import com.mycompany.webapp.component.MultipartFileResolver;
import com.mycompany.webapp.component.Pager;

@Service
public class ApprovalService implements IApprovalService {
	
	@Autowired
	private ApprovalRepository approvalRepository;
	
	@Autowired
	MultipartFileResolver multipartFileResolver;
	
	@Override
	public List<ApprovalCategory> getCategory() {
		return approvalRepository.selectApprovalCategory();
	}

	//전자결재 작성
	@Transactional
	public int writeApproval(Approval approval) {
		int row = 0;
		approvalRepository.insertApproval(approval);
		
		if(approval.getApprovalLine() != null) {
			for(int i = 0; i < approval.getApprovalLine().size(); i++) {
				row += approvalRepository.insertApprovalLine(approval.getApprovalLine().get(i));
			}
		}
		
		MultipartFile[] files = approval.getAttachFiles();
		if(files != null) {
			List<ApprovalFile> fileList =  null;
			try {
				fileList = multipartFileResolver.getApprovalFileList(files, approval.getApprovalId());
				
				if(fileList.size() != 0) {
					for(int i=0; i<fileList.size();i++) {
						if(fileList.get(i).getApprovalFileName() != null && !fileList.get(i).getApprovalFileName().equals("")) {
							row += approvalRepository.insertApprovalFile(fileList.get(i));
						}
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	//전자결재 수정(임시저장)
	@Transactional
	public int updateApproval(Approval approval) {
		
		int row = 0;
		approvalRepository.updateApproval(approval);
		if(approval.getApprovalLine() != null) {
			row += approvalRepository.deleteApprovalLine(approval.getApprovalId());
			
			for(int i = 0; i < approval.getApprovalLine().size(); i++) {
				row += approvalRepository.insertApprovalLine(approval.getApprovalLine().get(i));
			}
		}
		
		MultipartFile[] files = approval.getAttachFiles();
		if(files != null) {
			List<ApprovalFile> fileList =  null;
			try {
				fileList = multipartFileResolver.getApprovalFileList(files, approval.getApprovalId());
				
				if(fileList.size() != 0) {
					for(int i=0; i<fileList.size();i++) {
						if(fileList.get(i).getApprovalFileName() != null && !fileList.get(i).getApprovalFileName().equals("")) {
							row += approvalRepository.insertApprovalFile(fileList.get(i));
						}
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return row;
	}

	//내 문서함 목록(승인상태, 기안형태)
	@Override
	public List<Approval> getApprovalList(Pager pager, String empId, String status, int approvalCategoryId) {
		return approvalRepository.selectApprovalList(pager, empId, status, approvalCategoryId);
	}

	//내 문서함 갯수
	@Override
	public int getApprovalRow(String empId, String status, int approvalCategoryId) {
		return approvalRepository.selectApprovalCount(empId, status, approvalCategoryId);
	}

	//전자결재 문서 상세조회
	@Override
	public Approval getApprovalDetail(int approvalId) {
		return approvalRepository.selectApprovalDetail(approvalId);
	}

	//전자결재 문서 참조 사원 정보
	@Override
	public RefEmployee getReferEmpInfo(int approvalId) {
		return approvalRepository.selectRefEmployeeByApprovalId(approvalId);
	}
	
	//카테고리 별 작성 폼
	@Override
	public String getApprovalForm(int approvalCategoryId) {
		return approvalRepository.selectApprovalForm(approvalCategoryId);
	}

	//임시저장함 목록(기안형태)
	@Override
	public List<Approval> getApprovalTempList(Pager pager, String empId) {
		return approvalRepository.selectApprovalTempList(pager, empId);
	}

	//임시저장함 갯수
	@Override
	public int getTempApprovalRow(String empId) {
		return approvalRepository.selectTempApprovalCount(empId);
	}

	//전자결재 결재선 선택 시 사원정보
	@Override
	public ApprovalLine getApprovalLine(String empId) {
		return approvalRepository.selectApprovalLine(empId);
	}

	//전자결재 결재선 목록
	@Override
	public List<ApprovalLine> getApprovalLineList(int approvalId) {
		return approvalRepository.selectApprovalLineList(approvalId);
	}

	//결재문서함 상태에 따른 목록 갯수
	@Override
	public int getConfirmRow(String empId, String status, int approvalCategoryId) {
		return approvalRepository.selectConfirmCount(empId, status, approvalCategoryId);
	}

	//결재문서함 목록(승인상태, 기안형태)
	@Override
	public List<Approval> getConfirmList(Pager pager, String empId, String status, int approvalCategoryId) {
		return approvalRepository.selectConfirmList(pager, empId, status, approvalCategoryId);
	}

	//해당 문서에 대한 내 결재 순서
	@Override
	public int getMySeq(int approvalId, String empId) {
		return approvalRepository.selectMySeq(approvalId, empId);
	}

	//문서 결재(승인, 반려)
	@Transactional
	public int confirm(ApprovalLine approvalLine, Approval approval) {
		int row = 0;
		String status;
		int mySeq = getMySeq(approvalLine.getApprovalId(), approvalLine.getEmpId());
		if(approvalLine.getLastSeq() == mySeq) { //내가 마지막 결재 순서일 때 
			if(approvalLine.getIsApproved().equals("y")) {
				if(approval.getApprovalCategoryId() == 3) { //사직서일 때 
					//퇴사 날짜를 마지막 승인날짜로 업데이트
					approvalRepository.updateEmployeeResignDate(approval.getEmpId());
				} else if(approval.getApprovalCategoryId() == 4) { //경조 휴가 신청일 때
					String eventName = "결혼";
					approvalRepository.updateEmployeeAddDayoffRemain(approval.getEmpId(), eventName);
				} else if(approval.getApprovalCategoryId() == 5) {
					String eventName = "사망";
					approvalRepository.updateEmployeeAddDayoffRemain(approval.getEmpId(), eventName);
				} else if(approval.getApprovalCategoryId() == 6) {
					String eventName = "출산";
					approvalRepository.updateEmployeeAddDayoffRemain(approval.getEmpId(), eventName);
				}
				status = "승인";
			} else {
				status = "반려";
			}
		} else { //내가 마지막 결재 순서가 아닐 때
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

	//해당 문서에 대한 첨부파일 목록
	@Override
	public List<ApprovalFile> getApprovalFileList(int approvalId) {
		return approvalRepository.selectApprovalFileList(approvalId);
	}

	//전자결재 파일 정보
	@Override
	public ApprovalFile getFile(int approvalFileId) {
		return approvalRepository.selectApprovalFile(approvalFileId);
	}

	//전자결재 참조 문서 갯수
	@Override
	public int getRefApprovalRow(String empId) {
		return approvalRepository.selectRefApprovalCount(empId);
	}

	//전자결재 참조 목록
	@Override
	public List<Approval> getRefApprovalList(Pager pager, String empId) {
		return approvalRepository.selectRefApprovalList(pager, empId);
	}

	//전자결재 삭제
	@Override
	public int deleteApproval(int approvalId) {
		return approvalRepository.deleteApproval(approvalId);
	}

}
