package com.tonghang.manage.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tonghang.manage.common.dao.SystemMapper;
import com.tonghang.manage.common.pojo.SystemConfig;

@Service("systemService")
public class SystemService {

	@Autowired
	private SystemMapper systemMapper;
	/**
	 * 业务功能：获得系统参数
	 * @return
	 * 方法被调用：com.tonghang.manage.common.controller.SystemController.index()
	 */
	public SystemConfig getConfig(){
		return systemMapper.select();
	}
	/**
	 * 
	 * 业务功能：修改系统参数
	 * @param config 系统参数对象
	 * 方法被调用：com.tonghang.manage.common.controller.SystemController.changeSystemConfig(HttpSession,String,String,String)
	 */
	public SystemConfig updateConfig(String can_login,String can_regist,String upgrade){
		SystemConfig config = new SystemConfig();
		if("on".equals(can_regist))
			config.setCan_register_user(1);
		else  config.setCan_register_user(0);
		if("on".equals(can_login))
			config.setCan_login(1);
		else config.setCan_login(0);
		if("on".equals(upgrade))
			config.setCan_upgrade_silently(1);
		else config.setCan_upgrade_silently(0);
		systemMapper.update(config);
		return config;
	}
}
