package com.guxuede.gdxFramework.security;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.guxuede.gdxFramework.dao.SecUsersDao;
import com.guxuede.gdxFramework.entity.User;
import com.guxuede.gdxFramework.model.SecAuthoritie;
import com.guxuede.gdxFramework.model.SecRole;
import com.guxuede.gdxFramework.model.SecUser;

/**
 * 得到用户信息,和用户的所持有的权限
 * 1.得到用户信息,用来登录
 * 2.得到其所持有权限,用来判定权限
 * @author {guxuede}
 *
 */
@Service("userDetailServiceImpl")
//make sure this bean can inject to applicationContext-Security.xml
public class UserDetailServiceImpl implements UserDetailsService {
	
	@Autowired
	private SecUsersDao usersDao;

	@Override
	public UserDetails loadUserByUsername(String username)throws UsernameNotFoundException {
		System.out.println("username is " + username);
		SecUser users=null;
		try {
			users = this.usersDao.findByName(username);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UsernameNotFoundException(username,e);
		}
		if(users == null) {
			throw new UsernameNotFoundException(username);
		}
		
		Collection<GrantedAuthority> grantedAuths = obtionGrantedAuthorities(users);
		try {
			Boolean enables = users.getEnables();
			Boolean accountNonExpired = users.getAccountNonExpired();
			Boolean credentialsNonExpired = users.getCredentialsNonExpired();
			Boolean accountNonLocked = users.getAccountNonLocked();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("getPassword:"+users.getPassword());
		SecUserDetails userdetail = new SecUserDetails(username, users.getPassword(), true,true,true,true,/*enables, accountNonExpired, credentialsNonExpired, accountNonLocked,*/ grantedAuths);
		return userdetail;
	}

	
	private Set<GrantedAuthority> obtionGrantedAuthorities(SecUser user) {
		Set<GrantedAuthority> authSet = new HashSet<GrantedAuthority>();
		Set<SecRole> roles = user.getRoles();
		for(SecRole role : roles) {
//			Set<Resources> tempRes = role.getResources();
//			for(Resources res : tempRes) {
//				authSet.add(new GrantedAuthorityImpl(res.getName()));
//			}
//			for(SecAuthoritie a:role.getAuthorities()){
//				SimpleGrantedAuthority sga=new SimpleGrantedAuthority(a.getName());
//				authSet.add(sga);
//			}
			System.out.println("用户权限:"+role.getName());
			SimpleGrantedAuthority sga=new SimpleGrantedAuthority(role.getName());
			authSet.add(sga);
		}
		return authSet;
	}
}
