package com.mycompany.webapp.email.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.email.model.EmailContent;
import com.mycompany.webapp.email.model.EmailDetail;
import com.mycompany.webapp.email.model.EmailList;
import com.mycompany.webapp.email.model.ReceiveEmail;
import com.mycompany.webapp.email.model.SendEmail;

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
	int selectImportantEmail(int emailId);
	/**
	 * @author LEEYESEUNG
	 * @param emailId : 휴지통으로 보낼 receive 메일 아이디 
	 * @return int : update된 행수
	 */
	int updateReceiveEmailTrashDate(int emailId);
	/**
	 * @author LEEYESEUNG
	 * @param emailId : 삭제하려는 tempEmailId
	 * @return int : 삭제한 행수
	 */
	int deleteTempEmail(int emailId);
	/**
	 * @author LEEYESEUNG
	 * @param emailId : 영구삭제할 받은 메일
	 * @return int : 업데이트한 행수
	 */
	int updateTrashReceiveEmail(int emailId);
	/**
	 * @author LEEYESEUNG
	 * @param emailId : 영구삭제할 보낸 메일
	 * @return int : 업데이트한 행수
	 */
	int updateTrashSendEmail(int emailId);
	/**
	 * @author LEEYESEUNG
	 * @param emailId : 휴지통에 보낼 sendEmailId
	 * @return int : 업데이트한 행수
	 */
	int updateSendEmailTrashDate(int emailId);
	/**
	 * @author LEEYESEUNG
	 * @param emailId : 복구할 receiveEmailId
	 * @return int : 업데이트한 행수
	 */
	int updateReceiveEmailRestore(int emailId);
	/**
	 * @author LEEYESEUNG
	 * @param emailId : 복구할 sendEmailId
	 * @return int : 업데이트한 행수
	 */
	int updateSendEmailRestore(int emailId);
	/**
	 * @author LEEYESEUNG
	 * @param emailContent : email_content 테이블에 넣을 DTO
	 * @return int : 반영된 행수
	 */
	int insertEmailContent(EmailContent emailContent);
	/**
	 * @author LEEYESEUNG
	 * @param sendEmail : send_email 테이블에 넣을 DTO
	 * @return int : 반영된 행수
	 */
	int insertSendEmail(SendEmail sendEmail);
	/**
	 * @author LEEYESEUNG
	 * @param receiveEmail : receive_email 테이블에 넣을 DTO
	 * @returnint int : 반영된 행수
	 */
	int insertReceiveEmail(ReceiveEmail receiveEmail);
	/**
	 * @author LEEYESEUNG
	 * @param emailId
	 * @return
	 */
	int selectEmailContentId(int emailId);
	/**
	 * @author LEEYESEUNG
	 * @return
	 */
	EmailDetail selectReceiveEmailDetail(int emailId);
	/**
	 * @author LEEYESEUNG
	 * @param receiveEmailId
	 * @return
	 */
	int updateReadDate(int receiveEmailId);
	/**
	 * @author LEEYESEUNG
	 * @param sendEmailId
	 * @return
	 */
	EmailDetail selectSendEmailDetail(int emailId);

}
