package com.zrl.entity;

import javax.servlet.ServletRequest;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Map;

public class userUtil {
	public static Map<String,String> getRequestData(ServletRequest request)	{
		Map<String ,String> m=new Hashtable<String,String>();
		Enumeration<String> e = request.getParameterNames();

		while(e.hasMoreElements()) {
			String name = (String)e.nextElement();
			String value = request.getParameter(name);
			m.put(name,value);
		}
		return m;
	}
}
