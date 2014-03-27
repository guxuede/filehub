package com.guxuede.gdxFramework.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guxuede.gdxFramework.dao.SecAuthoritiesDao;
import com.guxuede.gdxFramework.dao.SecResourcesDao;
import com.guxuede.gdxFramework.model.SecAuthoritie;
import com.guxuede.gdxFramework.model.SecResource;

@Service
public class SecAuthoritiesResourceService {

	@Autowired
	private SecAuthoritiesDao secAuthoritiesDao;
	
	@Autowired
	private SecResourcesDao secResourcesDao;
	
	@CacheEvict(value="__ResourceRoleMap",allEntries=true)
	@Transactional
	public void update(long authorityId,Set<Long> resource,String name,String description,boolean enables){
		SecAuthoritie selectAuthorities=secAuthoritiesDao.findById(authorityId);
		List<SecResource> secResources=secResourcesDao.findByIds(resource);
		Set<SecResource> a=new HashSet<SecResource>();
		for(SecResource sa:secResources){
			a.add(sa);
		}
		selectAuthorities.setName(name);
		selectAuthorities.setDescription(description);
		selectAuthorities.setEnables(enables);
		selectAuthorities.setResources(a);
	}
	
	@CacheEvict(value="__ResourceRoleMap",allEntries=true)
	@Transactional
	public SecAuthoritie add(Set<Long> resourceIds,String name,String description,boolean enables){
		SecAuthoritie selectSecAuthoritie=new SecAuthoritie();
		List<SecResource> secResources=secResourcesDao.findByIds(resourceIds);
		Set<SecResource> a=new HashSet<SecResource>();
		for(SecResource sa:secResources){
			a.add(sa);
		}
		selectSecAuthoritie.setName(name);
		selectSecAuthoritie.setDescription(description);
		selectSecAuthoritie.setEnables(enables);
		selectSecAuthoritie.setResources(a);
		secAuthoritiesDao.save(selectSecAuthoritie);
		return selectSecAuthoritie;
	}
}
