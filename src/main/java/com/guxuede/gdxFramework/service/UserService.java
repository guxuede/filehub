package com.guxuede.gdxFramework.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guxuede.gdxFramework.entity.ChatSession;
import com.guxuede.gdxFramework.entity.Room;
import com.guxuede.gdxFramework.entity.User;

@Service
public class UserService {
	
	@Autowired
	private RoomService roomService;
	@Autowired
	private ChatService chatService;

	public User createUser(String name,String avatar,String color){
		return new User(name,avatar,color);
	}
	
	public User createRobertUser(String room){
		return new User("java","../resources/img/java.jpg","red");
	}
	
	public List<User> getUserList(String room){
		Room r=roomService.getRoom(room);
		if(r==null)return new ArrayList<User>(0);
		List<ChatSession> css=chatService.getRoomChatSession(r);
		List<User> user=new ArrayList<User>();
		for(ChatSession c:css){
			user.add(c.getUser());
		}
		return user;
	}
	
}
