package com.tonghang.manage.feedback.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tonghang.manage.common.util.CommonMapUtil;
import com.tonghang.manage.feedback.pojo.FeedBack;
import com.tonghang.manage.feedback.service.FeedBackService;
import com.tonghang.manage.feedback.util.FeedBackToMapConverter;

@Controller("feedBackController")
@RequestMapping("feedback")
public class FeedBackController {

	@Resource(name="feedBackService")
	private FeedBackService feedBackService;
	@Resource(name="fbConverter")
	private FeedBackToMapConverter fbConverter;
	/**
	 * 业务功能：restful风格请求url，转发到feedback.jsp
	 * @return
	 */
	@RequestMapping(value="index")
	public String index(){
		return "feedback";
	}
	/**
	 * 业务功能：管理员读取全部反馈信息
	 * @param pageindex
	 * @return
	 */
	@RequestMapping(value="check",method=RequestMethod.POST)
	@ResponseBody public ResponseEntity<Map<String,Object>> check(@RequestParam int pageindex){
		List<FeedBack> feedBacks = feedBackService.findFeedBack(pageindex);
		Map<String,Object> map = CommonMapUtil.baseMsgToMapConvertor("server normal",200);
		Map<String,Object> result = new HashMap<String, Object>();
		map.putAll(fbConverter.feedBacksConverter(feedBacks));
		map.put("account", feedBackService.getCount());
		result.put("result", map);
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
	
	@RequestMapping(value="checkFeedBack",method=RequestMethod.POST)
	@ResponseBody public ResponseEntity<Map<String,Object>> checkFeedBack(@RequestBody Map request,@RequestParam int pageindex){
		String name = (String) request.get("name");
		List<FeedBack> feedBacks = feedBackService.findFeedBackByUser(name, pageindex);
		Map<String,Object> map = CommonMapUtil.baseMsgToMapConvertor("server normal",200);
		Map<String,Object> result = new HashMap<String, Object>();
		map.putAll(fbConverter.feedBacksConverter(feedBacks));
		map.put("account", feedBackService.getCountByUser(name));
		result.put("result", map);
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
}
