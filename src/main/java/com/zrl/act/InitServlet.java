package com.zrl.act;

import org.apache.log4j.PropertyConfigurator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

//只执行一次
//@WebServlet(urlPatterns = "/s")
public class InitServlet extends HttpServlet {

	@Override
	public void init() throws ServletException {
		String sFile = getServletContext().getRealPath("/") + "/WEB-INF/classes/log4j.properties";
		try {
			PropertyConfigurator.configure(sFile);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
