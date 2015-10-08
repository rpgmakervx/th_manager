package com.tonghang.manage.common.pojo;

public class SystemConfig {

	private int id;
	private int can_register_user;
	private int can_login;
	private int can_upgrade_silently;
	private int can_upgrade;
	private int third_adv;
	private int use_adv;
	private String app_code;
	private String self_adv_url;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCan_login() {
		return can_login;
	}

	public void setCan_login(int can_login) {
		this.can_login = can_login;
	}

	public int getCan_register_user() {
		return can_register_user;
	}

	public void setCan_register_user(int can_register_user) {
		this.can_register_user = can_register_user;
	}

	public int getCan_upgrade_silently() {
		return can_upgrade_silently;
	}

	public void setCan_upgrade_silently(int can_upgrade_silently) {
		this.can_upgrade_silently = can_upgrade_silently;
	}

	@Override
	public String toString() {
		return "SystemConfig [id=" + id + ", can_register_user="
				+ can_register_user + ", can_login=" + can_login
				+ ", can_upgrade_silently=" + can_upgrade_silently + "]";
	}

	public int getThird_adv() {
		return third_adv;
	}

	public void setThird_adv(int third_adv) {
		this.third_adv = third_adv;
	}

	public String getSelf_adv_url() {
		return self_adv_url;
	}

	public void setSelf_adv_url(String self_adv_url) {
		this.self_adv_url = self_adv_url;
	}

	public int getUse_adv() {
		return use_adv;
	}

	public void setUse_adv(int use_adv) {
		this.use_adv = use_adv;
	}

	public String getApp_code() {
		return app_code;
	}

	public void setApp_code(String app_code) {
		this.app_code = app_code;
	}

	public int getCan_upgrade() {
		return can_upgrade;
	}

	public void setCan_upgrade(int can_upgrade) {
		this.can_upgrade = can_upgrade;
	}
	
}
