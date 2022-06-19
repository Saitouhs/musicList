package com.zrl.entity;

public class Music {
	private int id;
	private String s_name;
	private String m_name;
	private String a_name;
	private String a_img;
	private String m_time;
	private String m_style;

	public Music() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getA_img() {
		return a_img;
	}

	public void setA_img(String a_img) {
		this.a_img = a_img;
	}

	public String getM_time() {
		return m_time;
	}

	public void setM_time(String m_time) {
		this.m_time = m_time;
	}

	public String getM_style() {
		return m_style;
	}

	public void setM_style(String m_style) {
		this.m_style = m_style;
	}

	@Override
	public String toString() {
		return  "<tr>"+
				"<td>"+m_name+"</td>"+
				"<td>"+s_name+"</td>"+
				"<td>"+a_name+"</td>"+
				"<td>"+m_time+"</td>"+
				"<td>"+m_style+"</td>" ;
	}
}
