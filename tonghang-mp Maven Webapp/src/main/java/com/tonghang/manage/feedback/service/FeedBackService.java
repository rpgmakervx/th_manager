package com.tonghang.manage.feedback.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.tonghang.manage.common.util.Constant;
import com.tonghang.manage.feedback.dao.FeedBackMapper;
import com.tonghang.manage.feedback.pojo.FeedBack;
import com.tonghang.manage.user.pojo.User;

@Service("feedBackService")
public class FeedBackService {

	@Autowired
	private FeedBackMapper feedBackMapper;
	/**
	 * 业务功能：获得全部的反馈信息
	 * @param pageindex
	 * @return
	 * 
	 * 方法被调用：com.tonghang.manage.feedback.controller.FeedBackController.check()
	 */
	public List<FeedBack> findFeedBack(int pageindex){
		PageHelper.startPage(pageindex, Constant.PAGESIZE);
		return feedBackMapper.findAllFeedBacks();
	}
	/**
	 * 业务功能：获得反馈信息总数
	 * @return
	 * 方法被调用：com.tonghang.manage.feedback.controller.FeedBackController.check()
	 */
	public int getCount(){
		return feedBackMapper.getCount();
	}
	/**
	 * 业务功能：按用户名搜索反馈信息
	 * @param user
	 * @return
	 * 方法被调用：com.tonghang.manage.feedback.controller.FeedBackController.checkFeedBack()
	 */
	public List<FeedBack> findFeedBackByUser(String username,int pageindex){
		PageHelper.startPage(pageindex, Constant.PAGESIZE);
		return feedBackMapper.findFeedBacksByUser(username);
	}
	/**
	 * 业务功能：按用户名搜索反馈信息的总数
	 * @param username
	 * @return
	 * 方法被调用：com.tonghang.manage.feedback.controller.FeedBackController.checkFeedBack()
	 */
	public int getCountByUser(String username){
		return feedBackMapper.getCountByUser(username);
	}
}
