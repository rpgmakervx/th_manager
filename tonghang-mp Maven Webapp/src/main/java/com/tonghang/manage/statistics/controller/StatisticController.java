package com.tonghang.manage.statistics.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tonghang.manage.common.util.CommonMapUtil;
import com.tonghang.manage.common.util.StringUtil;
import com.tonghang.manage.common.util.TimeUtil;
import com.tonghang.manage.statistics.service.StatisticsService;

@Controller("statisticController")
@RequestMapping("statistic")
public class StatisticController {

	@Resource(name="statisticsService")
	private StatisticsService statisticsService;
	/**
	 * 业务功能：rest请求  转发到activeUser.jsp
	 * @return
	 */
	@RequestMapping(value="index")
	public String index(){
		return "activeUser";
	}
	@RequestMapping(value="dailynew",method=RequestMethod.GET)
	public String dailyUser(){
		return "dailynewUser";
	}
	@RequestMapping(value="dailyall",method=RequestMethod.GET)
	public String dailyAllUser(){
		return "dailyallUser";
	}
	@RequestMapping(value="remain",method=RequestMethod.GET)
	public String remainUser(){
		return "remainUser";
	}
	/**
	 * 业务功能：根据时间区间获得每日活跃用户数量。
	 * @param date
	 * @return
	 * notice:活跃用户指  每日使用app的用户，包括刷新首页推荐，搜索，进入话题，离开话题，修改信息，发送反馈信息等。
	 * 			每用户每日仅记录一次。按日期分组获得每天的用户量。
	 * 			若@Requestbody 没有参数传入 则默认获得最近一周的数据
	 * struct:
	 * 		result:{
	 * 			pic_server:"",
	 * 			code:"",
	 * 			message:"",
	 * 			numbers:[
	 * 				1, 5, 8, 3, 4, 5, 9
	 * 			]
	 * 		}
	 */
	@RequestMapping(value="activeUser",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> buildChartByActiveUser(@RequestBody(required=false) Map date){
		Map<String,Object> result = new HashMap<String, Object>();
		Map<String,Object> map = CommonMapUtil.baseMsgToMapConvertor("server normal",200);
		Date begin = null;
		Date end = null;
		System.out.println("用户自定义的duration:"+date.get("duration"));
		if(date==null||date.get("duration")==null||"".equals(date.get("duration"))){
			Date today = new Date();
			begin = TimeUtil.plusDateForDateTime(-6, today);	
			end = today;
		}else{
			begin = TimeUtil.getFormatShortDate(StringUtil.seperateTime((String)date.get("duration"), 0));
			end = TimeUtil.getFormatShortDate(StringUtil.seperateTime((String)date.get("duration"), 1));			
		}
		List<Integer> numbers = statisticsService.getNumbernOfActiveUser(begin, end);
		System.out.println("numbers:"+numbers);
		Map<String,Object> number = new HashMap<String, Object>();
		number.put("numbers", numbers);
		map.putAll(number);
		result.put("result", map);
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
	
	/**
	 * 业务功能：根据时间周期获得周期内每日的新增用户
	 * @param date
	 * @return
	 * notice:每日用户总数指的是 每一天创建的用户总数量，可以通过users表的created_at字段抽取符合条件的那天的count(*)
	 * struct:
	 * 		result:{
	 * 			pic_server:"",
	 * 			code:"",
	 * 			message:"",
	 * 			numbers:[
	 * 				1, 5, 8, 3, 4, 5, 9
	 * 			]
	 * 		}
	 */
	@RequestMapping(value="dailyUser",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> buildChartByDailyNewUser(@RequestBody(required=false) Map date){
		Map<String,Object> result = new HashMap<String, Object>();
		Map<String,Object> map = CommonMapUtil.baseMsgToMapConvertor("server normal",200);
		Date begin = null;
		Date end = null;
		System.out.println("用户自定义的duration:"+date.get("duration"));
		if(date==null||date.get("duration")==null||"".equals(date.get("duration"))){
			Date today = new Date();
			begin = TimeUtil.plusDateForDateTime(-6, today);	
			end = today;
		}else{
			begin = TimeUtil.getFormatShortDate(StringUtil.seperateTime((String)date.get("duration"), 0));
			end = TimeUtil.getFormatShortDate(StringUtil.seperateTime((String)date.get("duration"), 1));			
		}
		Map<String,Object> number = new HashMap<String, Object>();
		List<Integer> numbers = statisticsService.getNumberOfDailyNewUser(begin, end);
		System.out.println("numbers:"+numbers);
		number.put("numbers", numbers);
		map.putAll(number);
		result.put("result", map);
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
	
	/**
	 * 业务功能：获取每一天的当天总用户量
	 * @param date
	 * @return
	 * notice:当天总用户量 ，可通过当天日期，获得从这个日期开始到最早日期的总用户量.
	 * 			由于用户量比较大的时候差别比较小，因此默认显示两个月的变化
	 * struct:
	 * 		result:{
	 * 			pic_server:"",
	 * 			code:"",
	 * 			message:"",
	 * 			numbers:[
	 * 				1, 5, 8, 3, 4, 5, 9
	 * 			]
	 * 		}
	 */
	@RequestMapping(value="allUser",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> buildChartByDailyAllUser(@RequestBody(required=false) Map date){
		Map<String,Object> result = new HashMap<String, Object>();
		Map<String,Object> map = CommonMapUtil.baseMsgToMapConvertor("server normal",200);
		Date begin = null;
		Date end = null;
		System.out.println("用户自定义的duration:"+date.get("duration"));
		if(date==null||date.get("duration")==null||"".equals(date.get("duration"))){
			Date today = new Date();
			begin = TimeUtil.plusDateForDateTime(-60, today);	
			System.out.println("begin :" +begin);
			end = today;
		}else{
			begin = TimeUtil.getFormatShortDate(StringUtil.seperateTime((String)date.get("duration"), 0));
			end = TimeUtil.getFormatShortDate(StringUtil.seperateTime((String)date.get("duration"), 1));			
		}
		List<Integer> numbers = statisticsService.getNumberOfTodayAllUser(begin, end);
		System.out.println("numbers:"+numbers);
		Map<String,Object> number = new HashMap<String, Object>();
		number.put("numbers", numbers);
		map.putAll(number);
		result.put("result", map);
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
	/**
	 * 业务功能：获得时间范围内，每一天新增用户往后每天的留存率
	 * @param date
	 * @return
	 */
	@RequestMapping(value="remainUser")
	public ResponseEntity<Map<String,Object>> buildTabByRemainPercentage(@RequestBody(required=false) Map date){
		Map<String,Object> result = new HashMap<String, Object>();
//		Map<String,Object> date = new HashMap<String, Object>();
		Map<String,Object> map = CommonMapUtil.baseMsgToMapConvertor("server normal",200);
		Date begin = null;
		Date end = null;
		if(date==null||date.get("duration")==null||"".equals(date.get("duration"))){
			Date today = new Date();
			begin = TimeUtil.plusDateForDateTime(-7, today);	
			System.out.println("begin :" +begin);
			end = today;
		}else{
			begin = TimeUtil.getFormatShortDate(StringUtil.seperateTime((String)date.get("duration"), 0));
			end = TimeUtil.getFormatShortDate(StringUtil.seperateTime((String)date.get("duration"), 1));			
		}
		List<Map<String,Object>> remainPercentage = statisticsService.getRemainPercentage(begin, end);
		List<Integer> numbers = statisticsService.getNumberOfDailyNewUser(begin, end);
		map.put("numbers", numbers);
		map.put("remainPercents", remainPercentage);
		result.put("result", map);
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
}
