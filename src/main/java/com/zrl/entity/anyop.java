package com.zrl.entity;

public class anyop {
	private int id;
	private String name;

	@Override
	public String toString() {
		return "{\"id\":\""+this.id+"\",\"name\":\""+this.name+"\"}";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
