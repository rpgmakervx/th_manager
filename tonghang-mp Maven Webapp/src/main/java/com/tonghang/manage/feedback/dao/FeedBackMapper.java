package com.tonghang.manage.feedback.dao;

import java.util.List;

import com.tonghang.manage.feedback.pojo.FeedBack;

public interface FeedBackMapper {

	//查找所有用户的问题反馈
	public List<FeedBack> findAllFeedBacks();
	//按用户名查找反馈信息
	public List <FeedBack> findFeedBacksByUser(String username);
	//得到反馈信息总数
	public int getCount();
	//按条件查找反馈信息的总数量
	public int getCountByUser(String username);
}
