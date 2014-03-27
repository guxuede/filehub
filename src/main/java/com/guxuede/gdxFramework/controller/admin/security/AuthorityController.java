package com.guxuede.gdxFramework.controller.admin.security;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
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
import com.guxuede.gdxFramework.service.SecAuthoritiesResourceService;
import com.guxuede.gdxFramework.service.SecRoleAuthoritiesService;

@Controller
@RequestMapping("/admin/security/")
public class AuthorityController {
	
	@Autowired
	private SecAuthoritiesDao secAuthoritiesDao;
	
	@Autowired
	private SecResourcesDao secResourcesDao;
	
	@Autowired
	private SecAuthoritiesResourceService secAuthoritiesResourceService;
	
	@RequestMapping(value="authority",method=RequestMethod.GET)
	public String authority(Model model){
		List<SecAuthoritie> secAuthorities=secAuthoritiesDao.findAll();
		List<SecResource> secResources=secResourcesDao.findAll();
		model.addAttribute("authorities", secAuthorities);
		model.addAttribute("resources", secResources);
		return "admin/security/authority";
	}

	@RequestMapping(value="authority/{authority}",method=RequestMethod.GET)
	public String authorityShow(Model model,@PathVariable long authority){
		SecAuthoritie selectAuthority=secAuthoritiesDao.findById(authority);
		List<SecAuthoritie> secAuthorities=secAuthoritiesDao.findAll();
		List<SecResource> secResources=secResourcesDao.findAll();
		model.addAttribute("selectAuthority", selectAuthority);
		model.addAttribute("authorities", secAuthorities);
		model.addAttribute("resources", secResources);
		return "admin/security/authority";
	}
	
	@RequestMapping(value="authority/{authority}",method=RequestMethod.POST)
	public String authoritySave(Model model,@PathVariable long authority,@RequestParam Set<Long> resources,String name,String description,boolean enables ){
		secAuthoritiesResourceService.update(authority, resources, name, description, enables );
		return "redirect:"+authority;
	}
	
	@RequestMapping(value="authority/add",method=RequestMethod.POST)
	public String authorityAdd(Model model,@RequestParam Set<Long> resources,String name,String description,boolean enables ){
		SecAuthoritie authority=secAuthoritiesResourceService.add(resources, name, description, enables );
		return "redirect:"+authority.getId();
	}
}
