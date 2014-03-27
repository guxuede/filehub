package com.guxuede.gdxFramework.service;


import org.springframework.stereotype.Service;

import com.guxuede.gdxFramework.entity.Room;

@Service
public class RoomService {

	
	public Room createOrGetRoom(String name){
		Room r=DB.rooms.get(name);
		if(r==null){
			r=new Room(name,null,null);
			DB.rooms.put(name, r);
		}
		return r;
	}
	
	public Room getRoom(String name){
		Room r=DB.rooms.get(name);
		return r;
	}
	
	public Room getWelcomeRoom(){
		return DB.rooms.get("大厅");
	}
	
}
