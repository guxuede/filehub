package com.guxuede.gdxFramework.service;

import java.util.concurrent.ConcurrentHashMap;

import com.guxuede.gdxFramework.entity.ChatSession;
import com.guxuede.gdxFramework.entity.Forum;
import com.guxuede.gdxFramework.entity.Room;
import com.guxuede.gdxFramework.entity.User;

public class DB {
	
	public static ConcurrentHashMap<String, Room> rooms = new ConcurrentHashMap<String,Room>();
	public static ConcurrentHashMap<Room, Forum> forums = new ConcurrentHashMap<Room,Forum>();
	public static ConcurrentHashMap<Room, ChatSession> roberts = new ConcurrentHashMap<Room,ChatSession>();
	
	static {
		rooms.put("大厅", new Room("大厅","../resources/img/dating.jpg","../resources/img/dating.jpg"));
		rooms.put("厨房", new Room("厨房","../resources/img/chufang.jpg","../resources/img/chufang.jpg"));
	}
}
