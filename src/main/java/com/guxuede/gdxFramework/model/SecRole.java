package com.guxuede.gdxFramework.model;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name="SecRole")
@Table(name="T_SEC_ROLE")
public class SecRole implements Serializable{

	private static final long serialVersionUID = -2795186119322257614L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column
	private String name;
	@Column
	private String description;
	@Column
	private Boolean enables;
	
	//@OneToMany(fetch=FetchType.EAGER)
	@ManyToMany(cascade = CascadeType.REFRESH, fetch=FetchType.EAGER)
    @JoinTable(name = "t_sec_role_t_sec_authorities", 
    		joinColumns = @JoinColumn(name = "T_SEC_ROLE_id"), 
    		inverseJoinColumns = @JoinColumn(name = "authorities_id"))
	private Set<SecAuthoritie> authorities;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Boolean getEnables() {
		return enables;
	}
	public void setEnables(Boolean enables) {
		this.enables = enables;
	}
	public Set<SecAuthoritie> getAuthorities() {
		return authorities;
	}
	public void setAuthorities(Set<SecAuthoritie> authorities) {
		this.authorities = authorities;
	}
	
}
