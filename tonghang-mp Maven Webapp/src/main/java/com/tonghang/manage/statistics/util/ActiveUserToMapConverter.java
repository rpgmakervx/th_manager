package com.tonghang.manage.statistics.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.tonghang.manage.statistics.pojo.ActiveUser;
/**
 * 
 * 该类用来封装bean spring将其变成json后传递给前台
 * @author Administrator
 *
 */
@Component("activeUserToMapConverter")
public class ActiveUserToMapConverter {

	/**
	 * 将一个活跃用户集合转化为一个map
	 * @return
	 */
	public Map<String,Object> activeUsersConverter(List<ActiveUser> ausers){
		Map<String,Object> result = new HashMap<String, Object>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		for(ActiveUser auser:ausers){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("client_id", auser.getClient_id());
			map.put("date", auser.getDate());
			list.add(map);
		}
		result.put("activeusers", list);
		return result;
	}
}
