package com.guxuede.gdxFramework.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;
import org.springframework.stereotype.Component;

/**
 *  此hanlder被执行的条件是, AccessDecisionManager 抛出 AccessDeniedException异常时.
 *  RestHttp403ForbiddenEntryPoint 的垄断性质,导致此hanlder永远不会被执行,详见为什么
 * @author {guxuede}
 *
 */
@Component("restAccessDeniedHandler")
public class RestAccessDeniedHandlerImpl extends AccessDeniedHandlerImpl{

	@Override
	public void handle(HttpServletRequest request,HttpServletResponse response,AccessDeniedException exception) throws IOException, ServletException {
		System.err.println("AccessDeniedHandler:"+exception.getMessage());
		if(RequestUtil.isRestJsonRequest(request)){
			response.getOutputStream().print("{status:\"false\",message:\"access denied,"+exception.getMessage()+"\"}");
		}else{
			response.sendRedirect("/accessDenied.jsp");
		}
	}

	
}
