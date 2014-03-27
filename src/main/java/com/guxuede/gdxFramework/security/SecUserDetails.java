package com.guxuede.gdxFramework.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class SecUserDetails implements UserDetails{

	private static final long serialVersionUID = 1L;
	
	private String username;
	private String password;
	private boolean enables;
	private boolean accountNonExpired;
	private boolean credentialsNonExpired;
	private boolean accountNonLocked;
	private Collection<GrantedAuthority> grantedAuths;
	
	public SecUserDetails(String username,String password,
		boolean enables ,
		boolean accountNonExpired,
		boolean credentialsNonExpired,
		boolean accountNonLocked,
		Collection<GrantedAuthority> grantedAuths) {
		
		this.username=username;
		this.password=password;
		this.enables=enables;
		this.accountNonExpired=accountNonExpired;
		this.credentialsNonExpired=credentialsNonExpired;
		this.accountNonLocked=accountNonLocked;
		this.grantedAuths=grantedAuths;
	}
	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return grantedAuths;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return username;
	}

	@Override
	public boolean isAccountNonExpired() {
		return accountNonExpired;
	}

	@Override
	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return credentialsNonExpired;
	}

	@Override
	public boolean isEnabled() {
		return enables;
	}

}
