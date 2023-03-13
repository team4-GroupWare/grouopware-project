package com.mycompany.webapp.email.controller;

import java.util.Calendar; 
import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.mycompany.webapp.email.model.EmailList;
import com.mycompany.webapp.email.service.IEmailService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Component
public class EmailScheduler {
	@Autowired
	IEmailService emailService;
	
	//쓰레기통에서 영구삭제 하기
	@Scheduled(cron = "0 01 0 * * 1-7")
	public void emailTrash() {
		Calendar calendar = Calendar.getInstance(); 
		calendar.add(Calendar.DATE, -10); //10일 전 날짜 가져오기
		java.util.Date utilDate = calendar.getTime();
		Date sqlDate = new Date(utilDate.getTime());
		log.info(sqlDate);
		int row = emailService.getTrashEmail(sqlDate);
		row = emailService.deleteEmail();

	}
}
