package com.guxuede.gdxFramework.dto;

import java.util.List;

public class ValidatorResultDTO {

	private List<FieldError> fieldErrors;
	
	public ValidatorResultDTO() {
	}
	
	
	public ValidatorResultDTO(List<FieldError> fieldErrors) {
		super();
		this.fieldErrors = fieldErrors;
	}


	public List<FieldError> getFieldErrors() {
		return fieldErrors;
	}

	public void setFieldErrors(List<FieldError> fieldErrors) {
		this.fieldErrors = fieldErrors;
	}


	public static class FieldError{
		private String field;
		private String errormsg;
		
		public FieldError() {
		}
		
		public FieldError(String field, String errormsg) {
			super();
			this.field = field;
			this.errormsg = errormsg;
		}
		
		public String getField() {
			return field;
		}
		public void setField(String field) {
			this.field = field;
		}
		public String getErrormsg() {
			return errormsg;
		}
		public void setErrormsg(String errormsg) {
			this.errormsg = errormsg;
		}
	}
}
