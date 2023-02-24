package com.mycompany.webapp.email.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.email.model.EmailList;

public interface EmailRepository {
	/**
	 * @author LEEYESEUNG
	 * @param pager
	 * @param receiveId : 받는 사람
	 * @return List<EmailList> : 받은 이메일 리스트
	 */
	List<EmailList> selectReceiveEmail(@Param("pager") Pager pager, @Param("receiveId") String receiveId);
	/**
	 * @author LEEYESEUNG
	 * @param receiveId : 받는 사람
	 * @return int : 받은 이메일 개수
	 */
	int selectReceiveEmailCount(String receiveId);
	/**
	 * @author LEEYESEUNG
	 * @param sendId : 보낸 사람
	 * @return int : 보낸 이메일 개수
	 */
	int selectSendEmailCount(String sendId);
	/**
	 * @author LEEYESEUNG
	 * @param pager
	 * @param sendId : 보낸 사람
	 * @return : 보낸 이메일 리스트
	 */
	List<EmailList> selectSendEmail(@Param("pager") Pager pager,@Param("sendId") String sendId);

}
