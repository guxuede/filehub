package com.guxuede.gdxFramework.entity;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.socket.TextMessage;

import com.google.gson.Gson;

public class Forum {

	private Room room;
	private final List<ChatSession> users;
	
	public Forum() {
		users=new ArrayList<ChatSession>();
	}
	
	public Forum(Room room){
		this.room = room;
		users=new ArrayList<ChatSession>();
	}
	
	public Forum(Room room,ChatSession session) {
		this.room = room;
		users=new ArrayList<ChatSession>();
		joinUser(session);
	}
	
	public void joinUser(ChatSession session){
		users.add(session);
		notifyUserChange();
	}
	
	public void leaveUser(ChatSession session){
		users.remove(session);
		notifyUserChange();
	}
	
	public void speackAll(ChatSession session,String msg){
		Message message=new Message();
		message.setMsg(msg);
		message.setUser(session.getUser());
		message.setTime(new Date());
		speackAll(message);
	}
	
	public void speackAll(Message message){
		TextMessage tm=new TextMessage(new Gson().toJson(message));
		for (ChatSession s : users) {
			try {
				if(s.getSession().isOpen()){
					s.getSession().sendMessage(tm);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void notifyUserChange(){
		Message message=new Message();
		message.setType(1);
		speackAll(message);
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public List<ChatSession> getUsers() {
		return users;
	}
	
	
}
