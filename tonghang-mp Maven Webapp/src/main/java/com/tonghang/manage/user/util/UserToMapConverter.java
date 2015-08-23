package com.tonghang.manage.user.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.tonghang.manage.common.util.Constant;
import com.tonghang.manage.common.util.TimeUtil;
import com.tonghang.manage.label.service.LabelService;
import com.tonghang.manage.user.pojo.User;

@Component("userToConverter")
public class UserToMapConverter {

	@Resource(name="labelService")
	private LabelService labelService;
	
	public Map<String,Object> userConverter(User user){
		List<String> labels = labelService.findLabelNameByUser(user.getClient_id());
		Map<String,Object> msg = new HashMap<String, Object>();
		Map<String,Object> usermap = new HashMap<String, Object>();
		String city = "";
		if(user.getProvince()==null||"".equals(user.getProvince()))
			city = "未知";
		else city = user.getCity()==null||"".equals(user.getCity())?user.getProvince():user.getProvince()+"-"+user.getCity();
		msg.put("labels", labels);
		msg.put("email", user.getEmail());
		msg.put("sex", user.getSex()==null||"".equals(user.getSex())?"未知":user.getSex());
		msg.put("username", user.getUsername());
		msg.put("city", city);
		msg.put("phone", user.getPhone()==null||"".equals(user.getPhone())?"未知":user.getPhone());
		msg.put("client_id", user.getClient_id());
		msg.put("birth", user.getBirth()==null||"".equals(user.getBirth())?"未知":user.getBirth());	
		msg.put("image", Constant.IMAGE_PATH+user.getClient_id()+"/"+Constant.IMAGE_NAME);
		msg.put("created_at", TimeUtil.getFormatString(user.getCreated_at()));
		msg.put("last_login_at", TimeUtil.getFormatString(user.getLast_login_at()));
		msg.put("age", user.getBirth()==null||"".equals(user.getBirth())?"未知":TimeUtil.getYear()-TimeUtil.getYear(user.getBirth()));
		msg.put("isonline", user.getIsonline());
		msg.put("status", user.getStatus());
		usermap.put("user", msg);
		return usermap;
	}
	
	public Map<String,Object> usersConverter(List<User> users){
		List<Map<String,Object>> usersmsg = new ArrayList<Map<String,Object>>();
		Map<String,Object> usermap = new HashMap<String, Object>();
		for(User u:users){
			List<String> labe_names = labelService.findLabelNameByUser(u.getClient_id());
			Map<String,Object> msg = new HashMap<String, Object>();
			String city = "";
			if(u.getProvince()==null||"".equals(u.getProvince()))
				city = "未知";
			else {
				city = u.getCity()==null||"".equals(u.getCity())?u.getProvince():u.getProvince()+"-"+u.getCity();
			}
			msg.put("labels", labe_names);
			msg.put("email", u.getEmail());
			msg.put("username", u.getUsername());
			msg.put("sex", u.getSex()==null||"".equals(u.getSex())?"未知":u.getSex());
			msg.put("phone", u.getPhone()==null||"".equals(u.getPhone())?"未知":u.getPhone());
			msg.put("client_id", u.getClient_id());
			msg.put("image", Constant.IMAGE_PATH+u.getClient_id()+"/"+Constant.IMAGE_NAME);
			msg.put("created_at", u.getCreated_at());
			msg.put("status", u.getStatus());
			msg.put("birth", u.getBirth()==null||"".equals(u.getBirth())?"未知":u.getBirth());	
			msg.put("city", city);
			usersmsg.add(msg);
		}
		usermap.put("users", usersmsg);
		return usermap;
	}
}
