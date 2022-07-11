package com.zrl.dao;


import com.zrl.entity.*;
import org.apache.log4j.Logger;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


public class Dao {
	Logger log=Logger.getLogger(Dao.class);
	private Dao(){}

	private static Dao dao = new Dao();
	public static Dao getDao(){return dao;}

	public  Connection getConn() {
		Connection con = null;
		try {
			InitialContext context=new InitialContext();
			DataSource  ds = (DataSource)context.lookup("java:comp/env/jdbc/cldmysql");
			con = ds.getConnection();
			log.debug(ds);
			log.debug(con);
			/*Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cldmusic?serverTimezone=UTC", "root", "Aa114514@");
			//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cldmusic?serverTimezone=UTC", "root", "114514");*/
		} catch (Exception e) {
			System.err.println(e.getMessage());
			log.error(e.getMessage());
		}
		return con;
	}

	public  boolean isExit(String sql) {
		try (Connection con = getConn()) {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			return rs.next();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return false;
		}
	}

	public  boolean isExit(String sql, Object params[]) {
		try (Connection con = getConn()) {
			PreparedStatement pst = con.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				pst.setObject(i + 1, params[i]);
			}
			ResultSet rs = pst.executeQuery();
			return rs.next();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return false;
		}
	}


	public  boolean insertUpdate(String sql) {
		int cnt = 0;
		try (Connection con = getConn()) {
			Statement st = con.createStatement();
			cnt = st.executeUpdate(sql);
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return false;
		}
		return cnt > 0;
	}

	public  boolean insertUpdate(String sql, Object params[]) {
		int cnt = 0;
		try (Connection con = getConn()) {
			PreparedStatement pst = con.prepareStatement(sql);
			for (int i = 0; i < params.length; i++)
				pst.setObject(i + 1, params[i]);
			cnt = pst.executeUpdate();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return false;
		}
		return cnt > 0;
	}


	public  List_info[] getListinfo(String lis) {
		List_info[] lst = null;
		try (Connection con = getConn()) {
			Statement st = con.createStatement();//查询
			ResultSet rs = st.executeQuery("select count(*) from `list_info` where `l_name` like \'%"+lis+"%\'");//结果
			int cnt = 0;//统计
			if (rs.next()) {
				cnt = rs.getInt(1);
			}//统计表内行数
			if (cnt == 0)
				return null;
			lst = new List_info[cnt];//建立数组存储数据

			rs = st.executeQuery("select * from `list_info` where `l_name` like \'%"+lis+"%\' order by l_id ");
			int i = 0;
			while (rs.next()) {
				List_info list = new List_info();
				list.setList_date(String.valueOf(rs.getDate("l_date")));
				list.setList_name(rs.getString("l_name"));
				list.setL_id(rs.getInt("l_id"));
				list.setUser_name(rs.getString("u_name"));


				lst[i++] = list;//更新数据，后i+1
			}

		} catch (Exception e) {
			System.err.println();
		}
		return lst;

	}public  List_info[] getListbyid(String lid) {
		List_info[] lst = null;
		try (Connection con = getConn()) {
			Statement st = con.createStatement();//查询
			ResultSet rs = st.executeQuery("select count(*) from `list_info` where `l_id` = "+lid);//结果
			int cnt = 0;//统计
			if (rs.next()) {
				cnt = rs.getInt(1);
			}//统计表内行数
			if (cnt == 0)
				return null;
			lst = new List_info[cnt];//建立数组存储数据

			rs = st.executeQuery("select * from `list_info` where `l_id` ="+lid);
			int i = 0;
			while (rs.next()) {
				List_info list = new List_info();
				list.setList_date(String.valueOf(rs.getDate("l_date")));
				list.setList_name(rs.getString("l_name"));
				list.setL_id(rs.getInt("l_id"));
				list.setUser_name(rs.getString("u_name"));


				lst[i++] = list;//更新数据，后i+1
			}

		} catch (Exception e) {
			System.err.println();
		}
		return lst;

	}

	public  int getListCnt() {
		int cnt = 0;//统计
		try (Connection con = getConn()) {
			Statement st = con.createStatement();//查询
			ResultSet rs = st.executeQuery("select count(*) from `list_info`");//结果

			if (rs.next()) {
				cnt = rs.getInt(1);
			}//统计表内行数
			if (cnt == 0)
				return 0;
		} catch (Exception e) {
			System.err.println();
		}
		return cnt;
	}

	public  int getMusicCnt() {
		int cnt = 0;//统计
		try (Connection con = getConn()) {
			Statement st = con.createStatement();//查询
			ResultSet rs = st.executeQuery("select count(*) from `music_info`");//结果

			if (rs.next()) {
				cnt = rs.getInt(1);
			}//统计表内行数
			if (cnt == 0)
				return 0;
		} catch (Exception e) {
			System.err.println();
		}
		return cnt;
	}

	public  int[]getMusicListNum() {
		int num [] = null;
		try (Connection con = getConn()) {
			Statement st = con.createStatement();//查询
			ResultSet rs = st.executeQuery("select count(*) from `list_info` ");
			int cnt = 0;//统计 list cnt
			if (rs.next()) {
				cnt = rs.getInt(1);//list cnt
			}//统计表内行数
			if (cnt == 0)
				return null;
			num = new int[cnt];//list
			//3
			rs = st.executeQuery("select `l_id` from `list_info`");

			int i = 0;
			while (rs.next()) {
				num[i++] = rs.getInt("l_id");//更新数据，后i+1

			}

		} catch (Exception e) {
			System.err.println();
		}
		return num;
	}
	public  int getMusicListcnt(int a) {
		int num =0;
		try (Connection con = getConn()) {
			Statement st = con.createStatement();//查询
			ResultSet rs = st.executeQuery("select count(*) from `list_musics` where `l_id`= "+a);
			int cnt = 0;//统计 list cnt
			if (rs.next()) {
				cnt = rs.getInt(1);//list cnt
			}//统计表内行数
			if (cnt == 0)
				return 0;
			num = cnt;
		} catch (Exception e) {
			System.err.println();
		}

		return num;
	}

	public  Lists[] getList(int a) {
		Lists[] lst = null;//
		try (Connection con = getConn()) {
			Statement st = con.createStatement();//查询
			ResultSet rs = st.executeQuery("select count(*) from `list_musics` where `l_id` = " + a);//结果
			int cnt = 0;//统计 list cnt
			if (rs.next()) {
				cnt = rs.getInt(1);//list cnt
			}//统计表内行数
			if (cnt == 0)
				return null;
			lst = new Lists[cnt];//list
			//3
			rs = st.executeQuery("select * from `list_musics` where `l_id` = " + a);

			int i = 0;
			while (rs.next()) {
				Lists lis = new Lists();//select * from `music_info` where `m_id` = 1;
				int m_id = rs.getInt("m_id");
				System.out.println(rs.getInt("l_id"));
				System.out.println("m_id" + m_id);//list number->music numid

				ResultSet rs2 = st.executeQuery("select * from `music_info` where `m_id` =" + m_id);
				while (rs2.next()) {
					lis.setM_name(rs2.getString("m_name"));
					lis.setM_time(rs2.getString("m_time"));
					lis.setS_name(rs2.getString("s_name"));
					lis.setA_name(rs2.getString("a_name"));
				}

				lst[i++] = lis;//更新数据，后i+1

			}

		} catch (Exception e) {
			System.err.println();
		}
		return lst;

	}

	public  Music[] getMusic(int l_id) {
		Music[] msc = null;
		try (Connection con = getConn()) {
			Statement st = con.createStatement();//查询
			ResultSet rs = st.executeQuery("select count(*) from music_info left join list_musics lm on music_info.m_id = lm.m_id where l_id =" + l_id + ";");//结果
			int cnt = 0;//统计
			if (rs.next()) {
				cnt = rs.getInt(1);
			}//统计表内行数
			if (cnt == 0)
				return null;
			msc = new Music[cnt];//建立数组存储数据
			System.out.println(cnt);
			rs = st.executeQuery("select * from music_info left join list_musics lm on music_info.m_id = lm.m_id where l_id =" + l_id + ";");
			int i = 0;
			while (rs.next()) {
				Music music = new Music();
				music.setId(rs.getInt("m_id"));
				music.setM_name(rs.getString("m_name"));
				music.setS_name(rs.getString("s_name"));
				music.setA_name(rs.getString("a_name"));
				music.setM_time(rs.getString("m_time"));
				music.setM_style(rs.getString("m_style"));
				msc[i++] = music;//更新数据，后i+1
			}

		} catch (Exception e) {
			System.err.println();
		}
		return msc;
	}

	public  Music[] getMusic() {
		Music[] msc = null;
		try (Connection con = getConn()) {
			Statement st = con.createStatement();//查询
			ResultSet rs = st.executeQuery("select count(*) from music_info ");//结果
			int cnt = 0;//统计
			if (rs.next()) {
				cnt = rs.getInt(1);
			}//统计表内行数
			if (cnt == 0)
				return null;
			msc = new Music[cnt];//建立数组存储数据
			System.out.println(cnt);
			rs = st.executeQuery("select * from music_info");
			int i = 0;
			while (rs.next()) {
				Music music = new Music();


				music.setId(rs.getInt("m_id"));
				music.setM_name(rs.getString("m_name"));
				music.setS_name(rs.getString("s_name"));
				music.setA_name(rs.getString("a_name"));
				music.setM_time(rs.getString("m_time"));
				music.setM_style(rs.getString("m_style"));
				msc[i++] = music;//更新数据，后i+1
			}

		} catch (Exception e) {
			System.err.println();
		}
		return msc;
	}


	public  ArrayList<Map<String, Object>> getAny(String sql) {
		ArrayList<Map<String, Object>> lstData = new ArrayList<Map<String, Object>>();
		try (Connection conn = getConn()) {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ResultSetMetaData md = rs.getMetaData();
				Map<String, Object> m = new HashMap<String, Object>();
				for (int i = 1; i <= md.getColumnCount(); i++) {

					m.put(md.getColumnName(i), rs.getObject(md.getColumnName(i)));
				}
				lstData.add(m);

			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

		return lstData;
	}
	public ArrayList<User> getUser(String sql) {
		ArrayList<User> lstData = new ArrayList<User>();
		try (Connection conn = getConn()) {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ResultSetMetaData md = rs.getMetaData();
				User m = new User();
				for (int i = 1; i <= md.getColumnCount(); i++) {
					m.setU_id(rs.getInt("u_id"));
					m.setU_name(rs.getString("u_name"));
					m.setU_brith(rs.getString("u_birth"));
					m.setU_gender(rs.getString("u_gender"));
					m.setU_pass(rs.getString("u_pass"));
				}
				lstData.add(m);

			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

		return lstData;
	}

	public ArrayList<anyop> getAnyop(String sql) {

		ArrayList<anyop> lstData = new ArrayList<anyop>();
		try (Connection conn = getConn()) {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ResultSetMetaData md = rs.getMetaData();
				anyop m = new anyop();
				for (int i = 1; i <= md.getColumnCount(); i++) {
					m.setName(rs.getString("name"));
					m.setId(rs.getInt("id"));
				}
				lstData.add(m);

			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

		return lstData;
	}public ArrayList<Music> getAnyMusic(String sql) {

		ArrayList<Music> lstData = new ArrayList<Music>();
		try (Connection conn = getConn()) {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ResultSetMetaData md = rs.getMetaData();
				Music m = new Music();
				for (int i = 1; i <= md.getColumnCount(); i++) {
					m.setM_name(rs.getString("m_name"));
					m.setId(rs.getInt("m_id"));
				}
				lstData.add(m);

			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

		return lstData;
	}
	public ArrayList<List_info> getAnyList(String sql) {

		ArrayList<List_info> lstData = new ArrayList<List_info>();
		try (Connection conn = getConn()) {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ResultSetMetaData md = rs.getMetaData();
				List_info m = new List_info();
				for (int i = 1; i <= md.getColumnCount(); i++) {
					m.setList_name(rs.getString("l_name"));
					m.setL_id(rs.getInt("l_id"));
				}
				lstData.add(m);

			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return lstData;
	}

}

