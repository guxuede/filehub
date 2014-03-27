package com.guxuede.gdxFramework.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

@Component("restLogoutSuccessHandler")
public class RestLogoutSuccessHandler implements LogoutSuccessHandler{

	@Override
	public void onLogoutSuccess(HttpServletRequest request,HttpServletResponse response, Authentication authentication) throws IOException,ServletException {
		if(RequestUtil.isRestJsonRequest(request)){
			response.getOutputStream().print("{status:\"true\",message:\"logout success\"}");
		}else{
			response.sendRedirect("/login.jsp");
		}
		
	}

}
