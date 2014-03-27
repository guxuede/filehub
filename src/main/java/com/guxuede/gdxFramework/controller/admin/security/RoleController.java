package com.guxuede.gdxFramework.controller.admin.security;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.guxuede.gdxFramework.dao.SecAuthoritiesDao;
import com.guxuede.gdxFramework.dao.SecResourcesDao;
import com.guxuede.gdxFramework.dao.SecRoleDao;
import com.guxuede.gdxFramework.model.SecAuthoritie;
import com.guxuede.gdxFramework.model.SecResource;
import com.guxuede.gdxFramework.model.SecRole;
import com.guxuede.gdxFramework.service.SecRoleAuthoritiesService;

@Controller
@RequestMapping("/admin/security/")
public class RoleController {
	
	@Autowired
	private SecRoleDao secRoleDao;
	
	@Autowired
	private SecAuthoritiesDao secAuthoritiesDao;
	
	@Autowired
	private SecResourcesDao secResourcesDao;
	
	@Autowired
	private SecRoleAuthoritiesService secRoleServiceAuthorities;
	
	@RequestMapping(value="role",method=RequestMethod.GET)
	public String role(Model model){
		List<SecRole> secRoles=secRoleDao.findAll();
		List<SecAuthoritie> secAuthorities=secAuthoritiesDao.findAll();
		List<SecResource> secResources=secResourcesDao.findAll();
		model.addAttribute("roles", secRoles);
		model.addAttribute("authorities", secAuthorities);
		model.addAttribute("resources", secResources);
		return "admin/security/role";
	}

	@RequestMapping(value="role/{role}",method=RequestMethod.GET)
	public String roleShow(Model model,@PathVariable long role){
		SecRole selectRole=secRoleDao.findById(role);
		List<SecRole> secRoles=secRoleDao.findAll();
		List<SecAuthoritie> secAuthorities=secAuthoritiesDao.findAll();
		List<SecResource> secResources=secResourcesDao.findAll();
		model.addAttribute("selectRole", selectRole);
		model.addAttribute("roles", secRoles);
		model.addAttribute("authorities", secAuthorities);
		model.addAttribute("resources", secResources);
		return "admin/security/role";
	}
	
	@RequestMapping(value="role/{role}",method=RequestMethod.POST)
	public String roleSave(Model model,@PathVariable long role,@RequestParam Set<Long> authorities,String name,String description,boolean enables ){
		System.out.println(enables);
		secRoleServiceAuthorities.update(role, authorities, name, description, enables );
		return "redirect:"+role;
	}
	
	@RequestMapping(value="role/add",method=RequestMethod.POST)
	public String roleAdd(Model model,@RequestParam Set<Long> authorities,String name,String description,boolean enables ){
		System.out.println(enables);
		SecRole role=secRoleServiceAuthorities.add(authorities, name, description, enables );
		return "redirect:"+role.getId();
	}
}
