package com.tonghang.manage.statistics.dao;

import java.util.List;

public interface ChannelMapper {

	//获取某渠道某一天的新增用户
	public List<Integer> findNewUserFromChannel(String channel_id,String date); 
	//获取某用户截止目前的全部
	public List<Integer> findAllUserFromChannel(String channel_id,String date);
}
