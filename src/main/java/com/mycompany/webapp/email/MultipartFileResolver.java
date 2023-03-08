package com.mycompany.webapp.email;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.email.model.EmailFile;
import com.mycompany.webapp.employee.model.Employee;

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
		MultipartFile file = employee.getAttachFiles();
		employee.setProfileContentType(file.getContentType());
		employee.setProfileData(file.getBytes());
		return employee;
	}
}
