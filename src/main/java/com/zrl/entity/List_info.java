package com.zrl.entity;

public class List_info {
	private String list_name;
	private String user_name;
	private String list_date;
	private int l_id;

	public String getList_name() {
		return list_name;
	}

	public void setList_name(String list_name) {
		this.list_name = list_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getList_date() {
		return list_date;
	}

	public void setList_date(String list_date) {
		this.list_date = list_date;
	}

	public int getL_id() {
		return l_id;
	}

	public void setL_id(int l_id) {
		this.l_id = l_id;
	}


	@Override
	public String toString() {
		return "{\"l_id\":\""+this.l_id+"\",\"l_name\":\""+this.list_name+"\"}";
	}
}
