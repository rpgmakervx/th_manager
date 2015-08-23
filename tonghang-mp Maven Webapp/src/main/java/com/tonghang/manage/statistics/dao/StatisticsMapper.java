package com.tonghang.manage.statistics.dao;

import java.util.List;
import java.util.Map;

import com.tonghang.manage.statistics.pojo.ActiveUser;
import com.tonghang.manage.user.pojo.User;

public interface StatisticsMapper {

	//记录活跃用户
	public void save(ActiveUser auser);
	//按时间段查找活跃用户记录.
	public List<ActiveUser> findActiveRecordByDate(String date);
	//根据时间段获取活跃用户
	public List<ActiveUser> findActiveRecordByDuration(String begin,String end);
	//按时间查找当日新增用户
	public List<User> findDailyNewUserByDate(String date);	
	//获得这一天的活跃用户
	public Integer getNumberOfActiveUser(String date);
	//获得当天新增的用户
	public Integer getDailyNewUserNumber(String date);
	//获得截至当天的总用户量
	public Integer getTodayAllUserNumber(String date);
}
