package com.guxuede.gdxFramework.dto;

import java.io.Serializable;

@SuppressWarnings("serial")
public class UserDTO implements Serializable{

	private String name;
	private int age;
	private boolean isMarryd;
	private String lastName;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public boolean isMarryd() {
		return isMarryd;
	}
	public void setMarryd(boolean isMarryd) {
		this.isMarryd = isMarryd;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	@Override
	public String toString() {
		return "UserDTO [name=" + name + ", age=" + age + ", isMarryd="
				+ isMarryd + ", lastName=" + lastName + "]";
	}
}
