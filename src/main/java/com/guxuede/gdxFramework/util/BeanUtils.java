package com.guxuede.gdxFramework.util;

import com.guxuede.gdxFramework.dto.PersonDTO;
import com.guxuede.gdxFramework.model.Person;



public abstract class BeanUtils {

	/**
	 * 将orig的属性尽可能的复制到dest中,即复制orig和dest同样有的属性
	 * @param orig
	 * @param dest
	 * @param fileds fileds如果不为空的话,将选择fileds字段从orig到dest中
	 */
	public static void copyPropertys(Object orig,Object dest,String... fileds){
		System.out.println(fileds);
		if(fileds==null || fileds.length==0){
			try {
				org.springframework.beans.BeanUtils.copyProperties(dest, orig);
			} catch (Exception e) {
				e.printStackTrace();//Ignore invalid property
			}
		}else{
			for(String filed:fileds){
				try {
					Object value = org.apache.commons.beanutils.BeanUtils.getProperty(orig, filed);
					org.apache.commons.beanutils.BeanUtils.setProperty(dest, filed, value);
				} catch (Exception e) {
					e.printStackTrace();
					continue;//Ignore invalid property
				}
			}
		}
	}
	
	public static void main(String[] args) {
		Person p=new Person();
		PersonDTO p1=new PersonDTO();
		copyPropertys(p1, p);
	}
}
