package com.tonghang.manage.app.pojo;

import java.util.Date;


public class Apk {
	public String app_code;
	
	public String app_version;
	
	public Date upload_at;

	public String getApp_code() {
		return app_code;
	}

	public void setApp_code(String app_code) {
		this.app_code = app_code;
	}

	public String getApp_version() {
		return app_version;
	}

	public void setApp_version(String app_version) {
		this.app_version = app_version;
	}

	public Date getUpload_at() {
		return upload_at;
	}

	public void setUpload_at(Date upload_at) {
		this.upload_at = upload_at;
	}
	
}
