package com.mycompany.webapp.email.service;

import java.util.List;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.email.model.EmailList;

public interface IEmailService {
	/**
	 * @author LEEYESEUNG
	 * @param pager
	 * @param receiveId : 받는 사람
	 * @return List<EmailList> : 받은 이메일 리스트
	 */
	List<EmailList> getReceiveEmailList(Pager pager, String receiveId);
	/**
	 * @author LEEYESEUNG
	 * @param receiveId : 받는 사람
	 * @return int :  받은 이메일 개수
	 */
	int getReceiveEmailRows( String receiveId);
	/**
	 * @author LEEYESEUNG
	 * @param sendId : 보낸 사람
	 * @return int : 보낸 이메일 개수
	 */
	int getSendEmailRows(String sendId);
	/**
	 * @author LEEYESEUNG
	 * @param pager
	 * @param sendId : 보낸 사람
	 * @return List<EmailList> : 보낸 이메일 리스트
	 */
	List<EmailList> getSendEmailList(Pager pager, String sendId);
}
