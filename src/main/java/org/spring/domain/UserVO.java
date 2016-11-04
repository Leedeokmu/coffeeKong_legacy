package org.spring.domain;

import java.util.Date;

public class UserVO {
	private String u_email;
	private String u_fname;
	private String u_lname;
	private String u_pwd;
	private int u_point;
	private String sess_id;
	private Date sess_limit;

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_fname() {
		return u_fname;
	}

	public void setU_fname(String u_fname) {
		this.u_fname = u_fname;
	}

	public String getU_lname() {
		return u_lname;
	}

	public void setU_lname(String u_lname) {
		this.u_lname = u_lname;
	}

	public String getU_pwd() {
		return u_pwd;
	}

	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}

	public int getU_point() {
		return u_point;
	}

	public void setU_point(int u_point) {
		this.u_point = u_point;
	}

	public String getSess_id() {
		return sess_id;
	}

	public void setSess_id(String sess_id) {
		this.sess_id = sess_id;
	}

	public Date getSess_limit() {
		return sess_limit;
	}

	public void setSess_limit(Date sess_limit) {
		this.sess_limit = sess_limit;
	}

}
