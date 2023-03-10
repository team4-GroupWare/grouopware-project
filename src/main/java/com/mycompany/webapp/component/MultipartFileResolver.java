package com.mycompany.webapp.component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.approval.model.ApprovalFile;
import com.mycompany.webapp.email.model.EmailFile;
import com.mycompany.webapp.employee.model.Employee;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Component
public class MultipartFileResolver {
	public List<EmailFile> getEmailFileList(MultipartFile[] multipartFile, int emailContentId) throws IOException{
		List<EmailFile> emailFileList = new ArrayList<EmailFile>();
		for(MultipartFile file : multipartFile) {
			EmailFile emailFile = new EmailFile();
			emailFile.setEmailContentId(emailContentId);
			emailFile.setEmailFileName(file.getOriginalFilename());
			emailFile.setEmailFileData(file.getBytes());
			emailFile.setEmailFileContentType(file.getContentType());
			emailFile.setEmailFileSize(file.getSize());
			emailFileList.add(emailFile);
		}
		return emailFileList;
	}
	
	public Employee getEmployeeFile(Employee employee) throws IOException{
		log.info("employee: "+ employee);
		MultipartFile file = employee.getAttachFiles();
		employee.setProfileContentType(file.getContentType());
		employee.setProfileData(file.getBytes());
		return employee;
	}
	
	public List<ApprovalFile> getApprovalFileList(MultipartFile[] multipartFile, int approvalId) throws IOException{
		List<ApprovalFile> approvalFileList = new ArrayList<ApprovalFile>();
		for(MultipartFile file : multipartFile) {
			ApprovalFile approvalFile = new ApprovalFile();
			approvalFile.setApprovalId(approvalId);
			approvalFile.setApprovalFileName(file.getOriginalFilename());
			approvalFile.setApprovalFileData(file.getBytes());
			approvalFile.setApprovalFileContentType(file.getContentType());
			approvalFile.setApprovalFileSize(file.getSize());
			approvalFileList.add(approvalFile);
		}
		return approvalFileList;
	}
}
