package com.zrl.entity;

public class User {
	private int u_id;
	private String u_name;
	private String u_intruduce;
	private String u_gender;
	private String u_brith;
	private String u_country;
	private String u_blob;
	private String u_pass;

	public String getU_pass() {
		return u_pass;
	}

	public void setU_pass(String u_pass) {
		this.u_pass = u_pass;
	}

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_intruduce() {
		return u_intruduce;
	}

	public void setU_intruduce(String u_intruduce) {
		this.u_intruduce = u_intruduce;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	public String getU_brith() {
		return u_brith;
	}

	public void setU_brith(String u_brith) {
		this.u_brith = u_brith;
	}

	public String getU_country() {
		return u_country;
	}

	public void setU_country(String u_country) {
		this.u_country = u_country;
	}

	public String getU_blob() {
		return u_blob;
	}

	public void setU_blob(String u_blob) {
		this.u_blob = u_blob;
	}

	@Override
	public String toString() {
		return "{\"u_id\":\""+this.u_id+"\",\"u_name\":\""+this.u_name+"\"}";
	}
}
