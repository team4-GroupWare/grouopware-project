package com.mycompany.webapp.noticeboard.model;

import lombok.Data;

@Data
public class NoticeFile {
	private int noticeFileId;
	private int noticeId;
	private String noticeFileName;
	private String noticeFileSize;
	private byte[] noticeFileData;
	private String noticeFileContentType;
}
