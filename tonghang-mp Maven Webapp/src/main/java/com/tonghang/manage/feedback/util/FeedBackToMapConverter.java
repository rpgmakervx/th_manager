package com.tonghang.manage.feedback.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.tonghang.manage.common.util.TimeUtil;
import com.tonghang.manage.feedback.pojo.FeedBack;
import com.tonghang.manage.user.pojo.User;
import com.tonghang.manage.user.service.UserService;
import com.tonghang.manage.user.util.UserToMapConverter;

@Component("fbConverter")
public class FeedBackToMapConverter {

	@Resource(name="userService")
	private UserService userService;
	@Resource(name="userToConverter")
	private UserToMapConverter userConverter;
	/**
	 * 包装问题反馈时顺便把User包进去
	 * @param feedBacks
	 * @return
	 */
	public Map<String,Object> feedBacksConverter(List<FeedBack> feedBacks){
		List<Map<String,Object>> fbmsg = new ArrayList<Map<String,Object>>();
		Map<String,Object> fbmap = new HashMap<String, Object>();
		for(FeedBack fb:feedBacks){
			User user = userService.findUserById(fb.getClient_id());
			Map<String,Object> msg = new HashMap<String, Object>();
			msg.put("content", fb.getContent());
			msg.putAll(userConverter.userConverter(user));
			msg.put("created_at", TimeUtil.getFormatString(fb.getCreated_at()));
			fbmsg.add(msg);
		}
		fbmap.put("feedbacks", fbmsg);
		return fbmap;
	}
}
