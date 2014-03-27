package com.guxuede.gdxFramework.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/css/")
public class CssController {
	
	@RequestMapping(value = "/1", method = RequestMethod.GET)
	public String css1(){
		return "cssStudy/css1";
	}
}
