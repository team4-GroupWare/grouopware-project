package com.mycompany.webapp.email.repository;

import com.mycompany.webapp.email.model.EmailFile;

public interface EmailFileRepository {
	/**
	 * 
	 * @param emailFile
	 * @return
	 */
	int insertFileData(EmailFile emailFile);
}
