package com.tonghang.manage.common.dao;

import com.tonghang.manage.common.pojo.SystemConfig;
/**
 * notice:系统及参数表在数据库中只有一个元组
 * @author Administrator
 *
 */
public interface SystemMapper {

	//查询系统参数信息
	public SystemConfig select();
	//更新系统参数
	public void update(SystemConfig config);
	
	public void updateUrl(String url);
}
