package com.guxuede.gdxFramework.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guxuede.gdxFramework.dao.SecAuthoritiesDao;
import com.guxuede.gdxFramework.dao.SecRoleDao;
import com.guxuede.gdxFramework.model.SecAuthoritie;
import com.guxuede.gdxFramework.model.SecRole;

@Service
public class SecRoleAuthoritiesService {

	@Autowired
	private SecRoleDao secRoleDao;
	
	@Autowired
	private SecAuthoritiesDao secAuthoritiesDao;
	
	@CacheEvict(value="__ResourceRoleMap",allEntries=true)
	@Transactional
	public void update(long roleId,Set<Long> authorities,String name,String description,boolean enables){
		System.out.println(authorities);
		SecRole selectRole=secRoleDao.findById(roleId);
		List<SecAuthoritie> secAuthorities=secAuthoritiesDao.findByIds(authorities);
		Set<SecAuthoritie> a=new HashSet<SecAuthoritie>();
		for(SecAuthoritie sa:secAuthorities){
			a.add(sa);
		}
		selectRole.setName(name);
		selectRole.setDescription(description);
		selectRole.setEnables(enables);
		selectRole.setAuthorities(a);
	}
	
	@CacheEvict(value="__ResourceRoleMap",allEntries=true)
	@Transactional
	public SecRole add(Set<Long> authorities,String name,String description,boolean enables){
		System.out.println(authorities);
		SecRole selectRole=new SecRole();
		List<SecAuthoritie> secAuthorities=secAuthoritiesDao.findByIds(authorities);
		Set<SecAuthoritie> a=new HashSet<SecAuthoritie>();
		for(SecAuthoritie sa:secAuthorities){
			a.add(sa);
		}
		selectRole.setName(name);
		selectRole.setDescription(description);
		selectRole.setEnables(enables);
		selectRole.setAuthorities(a);
		secRoleDao.save(selectRole);
		return selectRole;
	}
}
