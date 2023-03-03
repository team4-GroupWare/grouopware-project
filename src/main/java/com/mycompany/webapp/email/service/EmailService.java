package com.mycompany.webapp.email.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.email.model.EmailContent;
import com.mycompany.webapp.email.model.EmailDetail;
import com.mycompany.webapp.email.model.EmailList;
import com.mycompany.webapp.email.model.ReceiveEmail;
import com.mycompany.webapp.email.model.SendEmail;
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
		log.info(emailList);
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
	
	
	/**
	 * @author LEEYESEUNG
	 * @param sendId : 보낸 사람
	 * @return int : 보낸 이메일 중 받는 이가 읽은 이메일 개수
	 */
	@Override
	public int getReadEmailRows(String sendId) {
		log.info("실행");
		int emailRows = emailRepository.selectReadEmailCount(sendId);
		return emailRows;
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param pager 
	 * @param sendId : 보낸 사람
	 * @return List<EmailList> : 보낸 이메일 중, 받는 이가 읽은 이메일 리스트
	 */
	@Override
	public List<EmailList> getReadEmailList(Pager pager, String sendId) {
		log.info("실행");
		List<EmailList> emailList = emailRepository.selectReadEmail(pager, sendId);
		return emailList;
	}

	/**
	 * @author LEEYESEUNG
	 * @param sendId : 보낸 사람
	 * @return int : 보낸 이메일 중, 읽지 않은 이메일 개수
	 */
	@Override
	public int getUnReadEmailRows(String sendId) {
		log.info("실행");
		int emailRows = emailRepository.selectUnReadEmailCount(sendId);
		return emailRows;
	}

	/**
	 * @author LEEYESEUNG
	 * @param pager 
	 * @param sendId : 보낸 사람
	 * @return List<EmailList> : 보낸 이메일 중, 안 읽은 이메일 리스트
	 */
	@Override
	public List<EmailList> getUnReadEmailList(Pager pager, String sendId) {
		log.info("실행");
		List<EmailList> emailList = emailRepository.selectUnReadEmail(pager, sendId);
		return emailList;
	}
	
	/**
	 * @author LEEYESEUNG
	 * @param empId : 로그인된 아이디
	 * @return int : 쓰레기통에 있는 이메일 개수
	 */
	@Override
	public int getTrashEmailRows(String empId) {
		log.info("실행");
		int emailRows = emailRepository.selectTrashEmailCount(empId);
		return emailRows;
	}
	/**
	 * @author LEEYESEUNG
	 * @param pager 
	 * @param empId : 나의 아이디
	 * @return List<EmailList> : 쓰레기통에 있는 메일 리스트
	 */
	@Override
	public List<EmailList> getTrashEmailList(Pager pager, String empId) {
		log.info("실행");
		List<EmailList> emailList = emailRepository.selectTrashEmail(pager, empId);
		return emailList;
	}

	/**
	 * @author LEEYESEUNG
	 * @param empId : 나의 아이디
	 * @return int : 임시저장메일 개수
	 */
	@Override
	public int getTempEmailRows(String empId) {
		log.info("실행");
		int emailRows = emailRepository.selectTemptEmailCount(empId);
		return emailRows;
	}

	/**
	 * @author LEEYESEUNG
	 * @param pager
	 * @param empId : 나의 아이디
	 * @return List<EmailList> : 임시저장메일 리스트
	 */
	@Override
	public List<EmailList> getTempEmail(Pager pager, String empId) {
		log.info("실행");
		List<EmailList> emailList = emailRepository.selectTempEmail(pager, empId);
		return emailList;
	}

	/**
	 * @author LEEYESEUNG
	 * @param check : 중요메일인지 체크할 email 아이디
	 * @param type : 받은 메일인지 보낸 메일인지 확인
	 * @return int : 중요메일이라면 1반환 
	 */
	@Override
	public int checkImportant(int emailId) {
		log.info("실행");
		int row = 0;
		int emailContentId = emailRepository.selectEmailContentId(emailId);
		row = emailRepository.selectImportantEmail(emailContentId);
		
		return row;
	}
	
	/**
	 * @author LEEYESEUNG
	 */
	@Override
	public int throwAwayEmail(int emailId, String type) {
		log.info("실행");
		int row = 0;
		if(type.equals("receive")) {
			row = emailRepository.updateReceiveEmailTrashDate(emailId);
		} else if(type.equals("send")) {
			row = emailRepository.updateSendEmailTrashDate(emailId);
		}
		return row;
	}
	
	/**
	 * @author LEEYESEUNG
	 */
	@Override
	public int deleteEmail(int emailId, String type) {
		log.info("실행");
		int row = 0;
		if(type.equals("trash")) {
			row = emailRepository.updateTrashReceiveEmail(emailId);
			row = emailRepository.updateTrashSendEmail(emailId);
		} else if(type.equals("temp")){
			row = emailRepository.deleteTempEmail(emailId);
		}
		return row;
	}

	/**
	 * @author LEEYESEUNG
	 * @param emailId : 복구하려는 이메일 아이디
	 * @return int : 업데이트한 행수 반환
	 */
	@Override
	public int restoreEmail(int emailId) {
		log.info("실행");
		int row = emailRepository.updateReceiveEmailRestore(emailId);
		row += emailRepository.updateSendEmailRestore(emailId);
		return row;
	}

	/**
	 * @author LEEYESEUNG
	 */
	@Override
	public int writeEmail(EmailDetail emailDetail) {
		log.info("실행");
		EmailContent emailContent = new EmailContent();
		ReceiveEmail receiveEmail = new ReceiveEmail();
		SendEmail sendEmail = new SendEmail();
		
		//이메일 컨텐트 테이블 insert
		emailContent.setContent(emailDetail.getContent());
		emailContent.setImportant(emailDetail.isImportant());
		emailContent.setTitle(emailDetail.getTitle());
		int row = emailRepository.insertEmailContent(emailContent);
		//넣었던 emailContentId로 send_email 테이블 insert
		sendEmail.setReceiveEmpId(emailDetail.getReceiveId());
		sendEmail.setEmailContentId(emailContent.getEmailContentId());
		row += emailRepository.insertSendEmail(sendEmail);
		//넣었던 emailContentId로 receive_email 테이블 insert
		receiveEmail.setSentEmpId(emailDetail.getSendId());
		receiveEmail.setEmailContentId(emailContent.getEmailContentId());
		row += emailRepository.insertReceiveEmail(receiveEmail);
		
		return row;
	}

	@Override
	public EmailDetail readReceiveEmail(int receiveEmailId) {
		EmailDetail emailDetail = emailRepository.selectReceiveEmailDetail(receiveEmailId);
		if(emailDetail.getReadDate()==null) {
			int row = emailRepository.updateReadDate(receiveEmailId);
		}
		return emailDetail;
	}

	@Override
	public EmailDetail readSendEmail(int sendEmailId) {
		EmailDetail emailDetail = emailRepository.selectSendEmailDetail(sendEmailId);
		return emailDetail;
	}

}
