package com.tonghang.manage.isolate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tonghang.manage.isolate.dao.IsolateMapper;
import com.tonghang.manage.isolate.pojo.IsolateLog;

@Service("isolateService")
public class IsolateService {

	@Autowired
	public IsolateMapper isolateMapper;
	
	/**
	 * 业务功能：保存封号记录
	 * @param isolate 封号记录对象
	 * 方法被调用：
	 */
	public void saveLog(IsolateLog isolate){
		isolateMapper.save(isolate);
	}
}
