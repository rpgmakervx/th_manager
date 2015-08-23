package com.tonghang.manage.admin.pojo;

import java.util.Date;

import com.tonghang.manage.common.util.TimeUtil;

public class Admin {

	private String admin_id;
	private String id_card;
	private String name;
	private String password;
	private String province;
	private String city;
	private String email;
	private String phone;
	private int power;
	private Date created_at;
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getId_card() {
		return id_card;
	}
	public void setId_card(String id_card) {
		this.id_card = id_card;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getFormatDate(){
		if(created_at==null)
			created_at = new Date();
		return TimeUtil.getFormatString(created_at);
	}
	@Override
	public String toString() {
		return "Admin [admin_id=" + admin_id + ", id_card=" + id_card
				+ ", name=" + name + ", password=" + password + ", city="
				+ city + ", email=" + email + ", phone=" + phone + ", power="
				+ power + ", created_at=" + created_at + "]";
	}
	
	
}
