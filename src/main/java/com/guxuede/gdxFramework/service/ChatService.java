package com.guxuede.gdxFramework.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guxuede.gdxFramework.entity.ChatSession;
import com.guxuede.gdxFramework.entity.Forum;
import com.guxuede.gdxFramework.entity.Room;
import com.guxuede.gdxFramework.entity.User;

@Service
public class ChatService {
	
	@Autowired
	private UserService userService;

	public Forum createOrJoinForum(Room r,ChatSession session){
		Forum f=DB.forums.get(r);
		if(f==null){
			session.setRoom(r);
			f=new Forum(r);
			DB.forums.put(r,f);
		}
		f.joinUser(session);
		return f;
	}
	
	public void userRemove(Room r,ChatSession session){
		Forum f=DB.forums.get(r);
		if(f!=null){
			f.leaveUser(session);
		}
	}
	
	public void userSpeack(ChatSession session,String msg){
		DB.forums.get(session.getRoom()).speackAll(session, msg);
	}

	public ChatSession getOrCreateRoomRobert(Room r){
		ChatSession cs=DB.roberts.get(r);
		if(cs==null){
			cs=new ChatSession();
			User u=userService.createRobertUser(r.getName());
			cs.setRoom(r);
			cs.setUser(u);
			DB.roberts.put(r, cs);
		}
		return cs;
	}
	
	public List<ChatSession> getRoomChatSession(Room r){
		return DB.forums.get(r).getUsers();
	}
}
