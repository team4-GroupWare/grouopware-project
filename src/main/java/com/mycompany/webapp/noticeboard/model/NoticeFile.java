package com.mycompany.webapp.noticeboard.model;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude="noticeFileData")
public class NoticeFile {
	private int noticeFileId;
	private int noticeId;
	private String noticeFileName;
	private long noticeFileSize;
	private byte[] noticeFileData;
	private String noticeFileContentType;
}
