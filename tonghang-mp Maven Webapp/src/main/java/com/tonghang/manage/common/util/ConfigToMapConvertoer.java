package com.tonghang.manage.common.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.tonghang.manage.common.pojo.SystemConfig;

@Component("configToMap")
public class ConfigToMapConvertoer {

	public Map<String,Object> configToMapConverter(SystemConfig config){
		Map<String,Object> msg = new HashMap<String, Object>();
		Map<String,Object> configmsg = new HashMap<String, Object>();
		configmsg.put("app_code", config.getApp_code());
		configmsg.put("can_login", config.getCan_login());
		configmsg.put("can_register_user", config.getCan_register_user());
		configmsg.put("can_upgrade", config.getCan_upgrade());
		configmsg.put("can_upgrade_silently", config.getCan_upgrade_silently());
		configmsg.put("self_adv_url", config.getSelf_adv_url());
		configmsg.put("third_adv", config.getThird_adv());
		configmsg.put("use_adv", config.getUse_adv());
		msg.put("config", configmsg);
		return msg;
	}
}
