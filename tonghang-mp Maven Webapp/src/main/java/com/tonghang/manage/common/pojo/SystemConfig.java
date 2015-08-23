package com.tonghang.manage.common.pojo;

public class SystemConfig {

	private int id;
	private int can_register_user;
	private int can_login;
	private int can_upgrade_silently;

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
	
}
