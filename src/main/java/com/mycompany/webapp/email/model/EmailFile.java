package com.mycompany.webapp.email.model;

import lombok.Data;

@Data
public class EmailFile {
	private int emailFileId;
	private int emailContentId;
	private String emailFileName;
	private String emailFileSize;
	private byte[] emailFileData;
	private String emailFileContentType;
}
