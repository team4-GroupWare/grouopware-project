package com.mycompany.webapp.email.repository;

import java.util.List;

import com.mycompany.webapp.email.model.EmailFile;

public interface EmailFileRepository {
	/**
	 * 
	 * @param emailFile
	 * @return
	 */
	int insertFileData(EmailFile emailFile);
	/**
	 * 
	 * @param emailContentId
	 * @return
	 */
	List<EmailFile> selectEmailFileByContentId(int emailContentId);
	/**
	 * 
	 * @param emailFileId
	 * @return
	 */
	EmailFile selectEmailFileByFileId(int emailFileId);
}
