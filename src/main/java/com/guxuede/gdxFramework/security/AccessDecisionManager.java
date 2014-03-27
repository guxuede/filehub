package com.guxuede.gdxFramework.security;

import java.util.Collection;
import java.util.Iterator;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

@Component("accessDecisionManager")
//make sure this bean can inject to applicationContext-Security.xml
public class AccessDecisionManager implements org.springframework.security.access.AccessDecisionManager{

	@Override
	public void decide(Authentication userAuthentication, Object url,Collection<ConfigAttribute> urlConfigAttributes) throws AccessDeniedException,InsufficientAuthenticationException {
		System.out.println("判定的URL:"+url);
		System.out.println("该URL所需权限:"+urlConfigAttributes);
		System.out.println("用户所拥有权限:"+userAuthentication.getAuthorities());
		
		if(urlConfigAttributes == null) {
			System.out.println("该资源没有权限要求");
			return;
		}
		if(userAuthentication==null || userAuthentication.getAuthorities()==null || userAuthentication.getAuthorities().size() == 0){
			System.out.println("用户一点权限都木有");
			throw new AccessDeniedException("You Have No Authority 403!!!！ ");
		}
		
		//角色-资源 比对
		System.out.println("是否是登陆用户:"+userAuthentication.isAuthenticated());
		for(ConfigAttribute urlConfigAttribute:urlConfigAttributes){
			String needPermission = urlConfigAttribute.toString();
			System.out.println("needPermission:"+urlConfigAttribute);
			for(GrantedAuthority ga : userAuthentication.getAuthorities()) {
				if(StringUtils.equals(ga.getAuthority(), needPermission)) {
					return;
				}
			}
		}
		
		System.out.println("没有权限访问！");
		throw new AccessDeniedException("Authority Not Enough 403!!! ");
	}

	@Override
	public boolean supports(ConfigAttribute arg0) {
		return true;
	}

	@Override
	public boolean supports(Class<?> arg0) {
		return true;
	}

}
