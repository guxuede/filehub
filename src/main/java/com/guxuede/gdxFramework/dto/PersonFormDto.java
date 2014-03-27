package com.guxuede.gdxFramework.dto;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class PersonFormDto implements Serializable {

	private static final long serialVersionUID = -1308795024262635690L;


	@NotNull
	private String firstName;

	@Size(max=7,min=3)
	private String lastName;
	

	public PersonFormDto() {
	}

	public PersonFormDto(String firstName, String lastName) {
		this.firstName = firstName;
		this.lastName = lastName;
	}


	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Override
	public String toString() {
		return super.toString() + " name = " + firstName + " " + lastName;
	}


}
