package com.guxuede.gdxFramework.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

//@Component("restAuthenticationSuccessHandler")
public class RestAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    public RestAuthenticationSuccessHandler() {
    }

    public RestAuthenticationSuccessHandler(String defaultTargetUrl) {
        setDefaultTargetUrl(defaultTargetUrl);
    }
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		System.err.println("onAuthenticationSuccess");
		if(RequestUtil.isRestJsonRequest(request)){
			response.getOutputStream().print("{status:\"true\",message:\"login success\"}");
		}else{
			super.onAuthenticationSuccess(request, response, authentication);
		}
	}

}
