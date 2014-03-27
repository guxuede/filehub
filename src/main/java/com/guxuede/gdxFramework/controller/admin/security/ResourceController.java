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
import com.guxuede.gdxFramework.service.SecResourceService;
import com.guxuede.gdxFramework.service.SecRoleAuthoritiesService;

@Controller
@RequestMapping("/admin/security/")
public class ResourceController {
	
	@Autowired
	private SecResourcesDao secResourcesDao;
	
	@Autowired
	private SecResourceService secResourceService;
	
	@RequestMapping(value="resource",method=RequestMethod.GET)
	public String role(Model model){
		List<SecResource> secResources=secResourcesDao.findAll();
		model.addAttribute("resources", secResources);
		return "admin/security/resource";
	}

	@RequestMapping(value="resource/{resource}",method=RequestMethod.GET)
	public String roleShow(Model model,@PathVariable long resource){
		SecResource selectResource=secResourcesDao.findById(resource);
		List<SecResource> secResources=secResourcesDao.findAll();
		model.addAttribute("selectResource", selectResource);
		model.addAttribute("resources", secResources);
		return "admin/security/resource";
	}
	
	@RequestMapping(value="resource/{resource}",method=RequestMethod.POST)
	public String roleSave(Model model,@PathVariable long resource,String name,String description,String type,String url,boolean enables){
		secResourceService.update(resource, name, description,type,url, enables );
		return "redirect:"+resource;
	}
	
	@RequestMapping(value="resource/add",method=RequestMethod.POST)
	public String roleAdd(Model model,String name,String description,String type,String url,boolean enables){
		SecResource resource=secResourceService.add(name, description,type,url, enables);
		return "redirect:"+resource.getId();
	}
}
