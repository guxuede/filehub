package com.guxuede.gdxFramework.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.guxuede.gdxFramework.model.SecUser;


@Repository
public class SecUsersDao{
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public SecUser findByName(String username){
		return (SecUser) entityManager.createQuery("select u from SecUser u where u.username = ?")
		.setParameter(1, username).getSingleResult();
	}

}