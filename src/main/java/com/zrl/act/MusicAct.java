package com.zrl.act;

import com.zrl.dao.Dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

@WebServlet(urlPatterns = "/musicact")

public class MusicAct extends HttpServlet {

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
				String m_name = request.getParameter("m_name");
				String s_name = request.getParameter("s_name");
				String a_name = request.getParameter("a_name");
				String m_style = request.getParameter("m_style");

				if (Dao.getDao().isExit("select * from music_info where m_name=? and s_name=? and a_name=?", new Object[]{m_name, s_name, a_name})) {
					response.getWriter().println("歌曲内容已存在！");
				} else {

					String sql = "insert into music_info (m_name,s_name,a_name,m_style) values(?,?,?,?)";

					Dao.getDao().insertUpdate(sql, new Object[]{m_name, s_name, a_name, m_style});
					response.sendRedirect("music.jsp");
				}
			}
			break;
			case "update": {

				String m_name = request.getParameter("m_name");
				String s_name = request.getParameter("s_name");
				String a_name = request.getParameter("a_name");
				String m_style = request.getParameter("m_style");
				String m_id = request.getParameter("m_id");


				String sql = "update music_info set m_name=?,s_name = ?,a_name=?,m_style = ? where m_id = ?;";

				Dao.getDao().insertUpdate(sql, new Object[]{m_name, s_name, a_name, m_style, m_id});
				response.sendRedirect("music.jsp");
			}
			break;
			case "delete": {
				String m_id = request.getParameter("m_id");
				Dao.getDao().insertUpdate("delete from music_info where m_id = ?", new Object[]{m_id});
				Dao.getDao().insertUpdate("delete from list_musics where m_id = ?", new Object[]{m_id});
				System.out.println(m_id);
				response.sendRedirect("music.jsp");
			}
			break;


		}

	}
}
