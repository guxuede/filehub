package com.guxuede.gdxFramework.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guxuede.gdxFramework.entity.User;
import com.guxuede.gdxFramework.service.UserService;


/**
 * Sample controller for going to the home page with a message
 */
@Controller
@RequestMapping("/socket")
public class SocketController {

	@Autowired
	private UserService userService;
	/**
	 * Selects the home page and populates the model with a message
	 */
	@RequestMapping(value = "/{room}/users", method = RequestMethod.GET)
	@ResponseBody
	public List<User> getUser(Model model,@PathVariable(value="room")String room) {
		return userService.getUserList(room);
	}
	

}
