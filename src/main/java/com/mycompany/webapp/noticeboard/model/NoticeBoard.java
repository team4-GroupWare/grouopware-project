package com.mycompany.webapp.noticeboard.model;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeBoard {
	private int noticeId;
	private String noticeTitle;
	private String noticeContent;
	private Date writeDate;
	private String writer;
	private int boardCateId;
}
