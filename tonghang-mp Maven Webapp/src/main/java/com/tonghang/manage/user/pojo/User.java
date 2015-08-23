package com.tonghang.manage.user.pojo;

import java.util.Date;
import java.util.Set;

/**
 * 
 * @author Administrator 用户信息包括：id 账号(number) 用户名(id) 密码(password) email
 *         电话号(phone) 性别(sex) 生日(birth) 状态(正常或封号) 是否在线(isonline) 所在省份(city),地市级(ext1,ext2)
 *         头像(image) 创建时间(created_time) 最近登录时间(last_login_time)关联属性(labellist:用户包含的标签，topic:用户加入的话题)
 * 			关联属性均由多的地方管理，所以user_topics关系由Topic类管理
 */

public class User {
	
	private String client_id;
	private String username;
	private String email;
	private String password;
	private String phone;
	private String sex;
	private String birth;
	public String status;
	private String isonline;
	private String city;
	private String province;
	private String ext2;
	private Date created_at = new Date();
	private Date last_login_at;
	
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getIsonline() {
		return isonline;
	}
	public void setIsonline(String isonline) {
		this.isonline = isonline;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getExt2() {
		return ext2;
	}
	public void setExt2(String ext2) {
		this.ext2 = ext2;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getLast_login_at() {
		return last_login_at;
	}
	public void setLast_login_at(Date last_login_at) {
		this.last_login_at = last_login_at;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (client_id == null) {
			if (other.client_id != null)
				return false;
		} else if (!client_id.equals(other.client_id))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "User [client_id=" + client_id + ", username=" + username
				+ ", email=" + email + ", password=" + password + ", phone="
				+ phone + ", sex=" + sex + ", birth=" + birth + ", status="
				+ status + ", isonline=" + isonline + ", city=" + city
				+ ", province=" + province + ", ext2=" + ext2 + ", created_at="
				+ created_at + ", last_login_at=" + last_login_at + "]";
	}
	
	
}
