package com.mycompany.webapp.employee.controller;

public class AlreadyExistingIdException extends RuntimeException {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public AlreadyExistingIdException(String message) {
		super(message);
	}

}
