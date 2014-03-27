package com.guxuede.gdxFramework.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.guxuede.gdxFramework.model.SecRole;


@Repository
public class SecRoleDao{
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public List<SecRole> findAll(){
		return entityManager.createQuery("select a from SecRole a",SecRole.class).getResultList();
	}

	public SecRole findById(long id){
		return entityManager.find(SecRole.class, id);
	}
	
	public void save(SecRole sa){
		entityManager.persist(sa);
	}
}