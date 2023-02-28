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
	/**
	 * @author LEEYESEUNG
	 * @param sendId : 보낸 사람
	 * @return int : 보낸 이메일 중, 받는 이가 읽은 이메일 개수 
	 */
	int getReadEmailRows(String sendId);
	/**
	 * @author LEEYESEUNG
	 * @param pager 
	 * @param sendId : 보낸 사람
	 * @return List<EmailList> : 보낸 이메일 중, 받는 이가 읽은 이메일 리스트
	 */
	List<EmailList> getReadEmailList(Pager pager, String sendId);
	/**
	 * @author LEEYESEUNG
	 * @param sendId : 보낸 사람
	 * @return int : 보낸 이메일 중, 읽지 않은 이메일 개수
	 */
	int getUnReadEmailRows(String sendId);
	/**
	 * @author LEEYESEUNG
	 * @param pager 
	 * @param sendId : 보낸 사람
	 * @return List<EmailList> : 보낸 이메일 중, 안 읽은 이메일 리스트
	 */
	List<EmailList> getUnReadEmailList(Pager pager, String sendId);
	/**
	 * @author LEEYESEUNG
	 * @param empId : 나의 아이디
	 * @return int : 쓰레기통에 있는 이메일 개수
	 */
	int getTrashEmailRows(String empId);
	/**
	 * @author LEEYESEUNG
	 * @param pager 
	 * @param empId : 나의 아이디
	 * @return List<EmailList> : 쓰레기통에 있는 메일 리스트
	 */
	List<EmailList> getTrashEmailList(Pager pager, String empId);
	/**
	 * @author LEEYESEUNG
	 * @param empId : 나의 아이디
	 * @return int : 임시저장메일 개수
	 */
	int getTempEmailRows(String empId);
	/**
	 * @author LEEYESEUNG
	 * @param pager
	 * @param empId : 나의 아이디
	 * @return List<EmailList> : 임시저장메일 리스트
	 */
	List<EmailList> getTempEmail(Pager pager, String empId);
	/**
	 * @author LEEYESEUNG
	 * @param check : 중요메일인지 체크할 email 아이디
	 * @param type : 받은 메일인지 보낸 메일인지 확인
	 * @return int : 중요메일이라면 1반환 
	 */
	int checkImportant(int emailId, String type);
	/**
	 * 
	 * @param emailId : 쓰레기통에 넣으려는 아이디
	 * @param type : 해당 아이디가 받은 메일인지 보낸 메일인지
	 * @return int : 삭제한 행의 수 반환
	 */
	int throwAwayEmail(int emailId, String type);
}
