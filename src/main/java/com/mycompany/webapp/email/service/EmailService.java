package com.mycompany.webapp.email.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.email.model.EmailList;
import com.mycompany.webapp.email.repository.EmailRepository;

import lombok.extern.log4j.Log4j2;
@Log4j2
@Service
public class EmailService implements IEmailService {
	
	@Autowired
	EmailRepository emailRepository;
	
	@Override
	public List<EmailList> getEmailList(Pager pager, String receiveId) {
		log.info("실행");
		List<EmailList> emailList = emailRepository.selectEmail(pager, receiveId);
		return emailList;
	}

	@Override
	public int getReceiveEmailRows( String receiveId) {
		
		int emailRows = emailRepository.selectReceiveEmailCount(receiveId);
		log.info("실행" + emailRows);
		return emailRows;
	}

}
