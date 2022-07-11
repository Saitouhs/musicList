package com.zrl.act;

import com.zrl.dao.Dao;
import com.zrl.entity.User;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

//@WebServlet(urlPatterns = "/useract")

public class UserAct extends HttpServlet {
		Logger log = Logger.getLogger(UserAct.class);


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		String opr = req.getParameter("opr");
		if (opr == null) opr = "";
		switch (opr) {
			case "insert": {
				insert(req, resp);
			}
			break;
			case "update": {
				update(req, resp);
			}
			break;
			case "delete": {
				delete(req, resp);
			}
			break;
			case "login": {
				login(req, resp);
			}
			break;
			case "check": {
				check(req, resp);
			}
			break;
			default:
				select(req,resp);
				break;

		}

	}

	private void insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		User usr=new User();
		org.apache.jasper.runtime.JspRuntimeLibrary.introspect(usr,req);
		if (Dao.getDao().isExit("select * from user_info where u_name = ?", new Object[]{usr.getU_name()})) {

			req.setAttribute("zrlerror", "user exits");

			req.getRequestDispatcher("userRes.jsp").forward(req, resp);

		} else {

			String sql = "insert into user_info (u_name,u_pass) values(?,?)";

			Dao.getDao().insertUpdate(sql, new Object[]{usr.getU_name(), usr.getU_pass()});
			resp.sendRedirect("user.jsp");
		}
	}

	private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		User usr=new User();
		org.apache.jasper.runtime.JspRuntimeLibrary.introspect(usr,req);
		String u_name = usr.getU_name();
		String u_pass = usr.getU_pass();
		String u_id = String.valueOf(usr.getU_id());
		if (Dao.getDao().isExit("select * from user_info where u_name = ?", new Object[]{u_name})) {
			req.setAttribute("zrlerror", "user exits");
			req.getRequestDispatcher("userRes.jsp").forward(req, resp);
		} else {


			String sql = "update user_info set u_name=?,u_pass = ? where u_id = ?;";

			Dao.getDao().insertUpdate(sql, new Object[]{u_name, u_pass, u_id});
			resp.sendRedirect("user.jsp");
		}
	}

	private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		log.debug(this);
		log.debug(Thread.currentThread().getName());

		User usr=new User();
		org.apache.jasper.runtime.JspRuntimeLibrary.introspect(usr,req);
		if (!Dao.getDao().isExit("select * from `user_info` where `u_name` = ? and `u_pass` = ?", new Object[]{usr.getU_name(), usr.getU_pass()})) {

			req.setAttribute("zrlerror", "用户名或密码错误");

			req.getRequestDispatcher("userLogin.jsp").forward(req, resp);

		} else {

			resp.sendRedirect("list.jsp");
		}
	}

	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		User usr=new User();
		org.apache.jasper.runtime.JspRuntimeLibrary.introspect(usr,req);
		if (Dao.getDao().insertUpdate("delete from user_info where u_id = ?", new Object[]{usr.getU_id()})) {
			resp.sendRedirect("useract");
		}
	}

	private void check(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User usr=new User();
		org.apache.jasper.runtime.JspRuntimeLibrary.introspect(usr,req);
		if (Dao.getDao().isExit("select * from user_info where u_name=?", new Object[]{usr.getU_name()}))

			resp.getWriter().println("exist");

		else resp.getWriter().println("none");
	}
	private void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String u_name =  req.getParameter("u_name");
		if (u_name==null)
			u_name="";
		String sql="select * from user_info where u_name like \'%"+u_name+"%\'";
		ArrayList<User> lst = Dao.getDao().getUser(sql);
		System.out.println(lst);
		log.debug(lst);
		req.getSession().setAttribute("tes",lst);
		resp.sendRedirect("user.jsp");

	}
}
