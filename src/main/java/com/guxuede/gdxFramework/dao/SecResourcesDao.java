package com.guxuede.gdxFramework.dao;

import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.guxuede.gdxFramework.model.SecResource;

@Repository
public class SecResourcesDao{
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public List<SecResource> findAll(){
		return entityManager.createQuery("select a from SecResource a",SecResource.class).getResultList();
	}
	
	public SecResource findById(long id){
		return entityManager.find(SecResource.class, id);
	}
	
	public List<SecResource> findByIds(Set<Long> ids){
		return entityManager.createQuery("select a from SecResource a where id in (:ids)",SecResource.class).setParameter("ids", ids).getResultList();
	}
	
	public void save(SecResource sa){
		entityManager.persist(sa);
	}
	
}
