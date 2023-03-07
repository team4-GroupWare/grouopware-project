package com.mycompany.webapp.email.model;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude="emailFileData")
public class EmailFile {
	private int emailFileId;
	private int emailContentId;
	private String emailFileName;
	private long emailFileSize;
	private byte[] emailFileData;
	private String emailFileContentType;
}
