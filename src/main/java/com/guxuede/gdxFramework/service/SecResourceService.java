package com.guxuede.gdxFramework.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guxuede.gdxFramework.dao.SecResourcesDao;
import com.guxuede.gdxFramework.model.SecResource;

@Service
public class SecResourceService {
	
	@Autowired
	private SecResourcesDao secResourcesDao;
	
	@CacheEvict(value="__ResourceRoleMap",allEntries=true)
	@Transactional
	public void update(long resourceId,String name,String description,String type,String url,boolean enables){
		SecResource resource=secResourcesDao.findById(resourceId);
		resource.setName(name);
		resource.setDescription(description);
		resource.setEnables(enables);
		resource.setType(type);
		resource.setUrl(url);
	}
	
	@CacheEvict(value="__ResourceRoleMap",allEntries=true)
	@Transactional
	public SecResource add(String name,String description,String type,String url,boolean enables){
		SecResource resource=new SecResource();
		resource.setName(name);
		resource.setDescription(description);
		resource.setEnables(enables);
		resource.setType(type);
		resource.setUrl(url);
		secResourcesDao.save(resource);
		return resource;
	}
}
