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

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ApprovalService implements IApprovalService {
	
	@Autowired
	private ApprovalRepository approvalRepository;
	
	@Autowired
	MultipartFileResolver multipartFileResolver;
	
	@Override
	public List<ApprovalCategory> getCategory() {
		return approvalRepository.selectApprovalCategory();
	}

	@Transactional
	public int writeApproval(Approval approval) {
		log.info("전자결재 작성 실행");
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
	
	@Transactional
	public int updateApproval(Approval approval) {
		log.info("=====updateApproval==========(임시저장 문서 수정, 제출)");
		log.info("+++++++++approval++++++++++");
		log.info(approval);
		int row = 0;
		approvalRepository.updateApproval(approval);
		
		row += approvalRepository.deleteApprovalLine(approval.getApprovalId());
		
		for(int i = 0; i < approval.getApprovalLine().size(); i++) {
			row += approvalRepository.insertApprovalLine(approval.getApprovalLine().get(i));
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

	@Override
	public List<Approval> getApprovalList(Pager pager, String empId, String status, int approvalCategoryId) {
		log.info("실행");
		return approvalRepository.selectApprovalList(pager, empId, status, approvalCategoryId);
	}

	@Override
	public int getApprovalRow(String empId, String status, int approvalCategoryId) {
		log.info("실행");
		return approvalRepository.selectApprovalCount(empId, status, approvalCategoryId);
	}

	@Override
	public Approval getApprovalDetail(int approvalId) {
		log.info("실행");
		return approvalRepository.selectApprovalDetail(approvalId);
	}

	//전자결재 문서 참조 사원 정보
	@Override
	public RefEmployee getReferEmpInfo(int approvalId) {
		log.info("실행");
		return approvalRepository.selectRefEmployeeByApprovalId(approvalId);
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
	public int getConfirmRow(String empId, String status, int approvalCategoryId) {
		log.info("실행");
		return approvalRepository.selectConfirmCount(empId, status, approvalCategoryId);
	}

	//결재문서함 목록
	@Override
	public List<Approval> getConfirmList(Pager pager, String empId, String status, int approvalCategoryId) {
		log.info("실행");
		return approvalRepository.selectConfirmList(pager, empId, status, approvalCategoryId);
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
		log.info("실행");
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

	//해당 문서에 대한 첨부파일 목록
	@Override
	public List<ApprovalFile> getApprovalFileList(int approvalId) {
		log.info("실행");
		return approvalRepository.selectApprovalFileList(approvalId);
	}

	//전자결재 파일 정보
	@Override
	public ApprovalFile getFile(int approvalFileId) {
		log.info("실행");
		return approvalRepository.selectApprovalFile(approvalFileId);
	}

	//전자결재 참조 문서 갯수
	@Override
	public int getRefApprovalRow(String empId) {
		log.info("실행");
		return approvalRepository.selectRefApprovalCount(empId);
	}

	//전자결재 참조 목록
	@Override
	public List<Approval> getRefApprovalList(Pager pager, String empId) {
		return approvalRepository.selectRefApprovalList(pager, empId);
	}

}
