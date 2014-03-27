package com.guxuede.gdxFramework.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

//@Component("restAuthenticationFailureHandler")
public class RestAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler{

    public RestAuthenticationFailureHandler() {
    }

    public RestAuthenticationFailureHandler(String defaultFailureUrl) {
        setDefaultFailureUrl(defaultFailureUrl);
    }
	
	/**
	 * @param exception 
	 * 	org.springframework.security.authentication.BadCredentialsException
	 * 	org.springframework.security.authentication.CredentialsExpiredException
	 *  org.springframework.security.authentication.LockedException
	 *  org.springframework.security.authentication.DisabledException
	 */
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)throws IOException, ServletException {
		if(RequestUtil.isRestJsonRequest(request)){
			response.getOutputStream().print("{status:\"false\",message:\"login success,"+exception.getMessage()+"\"}");
		}else{
			super.onAuthenticationFailure(request, response, exception);
		}
	}
}
