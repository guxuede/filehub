package com.guxuede.gdxFramework.entity;

import org.springframework.web.socket.WebSocketSession;


public class ChatSession {
	private Room room;
	private WebSocketSession session;
	private User user;
	
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public WebSocketSession getSession() {
		return session;
	}
	public void setSession(WebSocketSession session) {
		this.session = session;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
