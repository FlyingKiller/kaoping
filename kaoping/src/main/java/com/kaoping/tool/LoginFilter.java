package com.kaoping.tool;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.*;

import org.apache.struts2.interceptor.SessionAware;

public class LoginFilter implements Filter, SessionAware {

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession();
		Object o = session.getAttribute("currentUser");
		String str = (String) session.getAttribute("currentType");
		String path = servletRequest.getRequestURI();
		// System.out.println(str + "333333333333333333333333333333");
		if (path.indexOf("login.jsp") == -1 && o == null) {
			if (path.indexOf("teaFirstLogin.jsp") == -1) {
				servletResponse.sendRedirect("/kaoping/login.jsp");
				chain.doFilter(servletRequest, servletResponse);
			} else {
				chain.doFilter(servletRequest, servletResponse);
			}
			return;
		} else {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {

	}

	private Map session;

	public void setSession(Map session) {
		this.session = session;
	}

}
