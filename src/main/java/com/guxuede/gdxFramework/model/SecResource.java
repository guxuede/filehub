package com.guxuede.gdxFramework.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="SecResource")
@Table(name="T_SEC_RESOURCES")
public class SecResource implements Serializable{


	private static final long serialVersionUID = 3260186749267872918L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column
	private String name;
	@Column
	private String description;
	
	@Column
	private String type;
	
	@Column
	private String url;
	
	@Column
	private Boolean enables;

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Boolean getEnables() {
		return enables;
	}

	public void setEnables(Boolean enables) {
		this.enables = enables;
	}
	
	
}
