package com.tonghang.manage.label.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tonghang.manage.label.dao.LabelMapper;

@Service("labelService")
public class LabelService {

	@Autowired
	private LabelMapper labelMapper;
	/**
	 * 业务功能：通过用户client_id查询他的标签
	 * @param client_id
	 * @return
	 * 方法被调用：com.tonghang.manage.user.util.UserToMapConverter.userConverter()
	 * 					com.tonghang.manage.user.util.UserToMapConverter.usersConverter()
	 */
	public List<String> findLabelNameByUser(String client_id){
		return labelMapper.findLabelNameByUser(client_id);
	}
}
