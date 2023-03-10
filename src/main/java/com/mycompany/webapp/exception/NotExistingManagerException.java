package com.mycompany.webapp.exception;

public class NotExistingManagerException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public NotExistingManagerException(String message) {
		super(message);
	}

}
