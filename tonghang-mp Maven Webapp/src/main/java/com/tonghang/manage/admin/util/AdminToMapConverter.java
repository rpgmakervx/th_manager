package com.tonghang.manage.admin.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tonghang.manage.admin.pojo.Admin;

public class AdminToMapConverter {

	/**
	 * 将一个admin对象转换为一个Map，属性值和键一一对应
	 * 其中city部分通过 - 分隔符分开，分别存入map中
	 * @param admin
	 * @return
	 */
	public static Map<String,Object> adminConvert(Admin admin){
		Map<String,Object> result = new HashMap<String, Object>();
		Map<String,Object> msg = new HashMap<String, Object>();
		if(admin.getCity()!=null&&"".equals(admin.getCity())){
			msg.put("city",admin.getProvince()+"-"+admin.getCity());
		}else{
			msg.put("city", admin.getProvince());
		}
		msg.put("admin_id", admin.getAdmin_id());
		msg.put("email", admin.getEmail());
		msg.put("id_card", admin.getId_card());
		msg.put("name", admin.getName());
		msg.put("phone", admin.getPhone());
		msg.put("power", admin.getPower());
		result.put("admin", msg);
		return result;
	}
	/**
	 * 将一个admin列表转换成一个Map,Map中包含多个admin相应的信息，属性值和键一一对应
	 * 其中city部分通过 - 分隔符分开，分别存入map中
	 * @param admins
	 * @return
	 */
	public static Map<String,Object> adminsConvert(List<Admin> admins){
		Map<String,Object> result = new HashMap<String, Object>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		for(Admin admin:admins){
			Map<String,Object> msg = new HashMap<String, Object>();
			if(admin.getCity()!=null&&!"".equals(admin.getCity())){
				msg.put("city",admin.getProvince()+"-"+admin.getCity());
			}else{
				msg.put("city", admin.getProvince());
			}
			msg.put("admin_id", admin.getAdmin_id());
			msg.put("email", admin.getEmail());
			msg.put("id_card", admin.getId_card());
			msg.put("name", admin.getName());
			msg.put("phone", admin.getPhone());
			msg.put("power", admin.getPower());
			list.add(msg);
		}
		result.put("admins", list);
		return result;
	}
}
