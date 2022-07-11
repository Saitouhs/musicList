package com.zrl.act;

import com.zrl.dao.Dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/musiclistact")

public class MusicListAct extends HttpServlet {

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
				insert(request, response);
			}
			break;
			case "checkmusic": {
				checkmusic(request,response);
			}
			break;
			case "checklist": {
				checklist(request,response);
			}
			break;
			case "delete": {
				delete(request, response);
			}

			break;

		}

	}

	private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String l_id = request.getParameter("l_id");
		String m_id = request.getParameter("m_id");

		System.out.println(l_id);
		System.out.println(m_id);
		int l_cnt = Dao.getDao().getMusicListcnt(Integer.parseInt(l_id));
		System.out.println(l_cnt);

		if (Dao.getDao().isExit("select * from list_musics where l_id=? and m_id=? ", new Object[]{l_id, m_id})) {
			request.setAttribute("zrlerror", "歌曲已存在");
			request.getRequestDispatcher("musiclistadd.jsp").forward(request, response);
		} else {
			String sql = "insert into list_musics (l_id,m_id,l_track) values(?,?,?)";

			Dao.getDao().insertUpdate(sql, new Object[]{l_id, m_id, l_cnt + 1});
			response.sendRedirect("list.jsp");

		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String l_id = request.getParameter("l_id");
		String m_id = request.getParameter("m_id");
		System.out.println(l_id);
		System.out.println(m_id);
		Dao.getDao().insertUpdate("delete from list_musics where l_id = ? and m_id = ?", new Object[]{l_id, m_id});
		response.sendRedirect("list.jsp");
	}

	private void checkmusic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().print(Dao.getDao().getAnyMusic("select * from music_info"));
	}
	private void checklist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().print(Dao.getDao().getAnyList("select * from list_info"));
	}
}
