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
	
	/**
	 * @author LEEYESEUNG
	 * @param pager 
	 * @param receiveId : 받는 사람
	 * @return emailList : 받은 이메일 리스트
	 */
	@Override
	public List<EmailList> getReceiveEmailList(Pager pager, String receiveId) {
		log.info("실행");
		List<EmailList> emailList = emailRepository.selectReceiveEmail(pager, receiveId);
		return emailList;
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param receiveId : 받는 사람
	 * @return emailRows : 받은 이메일 총 개수
	 */
	@Override
	public int getReceiveEmailRows(String receiveId) {
		log.info("실행");
		int emailRows = emailRepository.selectReceiveEmailCount(receiveId);
		return emailRows;
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param sendId : 보낸 사람
	 * @return emailRows : 보낸 이메일 개수
	 */
	@Override
	public int getSendEmailRows(String sendId) {
		log.info("실행");
		int emailRows = emailRepository.selectSendEmailCount(sendId);
		return emailRows;
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param sendId : 보낸 사람
	 * @return List<EmailList> : 보낸 이메일 리스트
	 */
	@Override
	public List<EmailList> getSendEmailList(Pager pager, String sendId) {
		log.info("실행");
		List<EmailList> emailList = emailRepository.selectSendEmail(pager, sendId);
		return emailList; 
	}

}
