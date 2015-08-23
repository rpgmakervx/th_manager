package com.tonghang.manage.label.dao;

import java.util.List;

public interface LabelMapper {

	//查询某个用户包含的标签
	public List<String> findLabelNameByUser(String client_id);
	//模糊匹配标签名
	public List<String> findLabelName(String label_name);
}
