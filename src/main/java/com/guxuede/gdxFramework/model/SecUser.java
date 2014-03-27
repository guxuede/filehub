package com.guxuede.gdxFramework.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name="SecUser")
@Table(name="T_SEC_USER")
public class SecUser implements Serializable{

	private static final long serialVersionUID = 1954463409859629741L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column
	private String username;
	
	@Column
	private String password;
	@Column
	private Boolean enables;
	@Column
	private Boolean accountNonExpired;
	@Column
	private Boolean credentialsNonExpired;
	@Column
	private Boolean accountNonLocked;
	
	@OneToMany
	private Set<SecRole> roles;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Boolean getEnables() {
		return enables;
	}
	public void setEnables(Boolean enables) {
		this.enables = enables;
	}
	public Boolean getAccountNonExpired() {
		return accountNonExpired;
	}
	public void setAccountNonExpired(Boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}
	public Boolean getCredentialsNonExpired() {
		return credentialsNonExpired;
	}
	public void setCredentialsNonExpired(Boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}
	public Boolean getAccountNonLocked() {
		return accountNonLocked;
	}
	public void setAccountNonLocked(Boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}
	public Set<SecRole> getRoles() {
		return roles;
	}
	public void setRoles(Set<SecRole> roles) {
		this.roles = roles;
	}
	
}
