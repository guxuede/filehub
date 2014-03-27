package com.guxuede.gdxFramework.util.support;

import java.util.Calendar;

import org.springframework.format.FormatterRegistrar;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.format.number.NumberFormatAnnotationFormatterFactory;
import org.springframework.util.Assert;

/*
 * 这个Registrar替DefaultFormattingConversionService中默认注册的2个foramt:
 * 1.NumberFormatAnnotationFormatterFactory
 * 2.DateFormatterRegistrar.
 * 增加了自己扩展定义的DateTimeFormatAnnotationFormatterFactory,以支持注解DateTimeFormat强行使用locale
 */
public class DefaultFormattersRegistrar implements FormatterRegistrar  {
	
	private DateFormatter dateFormatter;

	/**
	 * Set the date formatter to register. If not specified no formatter is registered.
	 * This method can be used if global formatter configuration is required.
	 * @param dateFormatter the date formatter
	 */
	public void setDateFormatter(DateFormatter dateFormatter) {
		Assert.notNull(dateFormatter, "DateFormatter must not be null");
		this.dateFormatter = dateFormatter;
	}
	
	@Override
    public void registerFormatters(FormatterRegistry registry) {
		registry.addFormatterForFieldAnnotation(new NumberFormatAnnotationFormatterFactory());
		org.springframework.format.datetime.DateFormatterRegistrar.addDateConverters(registry);
		if(this.dateFormatter != null) {
			registry.addFormatter(this.dateFormatter);
			registry.addFormatterForFieldType(Calendar.class, this.dateFormatter);
		}
		registry.addFormatterForFieldAnnotation(new org.springframework.format.datetime.DateTimeFormatAnnotationFormatterFactory());
		registry.addFormatterForFieldAnnotation(new DateTimeFormatAnnotationFormatterFactory());
    }

	
}