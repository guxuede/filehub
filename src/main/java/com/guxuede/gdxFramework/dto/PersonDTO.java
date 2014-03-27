package com.guxuede.gdxFramework.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonFormat.Shape;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.guxuede.gdxFramework.util.support.ObjectMapper;
import com.guxuede.gdxFramework.util.support.ObjectMapper.FloatSerializer;



public class PersonDTO implements Serializable {

	private static final long serialVersionUID = -1308795024262635690L;

	private String firstName;

	private String lastName;
	
	private String address;
	
	private String age;
	
	private Integer sex;
	
    //@JsonDeserialize(using = ObjectMapper.FloatDeserializer.class)  
   // @JsonSerialize(using = ObjectMapper.FloatSerializer.class)  
	private BigDecimal money;
    
    @JsonDeserialize(using = ObjectMapper.FloatDeserializer.class)  
    @JsonSerialize(using = ObjectMapper.FloatSerializer.class)  
    @com.fasterxml.jackson.annotation.JsonFormat(shape=Shape.NUMBER_FLOAT)
	private Float mfloat;
	
	private String phone;
	
	private String mobile;
	
	private String qq;
	
	private String email;
	
	@DateTimeFormat(iso = ISO.DATE,pattern="yyyy/MMM-dd")
	private Date birthday;

	public PersonDTO() {
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public BigDecimal getMoney() {
		return money;
	}

	public void setMoney(BigDecimal money) {
		this.money = money;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public Date getBirthday() {
		return birthday;
	}


	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Float getMfloat() {
		return mfloat;
	}


	public void setMfloat(Float mfloat) {
		this.mfloat = mfloat;
	}


	@Override
	public String toString() {
		return "PersonDTO [firstName=" + firstName + ", lastName=" + lastName
				+ ", address=" + address + ", age=" + age + ", sex=" + sex
				+ ", money=" + money + ", mfloat=" + mfloat + ", phone="
				+ phone + ", mobile=" + mobile + ", qq=" + qq + ", email="
				+ email + ", birthday=" + birthday + "]";
	}


}
