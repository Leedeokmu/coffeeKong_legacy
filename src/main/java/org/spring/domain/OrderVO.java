package org.spring.domain;

import java.util.Date;

public class OrderVO {
	private int o_id;
	private String u_email;
	private int p_id;
	private int o_qty;
	private String o_sz;
	private String o_type;
	private Double o_price;
	private String o_rfname;
	private String o_rlname;
	private String o_phone;
	private String o_postcode;
	private String o_addr;
	private String o_state;
	private Date o_date;
	private OrderProdVO[] opvo;

	public Double getO_price() {
		return o_price;
	}

	public void setO_price(Double o_price) {
		this.o_price = o_price;
	}

	public String getO_rfname() {
		return o_rfname;
	}

	public void setO_rfname(String o_rfname) {
		this.o_rfname = o_rfname;
	}

	public String getO_rlname() {
		return o_rlname;
	}

	public void setO_rlname(String o_rlname) {
		this.o_rlname = o_rlname;
	}

	public String getO_phone() {
		return o_phone;
	}

	public void setO_phone(String o_phone) {
		this.o_phone = o_phone;
	}

	public String getO_addr() {
		return o_addr;
	}

	public void setO_addr(String o_addr) {
		this.o_addr = o_addr;
	}

	public int getO_id() {
		return o_id;
	}

	public void setO_id(int o_id) {
		this.o_id = o_id;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public int getO_qty() {
		return o_qty;
	}

	public void setO_qty(int o_qty) {
		this.o_qty = o_qty;
	}

	public String getO_sz() {
		return o_sz;
	}

	public void setO_sz(String o_sz) {
		this.o_sz = o_sz;
	}

	public String getO_type() {
		return o_type;
	}

	public void setO_type(String o_type) {
		this.o_type = o_type;
	}

	public String getO_state() {
		return o_state;
	}

	public void setO_state(String o_state) {
		this.o_state = o_state;
	}

	public Date getO_date() {
		return o_date;
	}

	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}

	public String getO_postcode() {
		return o_postcode;
	}

	public void setO_postcode(String o_postcode) {
		this.o_postcode = o_postcode;
	}
	public OrderProdVO[] getOpvo() {
		return opvo;
	}

	public void setOpvo(OrderProdVO[] opvo) {
		this.opvo = opvo;
	}

}
