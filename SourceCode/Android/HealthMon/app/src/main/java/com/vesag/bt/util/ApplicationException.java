package com.vesag.bt.util;

import java.io.Serializable;

public class ApplicationException extends Exception implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String message;
	public ApplicationException(String message){
		super();
		this.message = message;
	}

	@Override
	public String getMessage() {
		return message;
	}
	
	
}
