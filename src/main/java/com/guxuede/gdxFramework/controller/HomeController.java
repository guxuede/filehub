package com.guxuede.gdxFramework.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.guxuede.gdxFramework.entity.Room;
import com.guxuede.gdxFramework.security.UserDetailServiceImpl;
import com.guxuede.gdxFramework.service.RoomService;


/**
 * Sample controller for going to the home page with a message
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private RoomService roomService;
	
	/**
	 * Selects the home page and populates the model with a message
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model,
			@CookieValue(value="name", required=false) String name,
			@CookieValue(value="room", required=false) String room) {
		System.out.println(name);
		if(name==null){
			return "enter";
		}else{
			Room r=room==null?null:roomService.getRoom(room);
			if(r==null){
				r=roomService.getWelcomeRoom();
			}
			model.addAttribute("room", r);
			return "index";
		}
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		return "enter";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {
		return "home";
	}
}
