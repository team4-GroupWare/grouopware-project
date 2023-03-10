package com.mycompany.webapp.email.controller;

import java.util.Calendar; 
import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mycompany.webapp.email.model.EmailList;
import com.mycompany.webapp.email.service.IEmailService;

public class EmailScheduler {
	@Autowired
	IEmailService emailService;
	
	//쓰레기통에서 영구삭제 하기
	public void emailTrash() {
		Calendar calendar = Calendar.getInstance(); 
		calendar.add(Calendar.MONTH, -10); //1년 더하기 
		java.util.Date utilDate = calendar.getTime();
		Date sqlDate = Date.valueOf(utilDate.toString());
		int row = emailService.getTrashEmail(sqlDate);

	}
}
