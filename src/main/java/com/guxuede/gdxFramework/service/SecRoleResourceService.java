package com.guxuede.gdxFramework.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.stereotype.Service;

import com.guxuede.gdxFramework.dao.SecRoleDao;
import com.guxuede.gdxFramework.model.SecAuthoritie;
import com.guxuede.gdxFramework.model.SecResource;
import com.guxuede.gdxFramework.model.SecRole;

@Service
public class SecRoleResourceService {

	@Autowired
	private SecRoleDao secRoleDao;
	

	@Cacheable(value="__ResourceRoleMap")   
	public HashMap<String, Collection<ConfigAttribute>> loadResourceRoleMap(){
		HashMap<String, Collection<ConfigAttribute>> resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
		 List<SecRole> roles=secRoleDao.findAll();
		 for(SecRole role:roles){
			 ConfigAttribute ca = new SecurityConfig(role.getName());
			 for(SecAuthoritie sa:role.getAuthorities()){
				 for(SecResource res:sa.getResources()){
					 String url = res.getUrl();
						if (resourceMap.containsKey(url)) {
							Collection<ConfigAttribute> atts = resourceMap.get(url);
							atts.add(ca);
						} else {
							Collection<ConfigAttribute> atts = new HashSet<ConfigAttribute>();
							atts.add(ca);
							resourceMap.put(url, atts);
						}
				 }
			 }
		 }
		 System.out.println("权限加载完毕:");
		 for(String url:resourceMap.keySet()){
			 System.out.println(url+" 所需权限:"+resourceMap.get(url));
		 }
		return resourceMap;
	}

}
