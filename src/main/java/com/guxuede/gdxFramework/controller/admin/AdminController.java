package com.guxuede.gdxFramework.controller.admin;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
@RequestMapping("/admin/")
public class AdminController {


	
	
	@RequestMapping(method=RequestMethod.GET)
	public String index(){
		return "admin/index";
	}

	@RequestMapping(value="data",method=RequestMethod.GET)
	public String dataDictionary(){
		return "admin/dataDictionary";
	}
}
