package com.mycompany.webapp.employee;

public class NotExistingManagerException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public NotExistingManagerException(String message) {
		super(message);
	}

}
