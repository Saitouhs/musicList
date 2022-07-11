package com.zrl.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebFilter(urlPatterns = "/*")

public class zrlfilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		System.out.println(request.getRequestURL());
		System.out.println(request.getRequestURI());

		String sURI=request.getRequestURI();
		boolean go=sURI.endsWith(".js")||sURI.endsWith(".css")||sURI.endsWith(".png")||sURI.endsWith("useract")||sURI.endsWith("userLogin.jsp");
		if(!go){
			response.sendRedirect("userLogin.jsp");
			return;
		}

		filterChain.doFilter(servletRequest,servletResponse);
	}

	@Override
	public void destroy() {

	}
}
