package com.zrl.entity;

public class Lists {
	private String m_name;
	private String s_name;
	private String l_name;
	private String m_time;
	private String a_name;

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public String getM_time() {
		return m_time;
	}

	public void setM_time(String m_time) {
		this.m_time = m_time;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	@Override
	public String toString() {
		return "<tr>"+
				"<td>"+l_name+"</td>"+
				"<td>"+s_name+"</td>"+
				"<td>"+a_name+"</td>"+
				"<td>"+m_time+"</td>"+
				"</tr>";
	}
}
