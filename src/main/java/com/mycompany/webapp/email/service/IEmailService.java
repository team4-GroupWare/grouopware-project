package com.mycompany.webapp.email.service;

import java.util.List;

import com.mycompany.webapp.Pager;
import com.mycompany.webapp.email.model.EmailList;

public interface IEmailService {
	List<EmailList> getEmailList(Pager pager, String receiveId);
	int getReceiveEmailRows( String receiveId);
}
