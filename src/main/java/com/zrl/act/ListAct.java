package com.zrl.act;

import com.zrl.dao.Dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

@WebServlet(urlPatterns = "/listact")

public class ListAct extends HttpServlet {



	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String opr = request.getParameter("opr");
		if (opr == null) opr = "";
		switch (opr) {
			case "insert": {
				String l_name = request.getParameter("l_name");
				String l_date = request.getParameter("l_date");
				String u_name = request.getParameter("u_name");
				System.out.println(u_name);

				if (Dao.getDao().isExit("select * from list_info where l_name = ?", new Object[]{l_name})) {

					request.setAttribute("error","歌单名重复");

					request.getRequestDispatcher("listadd.jsp").forward(request,response);

				} else {

					String sql = "insert into list_info (l_name,l_date,u_name) values(?,?,?)";

					Dao.getDao().insertUpdate(sql, new Object[]{l_name, l_date,u_name});
					response.sendRedirect("musiclistadd.jsp");
				}
			}
			break;
			case "update": {
				String u_name = request.getParameter("u_name");
				String u_pass = request.getParameter("u_pass");
				String u_id = request.getParameter("u_id");
				if (Dao.getDao().isExit("select * from user_info where u_name = ?", new Object[]{u_name})) {

					request.setAttribute("zrlerror", "user exits");

					request.getRequestDispatcher("listmodify.jsp").forward(request, response);

				} else {


					String sql = "update user_info set u_name=?,u_pass = ? where u_id = ?;";

					Dao.getDao().insertUpdate(sql, new Object[]{u_name, u_pass, u_id});
					response.sendRedirect("user.jsp");
				}
			}
			break;
			case "delete": {
				String l_id = request.getParameter("l_id");
				Dao.getDao().insertUpdate("delete from list_info where l_id = ?",new Object[]{l_id});
				Dao.getDao().insertUpdate("delete from list_musics where l_id = ?",new Object[]{l_id});
				System.out.println(l_id);
				response.sendRedirect("list.jsp");
			}
			break;
		}

	}
}
