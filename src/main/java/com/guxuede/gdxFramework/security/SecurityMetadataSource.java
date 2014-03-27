package com.guxuede.gdxFramework.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.util.AntPathMatcher;

import com.guxuede.gdxFramework.dao.SecAuthoritiesDao;
import com.guxuede.gdxFramework.dao.SecResourcesDao;
import com.guxuede.gdxFramework.dao.SecRoleDao;
import com.guxuede.gdxFramework.model.SecAuthoritie;
import com.guxuede.gdxFramework.model.SecResource;
import com.guxuede.gdxFramework.model.SecRole;
import com.guxuede.gdxFramework.service.SecRoleResourceService;

@Component("securityMetadataSource")
//make sure this bean can inject to applicationContext-Security.xml
public class SecurityMetadataSource implements FilterInvocationSecurityMetadataSource {

	@Autowired
	private SecResourcesDao resourcesDao;
	
	@Autowired
	private SecAuthoritiesDao authoritiesDao;
	
	@Autowired
	private SecRoleDao roleDao;
	
	@Autowired
	private SecRoleResourceService roleResourceService;
	
	private AntPathMatcher urlMatcher = new AntPathMatcher();

	
	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {
		System.out.println("getAllConfigAttributes");
		Collection<ConfigAttribute> allConfigAttributes=new HashSet<ConfigAttribute>();
		 List<SecRole> roles=roleDao.findAll();
		 for(SecRole role:roles){
			 ConfigAttribute ca = new SecurityConfig(role.getName());
			 allConfigAttributes.add(ca);
		 }
//		if(resourceMap==null){
//			loadResourceDefine();
//		}
		return allConfigAttributes;
	}

	@Override
	public Collection<ConfigAttribute> getAttributes(Object object)throws IllegalArgumentException {
		HashMap<String, Collection<ConfigAttribute>> resourceMap=roleResourceService.loadResourceRoleMap();
		String commingurl = ((FilterInvocation) object).getRequestUrl();
		int firstQuestionMarkIndex = commingurl.indexOf("?");
		if (firstQuestionMarkIndex != -1) {
			commingurl = commingurl.substring(0, firstQuestionMarkIndex);
		}
		Collection<ConfigAttribute> urlConfigAttribute=null;
		for(String resURL:resourceMap.keySet()){
			if (urlMatcher.match(resURL, commingurl)) {
				urlConfigAttribute=resourceMap.get(resURL);
				break;
			}
		}
		System.out.println("查询到URL:"+commingurl+"所需权限有:"+urlConfigAttribute);
		return urlConfigAttribute;
	}
	
	static HashMap<String, Collection<ConfigAttribute>> resourceMap = null;
	
	
	private void loadResourceDefine() {
		resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
		 List<SecRole> roles=roleDao.findAll();
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
	}

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return true;
	}

}
