package com.mycompany.webapp.noticeboard.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude="noticeFileData")
public class NoticeBoard {
	private int noticeId;
	private String noticeTitle;
	private String noticeContent;
	private Date writeDate;
	private String writer;
	private int boardCateId;
	private String boardCateName;
	private int readCount;
	
	private MultipartFile file;
	
	private int noticeFileId;

	private String noticeFileName;
	private long noticeFileSize;
	private String noticeFileContentType;
	private byte[] noticeFileData;
}
