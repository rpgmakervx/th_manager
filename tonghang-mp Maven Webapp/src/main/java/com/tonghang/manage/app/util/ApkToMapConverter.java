package com.tonghang.manage.app.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.tonghang.manage.app.pojo.Apk;
import com.tonghang.manage.common.util.TimeUtil;
@Component("apkToConverter")
public class ApkToMapConverter {

	public Map<String,Object> apkConverter(Apk apk){
		Map<String,Object> msg = new HashMap<String, Object>();
		Map<String,Object> apkmsg = new HashMap<String, Object>();
		msg.put("app_code", apk.getApp_code()==null?"暂无内容":apk.getApp_code());
		msg.put("app_version", apk.getApp_version()==null?"暂无内容":apk.getApp_version());
		msg.put("context", apk.getContext()==null?"暂无内容":apk.getContext());
		msg.put("upload_at", apk.getUpload_at()==null?"暂无内容":TimeUtil.getFormatDateString(apk.getUpload_at()));
		apkmsg.put("apk", msg);
		return apkmsg;
	}
	
	public Map<String,Object> apksConverter(List<Apk> apks){
		List<Map<String,Object>> apksmsg = new ArrayList<Map<String,Object>>();
		Map<String,Object> result = new HashMap<String, Object>();
		for(Apk apk:apks){
			Map<String,Object> apkmsg = new HashMap<String, Object>();
			apkmsg.put("app_code", apk.getApp_code()==null?"暂无内容":apk.getApp_code());
			apkmsg.put("app_version", apk.getApp_version()==null?"暂无内容":apk.getApp_version());
			apkmsg.put("context", apk.getContext()==null?"暂无内容":apk.getContext());
			apkmsg.put("upload_at", apk.getUpload_at()==null?"暂无内容":TimeUtil.getFormatDateString(apk.getUpload_at()));
			apksmsg.add(apkmsg);
		}
		result.put("apks", apksmsg);
		return result;
	}
}
