package com.guxuede.gdxFramework.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.guxuede.gdxFramework.dao.SecAuthoritiesDao;
import com.guxuede.gdxFramework.dao.PersonDao;
import com.guxuede.gdxFramework.dto.PersonFormDto;
import com.guxuede.gdxFramework.dto.ValidatorResultDTO;
import com.guxuede.gdxFramework.model.Person;
import com.guxuede.gdxFramework.service.PersonService;

@Controller
@RequestMapping("/person/")
public class PersonController {
	
	private static final Logger logger = LoggerFactory.getLogger(PersonController.class);

	@Autowired
	private PersonDao personDao;
	
	@Autowired
	private SecAuthoritiesDao authoritiesDao;
	
	@Autowired
	private PersonService personService;
	
	@RequestMapping(method=RequestMethod.GET,value="edit")
	public ModelAndView editPerson(@RequestParam(value="id",required=false) Long id) {		
		logger.debug("Received request to edit person id : "+id);				
		ModelAndView mav = new ModelAndView();		
 		mav.setViewName("edit");
 		Person person = null;
 		if (id == null) {
 			person = new Person();
 		} else {
 			person = personDao.find(id);
 		}
 		
 		mav.addObject("person", person);
		return mav;
		
	}
	
	@RequestMapping(method=RequestMethod.POST,value="edit") 
	public String savePerson(@Valid @ModelAttribute Person person,BindingResult aErrors) throws IllegalAccessException, InvocationTargetException {
		logger.debug("Received postback on person "+person);		
		personDao.save(person);
		return "redirect:list";
		
	}
	
	@RequestMapping(method=RequestMethod.GET,value="list")
	public ModelAndView listPeople() {
		System.out.println(authoritiesDao.findAll());
		logger.debug("Received request to list persons");
		ModelAndView mav = new ModelAndView();
		List<Person> people = personDao.getPeople();
		logger.debug("Person Listing count = "+people.size());
		mav.addObject("people",people);
		mav.setViewName("personlist");
		return mav;
		
	}

	@RequestMapping(method=RequestMethod.POST,value="update/{identifier}") 
	@ResponseBody
	public ValidatorResultDTO updatePerson(@PathVariable long identifier,@Valid PersonFormDto person,BindingResult bindingResult,String[] _filed) {
		ValidatorResultDTO v=personService.updatePerson(identifier, person, bindingResult, _filed);
		System.err.println(Arrays.toString(_filed));
		return v;
	}
}
