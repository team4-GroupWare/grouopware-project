package com.mycompany.webapp.email.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.email.model.EmailList;

public interface EmailRepository {
	List<EmailList> selectEmail(@Param("pager") Pager pager, @Param("receiveId") String receiveId);
	int selectReceiveEmailCount(String receiveId);

}
