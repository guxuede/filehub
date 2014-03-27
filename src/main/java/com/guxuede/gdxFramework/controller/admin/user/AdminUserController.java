package com.guxuede.gdxFramework.controller.admin.user;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guxuede.gdxFramework.dao.PersonDao;
import com.guxuede.gdxFramework.dao.SecUsersDao;
import com.guxuede.gdxFramework.dto.PersonDTO;
import com.guxuede.gdxFramework.dto.ValidatorResultDTO;
import com.guxuede.gdxFramework.model.Person;
import com.guxuede.gdxFramework.service.PersonService;
import com.guxuede.gdxFramework.util.support.ObjectMapper;


@Controller
@RequestMapping("/admin/user/")
public class AdminUserController {
	
	@Autowired
	private SecUsersDao usersDao;
	
	@Autowired
	private PersonDao personDao;
	
	@Autowired
	private PersonService personService;

	@RequestMapping(method=RequestMethod.GET)
	public String index(Model model,String p){
		System.err.println(p);
		if("1".equals(p)){
			return "admin/user/userlist1";
		}else if("2".equals(p)){
			return "admin/user/userlist2";
		}
		return "admin/user/userlist";
	}

	@RequestMapping(value="list",method=RequestMethod.GET)
	public String list(Model model){
		List<Person> persons=personDao.getPeople();
		model.addAttribute("currpage", 0);
		model.addAttribute("totalpages", 0);
		model.addAttribute("totalrecords", persons.size());
		model.addAttribute("listData", persons);
		return "admin/user/userlist";
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String update(Model model,Long id,PersonDTO person,BindingResult bindingResult){
		System.err.println(person);
		ValidatorResultDTO result=personService.updatePerson(id, person, bindingResult);
		model.addAttribute(result);
		return "admin/user/userlist";
	}
	
	@RequestMapping(value="add",method={RequestMethod.POST,RequestMethod.GET})
	public String add(Model model,Long id,@RequestBody List<PersonDTO> person){
		System.out.println(person);
		model.addAttribute("person", person);
		return "admin/user/userlist";
	}
	
	@RequestMapping(value="test1",method=RequestMethod.GET)
	public String testResponseBody(Model model){
		PersonDTO o=new PersonDTO();
		o.setBirthday(new Date());
		o.setMoney(new BigDecimal("7431.12"));
		o.setMfloat(1234.456f);
		
		System.err.println("======================================");
		ObjectMapper objectMapper=new ObjectMapper();
		try {
			PersonDTO p=objectMapper.readValue("{\"PersonDTO\":{\"mfloat\":\"1234.456\",\"money\":\"7431.12\"}}", PersonDTO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "admin/user/userlist2";
	}
	
	@RequestMapping(value="test1_save",method=RequestMethod.POST)
	@ResponseBody
	public PersonDTO testResponseBody1(Model model,@RequestBody PersonDTO dto){
		return dto;
	}
	
	@RequestMapping(value="test2",method=RequestMethod.GET)
	public String test2(Model model){
		PersonDTO o=new PersonDTO();
		o.setBirthday(new Date());
		o.setMoney(new BigDecimal("7431.12"));
		o.setMfloat(1234.456f);
		model.addAttribute("user", o);
		return "admin/user/userlist2";
	}
	
	@RequestMapping(value="test2_save",method=RequestMethod.POST)
	public String test2_(Model model,PersonDTO p){
		System.err.println(p);
		model.addAttribute("user", p);
		return "admin/user/userlist2";
	}
	
	@RequestMapping(value="test3",method=RequestMethod.GET)
	public String test3(Model model){
		return "admin/user/userlist3";
	}
}
