package com.guxuede.gdxFramework.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.guxuede.gdxFramework.model.Person;
import com.guxuede.gdxFramework.util.BeanUtils;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class PersonDao {

	@PersistenceContext
	private EntityManager entityManager;
	
	public Person find(Long id) {
		return entityManager.find(Person.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Person> getPeople() {
		return entityManager.createQuery("select p from Person p").getResultList();
	}
	
	@Transactional
	public void saveByField(Long id,Object person, String... filed){
		Person dbObject=entityManager.find(Person.class, id);
		BeanUtils.copyPropertys(person, dbObject, filed);
	}
	
	@Transactional
	public void saveLastName(Long id, String lastName){
		Person dbObject=entityManager.find(Person.class, id);
		dbObject.setLastName(lastName);
	}
	
	
	@Transactional
	public Person save(Person person) {
		if (person.getId() == null) {
			entityManager.persist(person);
			return person;
		} else {
			return entityManager.merge(person);
		}		
	}	
	
}
