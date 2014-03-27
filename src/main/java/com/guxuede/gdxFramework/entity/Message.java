package com.guxuede.gdxFramework.entity;

import java.util.Date;

import com.google.gson.Gson;

public class Message {
	private String cacheMsg;
	
	private User user;
	private String msg;
	private Date time;
	private int type;
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public String toPlayload(){
		if(cacheMsg==null){
			cacheMsg=new Gson().toJson(this);
		}
		return cacheMsg;
	}
}
