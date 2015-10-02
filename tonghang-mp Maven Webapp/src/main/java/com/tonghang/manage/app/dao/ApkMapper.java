package com.tonghang.manage.app.dao;

import java.util.List;

import com.tonghang.manage.app.pojo.Apk;

public interface ApkMapper {

	//apk包上传
	public void save(Apk apk);
	
	//获取所有apk上传记录及其信息
	public List<Apk> findAllApk();
	
	
}
