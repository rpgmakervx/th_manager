package com.tonghang.manage.statistics.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tonghang.manage.common.util.Constant;
import com.tonghang.manage.common.util.TimeUtil;
import com.tonghang.manage.statistics.dao.StatisticsMapper;
import com.tonghang.manage.statistics.pojo.ActiveUser;
import com.tonghang.manage.statistics.util.NumberUtil;
import com.tonghang.manage.user.pojo.User;

@Service("statisticsService")
public class StatisticsService {

	@Autowired
	private StatisticsMapper statisticsMapper;
	
	/**
	 * 业务功能：获取活跃用户记录
	 * @param begin
	 * @param end
	 * @return
	 */
	public List<ActiveUser> findActiveUserByDate(Date begin,Date end){
		List<ActiveUser> ausers = new ArrayList<ActiveUser>();
		int duration = Math.abs(Integer.parseInt((end.getTime()-begin.getTime())/1000/60/60/24+""));
		System.out.println("日期间各："+duration);
		for(int index=0;index<=duration;index++){
			Date date = TimeUtil.plusDateForDateTime(index, begin);
			System.out.println("遍历日期："+date);
			ausers.addAll(statisticsMapper.findActiveRecordByDate(TimeUtil.getFormatDateString(date)));
		}
		return ausers;
	}
	/**
	 * 业务功能：获得每天的活跃用户数量
	 * @param begin
	 * @param end
	 * @return
	 * notice:通过日期参数，遍历日期，并获得每一天的活跃用户量。
	 * 		（分组的话在日期处理上比较棘手，比如2015/08/01至2015/08/31 期间如果某一天没有数据则不会被查询出来，
	 * 		不会设置默认值，所以目前认为遍历一遍所有日期是最精准的）
	 * 方法被调用：com.tonghang.manage.statistics.controller.StatisticController.buildChartByActiveUser()
	 */
	public List<Integer> getNumbernOfActiveUser(Date begin,Date end){
		List<Integer> numbers = new ArrayList<Integer>();
		int duration = Math.abs(Integer.parseInt((end.getTime()-begin.getTime())/1000/60/60/24+""));
		System.out.println("日期间各："+duration);
		for(int index=0;index<=duration;index++){
			Date date = TimeUtil.plusDateForDateTime(index, begin);
			System.out.println("遍历日期："+date);
			numbers.add(statisticsMapper.getNumberOfActiveUser(TimeUtil.getFormatDateString(date)));
		}
		return numbers;
	}
	/**
	 * 业务功能：获得每天的新增用户量
	 * @param begin
	 * @param end
	 * @return
	 * notice:通过 遍历日期 去users表中查找每天的created_at用户的总数
	 * 
	 * 方法被调用：com.tonghang.manage.statistics.controller.StatisticController.buildChartByDailyUser()
	 */
	public List<Integer> getNumberOfDailyNewUser(Date begin,Date end){
		List<Integer> numbers = new ArrayList<Integer>();
		int duration = Math.abs(Integer.parseInt((end.getTime()-begin.getTime())/1000/60/60/24+""));
		for(int index=0;index<=duration;index++){
			Date date = TimeUtil.plusDateForDateTime(index, begin);
			System.out.println("遍历日期："+date);
			numbers.add(statisticsMapper.getDailyNewUserNumber(TimeUtil.getFormatDateString(date)));
		}
		return numbers;
	}
	/**
	 * 业务功能：获得截止当天的用户总量
	 * @param begin
	 * @param end
	 * @return
	 * notice:通过 遍历日期 去users表中查找 created_at小于当天日期的用户总数
	 * 
	 * 方法被调用：com.tonghang.manage.statistics.controller.StatisticController.buildChartByDailyAllUser()
	 */
	public List<Integer> getNumberOfTodayAllUser(Date begin,Date end){
		List<Integer> numbers = new ArrayList<Integer>();
		int duration = Math.abs(Integer.parseInt((end.getTime()-begin.getTime())/1000/60/60/24+""));
		for(int index=0;index<=duration;index++){
			Date date = TimeUtil.plusDateForDateTime(index, begin);
			System.out.println("遍历日期："+date);
			numbers.add(statisticsMapper.getTodayAllUserNumber(TimeUtil.getFormatDateString(date)));
		}
		return numbers;
	}
	/***
	 * 业务功能：统计指定时间段内，每天的用户留存率
	 * @param begin
	 * @param end
	 * @return
	 * 方法被调用：com.tonghang.manage.statistics.controller.StatisticController.buildTabByRemainPercentage()
	 * notice:
	 */
	public List<Map<String,Object>> getRemainPercentage(Date begin,Date end){
		List<Map<String,Object>> percentmsg = new ArrayList<Map<String,Object>>();
		int duration = Math.abs(Integer.parseInt((end.getTime()-begin.getTime())/1000/60/60/24+""));
		//这是最外层循环，用来遍历前台传过来的时间段，这层循环将走过这个时间段中的每一天，把每一天传给下一层循环获得那一天相应的数据
		for(int index=0;index<duration;index++){
			Date date = TimeUtil.plusDateForDateTime(index, begin);
			System.out.println("遍历日期："+date);
			//获得周期中某一天的新增用户
			List<User> users = statisticsMapper.findDailyNewUserByDate(TimeUtil.getFormatDateString(date));
			//从最外层循环的那一天开始，往后推一个周，计算这一个周内每天的留存率
			percentmsg.add(calculateDailyRemain(users,new Date(),date));
		}
		return percentmsg;
	}
	/**
	 * 业务功能：计算某一天往后一周(两周，一个月)的留存率，并把数据存在数组中
	 * @param users  第n天的新增用户
	 * @param begin  开始的日期
	 * @param date	  开始后的第n天的日期
	 * @param index  开始后的第n天
	 * @return
	 * 方法被调用：this.getRemainPercentage()
	 * notice:这里的第n天，是getRemainPercentage方法中从begin遍历到end中间的日期的天数。
	 * 目前是指计算每天新增用户在未来七天的留存率，未来版本根据需求变动
	 */
	private Map<String,Object> calculateDailyRemain(List<User> users,Date end,Date date){
		List<Map<String,Object>> remainData = new ArrayList<Map<String,Object>>();
		Map<String,Object> remainUser = new HashMap<String, Object>();
		//该层循环是写死的，计算每天的新增用户在未来七天的留存率今后可能会拓展计算一个月后的留存率，因此需要修改
		for(int day=1;day<Constant.WEEK+3;day++){
			//计算当前这一天到管理员指定的最后一天够不够天数（比如20号到23号查3天，则不显示第四天的留存率）
			int gap = Math.abs(Integer.parseInt((end.getTime()-date.getTime())/1000/60/60/24+""));
			if(gap<day&&day<=7)
				break;
			//查看两周留存时，时间不够两个周
			if(gap<Constant.WEEK*2&&day==8)
				break;
			//查看一个月留存时，时间不够一个月
			if(gap<Constant.MONTH&&day==9)
				break;
			//留存数量
			int remainCount = 0;
			Map<String,Object> dailyRemain = new HashMap<String, Object>();
			//获得周期中某一天的新增用户总数，做分母计算留存率
			int newUserCount = 0;
			Date doubleweeks = null;
			Date month = null;
			Date tomorrow = null;
			//如果当天没有新增用户就不用计算该日的留存了。
			List<ActiveUser> ausers = null;
			if(users!=null&&users.size()!=0){
				newUserCount = users.size();
				if(day==8){
					doubleweeks = TimeUtil.plusDateForDateTime(Constant.WEEK*2+1, date);		
					ausers = statisticsMapper.findActiveRecordByDuration(TimeUtil.getFormatDateString(date),TimeUtil.getFormatDateString(doubleweeks) );
				}else if(day==9){
					month = TimeUtil.plusDateForDateTime(Constant.MONTH+1, date);
					ausers = statisticsMapper.findActiveRecordByDuration(TimeUtil.getFormatDateString(date),TimeUtil.getFormatDateString(month));
				}else{
					tomorrow = TimeUtil.plusDateForDateTime(day, date);
					//获得周期中某一天的第二天的活跃用户。
					ausers = statisticsMapper.findActiveRecordByDate(TimeUtil.getFormatDateString(tomorrow));
				}
				System.out.println(TimeUtil.getFormatDateString(tomorrow)+"这天 的活跃用户量为："+ausers.size());
				remainCount = compareUser(users, ausers);
				System.out.println("总数："+newUserCount+"  百分比："+remainCount+" + "+newUserCount+" = "+((double)remainCount)/newUserCount);
				String percent = NumberUtil.floatToPercent(((double)remainCount)/((double)newUserCount));
				System.out.println("date :"+TimeUtil.getFormatDateString(date)+" 这天的"+day+"天后的留存率："+percent);
				dailyRemain.put("dailypercent", percent);
				remainData.add(dailyRemain);
			}else{
				dailyRemain.put("dailypercent", "0.00%");
				remainData.add(dailyRemain);
			}
			remainUser.put("remainPercent", remainData);
		}
		return remainUser;
	}
	
	/**
	 * 业务功能：比较两个list中有多少相同client_id的user
	 * @param users
	 * @param ausers
	 * @return
	 * 
	 * 方法被调用：this.calculateDailyRemain()
	 */
	private int compareUser(List<User> users,List<ActiveUser> ausers){
		//这层循环是查看两个用户集合有几个相同的用户
		//查看这部分新增用户在未来一个礼拜后的留存率
		int remainCount = 0;
		for(User user:users){
			for(ActiveUser auser:ausers){
				System.out.println("活跃用户client_id:  "+auser.getClient_id());
				System.out.println("新注册用户client_id:  "+user.getClient_id());
				if(user.getClient_id().equals(auser.getClient_id())){
					System.out.println("发现留存用户！！remainCount自增一下");
					remainCount++;								
					break;
				}
			}
		}
		return remainCount;
	}
	
}
