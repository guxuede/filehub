package com.guxuede.gdxFramework.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.guxuede.gdxFramework.entity.ChatSession;
import com.guxuede.gdxFramework.entity.SimsimiResponse;

@Service
public class RobertService {
	
	private static final String ROBERTNAME="@JAVA";
	
	@Autowired
	private ChatService chatService;
	
	
	public boolean robertCanResponse(String msg){
		if(StringUtils.startsWithIgnoreCase(msg, ROBERTNAME)){
			return true;
		}
		return false;
	}

	public void robertDo(ChatSession user,String message){
		String req = message.substring(ROBERTNAME.length()).trim();
		ChatSession robert=chatService.getOrCreateRoomRobert(user.getRoom());
		chatService.userSpeack(user, message);
		if(StringUtils.isEmpty(req)){
			chatService.userSpeack(robert, "@"+user.getUser().getName()+",然后呢,说呀...");
		}else{
			String sim=talkToSimsimi(req);
			chatService.userSpeack(robert, "@"+user.getUser().getName()+","+sim);
		}
	}

	
	private String talkToSimsimi(String msg) {
		// if(msg!=null){
		// return "断网了,暂时休息下";
		// }
		InputStreamReader reader = null;
		try {
			String us = "http://api.simsimi.com/request.p?key=a1156453-bd1d-4617-9783-a5ef440a4cef&lc=zh&ft=1.0&text="+ URLEncoder.encode(msg, "utf-8");
			System.out.println(us);
			URL u = new URL(us);
			URLConnection conn = u.openConnection();
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(5000);
			reader = new InputStreamReader(conn.getInputStream(),"utf-8");
			SimsimiResponse res = new Gson().fromJson(reader,SimsimiResponse.class);
			System.out.println(res.getResponse());
			if (res.getResult() == 100) {
				return res.getResponse();
			} else if (res.getResult() == 404) {
				return "呃,无法理解(404)...";
			} else if (res.getResult() == 500) {
				return "救命,我的脑子崩溃了(500)...";
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
			return "我脑子出异常(" + e.getCause() != null ? e.getCause().getMessage() : "2了" + ")了,暂时无法回应你...";
		} finally {
			try {
				if (reader != null)
					reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "我脑子出异常了,暂时无法回应你...";
	}
}
