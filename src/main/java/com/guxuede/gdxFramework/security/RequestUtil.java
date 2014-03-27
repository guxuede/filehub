package com.guxuede.gdxFramework.security;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;


public abstract class RequestUtil {

	public static boolean isRestJsonRequest(HttpServletRequest request){
		return StringUtils.endsWithIgnoreCase(request.getRequestURI(), ".json");
	}
}
