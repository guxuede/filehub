package com.guxuede.gdxFramework.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;
import org.springframework.security.web.authentication.session.SessionAuthenticationStrategy;
import org.springframework.stereotype.Component;

/**
 * @author {guxuede}
 *
 */
@Component("restSessionAuthenticationStrategy")
public class RestSessionAuthenticationStrategy implements SessionAuthenticationStrategy{

	@Override
	public void onAuthentication(Authentication arg0, HttpServletRequest arg1,HttpServletResponse arg2) throws SessionAuthenticationException {
		//System.err.println("onAuthentication:"+arg0);
		//此处可以附加登录要求
	}

}
