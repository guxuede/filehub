package com.guxuede.gdxFramework.util.support;

import java.text.DateFormat;
import java.util.Locale;

public class DateFormatter extends org.springframework.format.datetime.DateFormatter{
	
	private String locale;
	private Locale local;
	
	@Override
	protected DateFormat getDateFormat(Locale locale) {
		if(local!=null)locale=local;
		return super.getDateFormat(locale);
	}

	public void setLocale(String locale) {
		this.local = locale!=null && !"".equals(locale)?Locale.forLanguageTag(locale):null;
		this.locale = locale;
	}

	
	public String getLocale() {
		return locale;
	}
	
}
