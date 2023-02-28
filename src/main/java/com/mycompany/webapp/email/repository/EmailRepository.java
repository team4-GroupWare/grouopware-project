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
	/**
	 * @author LEEYESEUNG
	 * @param sendId : 보낸 사람
	 * @return : 보낸 이메일 중 받는 이가 읽은 이메일 개수
	 */
	int selectReadEmailCount(String sendId);
	/**
	 * @author LEEYESEUNG
	 * @param pager 
	 * @param sendId : 보낸 사람
	 * @return List<EmailList> : 보낸 이메일 중, 받는 이가 읽은 이메일 리스트
	 */
	List<EmailList> selectReadEmail(@Param("pager") Pager pager, @Param("sendId") String sendId);
	/**
	 * @author LEEYESEUNG
	 * @param sendId : 보낸 사람
	 * @return int : 보낸 이메일 중, 읽지 않은 이메일 개수
	 */
	int selectUnReadEmailCount(String sendId);
	/**
	 * @author LEEYESEUNG
	 * @param pager 
	 * @param sendId : 보낸 사람
	 * @return List<EmailList> : 보낸 이메일 중, 안 읽은 이메일 리스트
	 */
	List<EmailList> selectUnReadEmail(@Param("pager") Pager pager, @Param("sendId") String sendId);
	/**
	 * @author LEEYESEUNG
	 * @param empId : 로그인된 아이디
	 * @return int : 쓰레기통 이메일 개수
	 */
	int selectTrashEmailCount(String empId);
	/**
	 * @author LEEYESEUNG
	 * @param pager 
	 * @param empId : 나의 아이디
	 * @return List<EmailList> : 쓰레기통에 있는 메일 리스트
	 */
	List<EmailList> selectTrashEmail(@Param("pager")Pager pager, @Param("empId")String empId);
	/**
	 * @author LEEYESEUNG
	 * @param empId : 나의 아이디
	 * @return int : 임시저장메일 개수
	 */
	int selectTemptEmailCount(String empId);
	/**
	 * @author LEEYESEUNG
	 * @param pager
	 * @param empId : 나의 아이디
	 * @return List<EmailList> : 임시저장메일 리스트
	 */
	List<EmailList> selectTempEmail(@Param("pager")Pager pager, @Param("empId")String empId);
	/**
	 * @author LEEYESEUNG
	 * @param check : 중요메일인지 체크할 email 아이디
	 * @return int : 중요메일이라면 1반환 
	 */
	int selectImportantReceiveEmail(int emailId);
	/**
	 * @author LEEYESEUNG
	 * @param emailId : 휴지통으로 보낼 receive 메일 아이디 
	 * @return int : update된 행수
	 */
	int updateEmailTrash(int emailId);

}
