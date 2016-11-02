package org.spring.domain;

import java.util.Date;

public class ReviewVO {
	private int r_id;
	private int p_id;
	private String u_email;
	private String r_grade;
	private String r_content;
	private Date r_date;
	private String r_img1;
	private String r_img2;
	private String r_img3;

	public String getR_grade() {
		return r_grade;
	}

	public void setR_grade(String d) {
		this.r_grade = d;
	}

	public String getR_img1() {
		return r_img1;
	}

	public void setR_img1(String r_img1) {
		this.r_img1 = r_img1;
	}

	public String getR_img2() {
		return r_img2;
	}

	public void setR_img2(String r_img2) {
		this.r_img2 = r_img2;
	}

	public String getR_img3() {
		return r_img3;
	}

	public void setR_img3(String r_img3) {
		this.r_img3 = r_img3;
	}

	public int getR_id() {
		return r_id;
	}

	public void setR_id(int r_id) {
		this.r_id = r_id;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

}
