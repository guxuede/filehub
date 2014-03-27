package com.guxuede.gdxFramework.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.stereotype.Component;

/**
 * @author {guxuede}
 */
//@Component("restLoginUrlAuthenticationEntryPoint")
public class RestLoginUrlAuthenticationEntryPoint extends LoginUrlAuthenticationEntryPoint {

	public RestLoginUrlAuthenticationEntryPoint() {
		this("/login.jsp");
	}
	
	public RestLoginUrlAuthenticationEntryPoint(String loginFormUrl) {
		super(loginFormUrl);
	}

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response,AuthenticationException exception) throws IOException, ServletException {
		System.err.println("RestHttp403ForbiddenEntryPoint:"+exception.getMessage());
		if(RequestUtil.isRestJsonRequest(request)){
			response.getOutputStream().print("{status:\"false\",message:\"access denied,"+exception.getMessage()+"\"}");
		}else{
			super.commence(request, response, exception);
		}
	}

}
