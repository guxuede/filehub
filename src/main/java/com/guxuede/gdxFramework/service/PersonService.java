package com.guxuede.gdxFramework.service;

import java.util.ArrayList;
import java.util.List;

import org.dozer.DozerBeanMapper;
import org.dozer.spring.DozerBeanMapperFactoryBean;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;

import com.guxuede.gdxFramework.dao.PersonDao;
import com.guxuede.gdxFramework.dto.ValidatorResultDTO;
import com.guxuede.gdxFramework.dto.ValidatorResultDTO.FieldError;
import com.guxuede.gdxFramework.model.Person;

@Service
public class PersonService {
	
	@Autowired
	private PersonDao personDao;
	
	@Autowired 
	private javax.validation.Validator validator;
	
	@Autowired
	private DozerBeanMapper dozerBeanMapper;
	
	@Transactional
	public ValidatorResultDTO updatePerson(Long id,Object person,BindingResult bindingResult,String... fields){
		List<FieldError> fieldErrors=new ArrayList<FieldError>();
		
	    for (ObjectError error : bindingResult.getAllErrors() ) {
	    	if(error instanceof org.springframework.validation.FieldError){
	    		org.springframework.validation.FieldError fe=(org.springframework.validation.FieldError) error;
	    		fieldErrors.add(new FieldError(fe.getField(), fe.getDefaultMessage()));
	    		System.err.println (error.getClass().getName()+","+error.getObjectName() + " - " + error.getDefaultMessage());
	    	}
	    }
		Person dbObject=personDao.find(id);
		System.err.println(dbObject);
		//BeanUtils.copyPropertys(person, dbObject, fields);
		//dozerBeanMapper.map(person, dbObject);
		BeanUtils.copyProperties(person, dbObject);
		System.err.println(dbObject);
		return new ValidatorResultDTO(fieldErrors);
	}

}
