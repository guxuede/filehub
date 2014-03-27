package com.guxuede.gdxFramework.dao;


import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.guxuede.gdxFramework.model.SecAuthoritie;


@Repository
public class SecAuthoritiesDao {

	
	@PersistenceContext
	private EntityManager entityManager;
	
	public List<SecAuthoritie> findAll(){
		return entityManager.createQuery("select a from SecAuthoritie a",SecAuthoritie.class).getResultList();
	}
	
	public SecAuthoritie findById(long id){
		return entityManager.find(SecAuthoritie.class, id);
	}
	
	public List<SecAuthoritie> findByIds(Set<Long> ids){
		return entityManager.createQuery("select a from SecAuthoritie a where id in (:ids)",SecAuthoritie.class).setParameter("ids", ids).getResultList();
	}
	
	public void save(SecAuthoritie sa){
		entityManager.persist(sa);
	}
}
