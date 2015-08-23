package com.tonghang.manage.common.dao;

import com.tonghang.manage.common.pojo.SystemConfig;

public interface SystemMapper {

	//查询系统参数信息
	public SystemConfig select();
	//更新系统参数
	public void update(SystemConfig config);
}
