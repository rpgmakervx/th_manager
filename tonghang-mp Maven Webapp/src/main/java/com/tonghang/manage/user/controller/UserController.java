package com.tonghang.manage.user.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tonghang.manage.common.util.CommonMapUtil;
import com.tonghang.manage.common.util.StringUtil;
import com.tonghang.manage.common.util.TimeUtil;
import com.tonghang.manage.isolate.pojo.IsolateLog;
import com.tonghang.manage.isolate.service.IsolateService;
import com.tonghang.manage.user.pojo.User;
import com.tonghang.manage.user.service.UserService;
import com.tonghang.manage.user.util.UserToMapConverter;


@Controller("userController")
@RequestMapping("user")
public class UserController {

	@Resource(name="userService")
	private UserService userService;
	@Resource(name="userToConverter")
	private UserToMapConverter userConverter;
	@Resource(name="isolateService")
	private IsolateService isolateService;
	/**
	 * 业务功能：restful风格请求url，转发到checkUser.jsp
	 * @return
	 */
	@RequestMapping(value="index",method=RequestMethod.GET)
	public String index(){
		return "checkUser";
	}
	
	@RequestMapping(value="{client_id}")
	public String detail(HttpServletRequest request,@PathVariable String client_id){
		System.out.println("detail::: "+client_id);
		if(client_id==null||"".equals(client_id))
			return "404-error";
		else{
			request.setAttribute("client_id", client_id);
			return "userDetail";
		}
	}
	/**
	 * 
	 * 业务功能：获得所有用户信息
	 * @param pageindex 分页查询的页码
	 * @return
	 * 
	 * struct:
	 * 			result{
	 * 				code:,
	 * 				message:,
	 * 				account:,
	 * 				users:[
	 * 					client_id:,
	 * 					username:,
	 * 					email:,
	 * 					sex:,
	 * 					city:,
	 * 					phone:,
	 * 					status:
	 * 				]
	 *			}
	 */
	@RequestMapping(value="checkAllUser")
	@ResponseBody public ResponseEntity<Map<String,Object>> checkAllUser(HttpServletResponse response,@RequestParam Integer pageindex){
		Map<String,Object> result = new HashMap<String, Object>();
		Map<String,Object> map = CommonMapUtil.baseMsgToMapConvertor("server normal");
		List<User> users = userService.findAllUser(pageindex);
		int account = userService.getAllUserNumber();
		map.put("account", account);
		map.putAll(userConverter.usersConverter(users));
		result.put("result", map);
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
	
	/**
	 * 
	 * 业务功能：按条件搜索用户信息
	 * @param pageindex 分页查询的页码
	 * @return
	 * 
	 * struct:
	 * 			result:{
	 * 				code:,
	 * 				message:,
	 * 				account:,
	 * 				users:[
	 * 					client_id:,
	 * 					username:,
	 * 					email:,
	 * 					sex:,
	 * 					city:,
	 * 					phone:,
	 * 					status:
	 * 				]
	 *			}
	 */
	@RequestMapping(value="checkUser")
	public ResponseEntity<Map<String,Object>> checkUser(@RequestBody Map request,@RequestParam Integer pageindex){
		Map<String,Object> result = new HashMap<String, Object>();
		Map<String,Object> map = CommonMapUtil.baseMsgToMapConvertor("server normal");
		String name = (String)request.get("name");
		String label_name = (String) request.get("label_name");
		String email = (String) request.get("email");
		System.out.println("name:: "+ name+" label_name:: "+label_name);
		User user = new User();
		user.setUsername(name);
		user.setEmail(email);
		List<User> users = userService.findUserByAttribute(user, label_name, pageindex);
		int account = userService.getUserNumberByAttribute(user,label_name);
		map.put("account", account);
		System.out.println("users.length: "+userConverter.usersConverter(users));
		map.putAll(userConverter.usersConverter(users));
		result.put("result", map);
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
	/**
	 * 业务功能：查看单个用户的详细信息
	 * @param client_id
	 * @return
	 * struct:
	 * 			result{
	 * 				code:,
	 * 				message:,
	 * 				user:{
	 * 					client_id:,
	 * 					username:,
	 * 					email:,
	 * 					sex:,
	 * 					city:,
	 * 					phone:,
	 * 					status:,
	 * 					birth：,
	 * 					age:,
	 * 					last_login_at:,
	 * 					created_at:,
	 * 					image:,
	 * 					labels:
	 * 				}
	 *			}
	 *	notice:返回值未来可能会扩充很多跟用户相关的信息，包括好友列表，他的话题，积分等等
	 */
	@RequestMapping("detail/{client_id}")
	public ResponseEntity<Map<String,Object>> detail(@PathVariable String client_id){
		Map<String,Object> result = new HashMap<String, Object>();
		Map<String,Object> map = CommonMapUtil.baseMsgToMapConvertor("server normal");
		User user = userService.findUserById(client_id);
		map.putAll(userConverter.userConverter(user));
		result.put("result", map);
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
	/**
	 * 业务功能：对某用户进行封号操作
	 * @param client_id 	被封号用户
	 * @param admin_id		封号操作的管理员
	 * @param reason		封号原因
	 * @param duration		封号时间段
	 * @return
	 * 
	 * notice: 封号操作放在计时器中，到达指定时间后执行解封操作。
	 * 			目前对时间没做处理，管理员可能触发一个滞后的封号操作，比如今天发起操作，封号时间从明天开始封号一个月
	 */
	@RequestMapping(value="isolate",method=RequestMethod.POST)
	public String isolate(@RequestParam String client_id,@RequestParam String admin_id,
							@RequestParam String reason,@RequestParam String duration){
		IsolateLog isolate = new IsolateLog();
		isolate.setAdmin_id(admin_id);
		isolate.setReason(reason);
		String begin = StringUtil.seperateTime(duration, 0);
		String end = StringUtil.seperateTime(duration, 1);
		isolate.setBegin_time(TimeUtil.getFormatDate(begin));
		isolate.setEnd_time(TimeUtil.getFormatDate(end));
		isolate.setOperated_time(new Date());
		isolate.setClient_id(client_id);
		userService.isolateUser("0",isolate);
		System.out.println("client_id : " +client_id);
		return "redirect:/user/"+client_id;
	}
	/**
	 * 业务功能：对用户进行解封操作
	 * @param client_id		被解封用户
	 * @param admin_id		操作管理员
	 * @return
	 */
	@RequestMapping(value="deisolate",method=RequestMethod.POST)
	@ResponseBody public Map<String,Object> isolate(@RequestParam String client_id,@RequestParam String admin_id){
		System.out.println("解封号请求处理");
		IsolateLog isolate = new IsolateLog();
		isolate.setAdmin_id(admin_id);
		isolate.setClient_id(client_id);
		isolate.setReason("管理员解除该用户的封号");
		Date date = new Date();
		isolate.setBegin_time(date);
		isolate.setEnd_time(date);
		isolate.setOperated_time(date);
		userService.isolateUser("1",isolate);
		return new HashMap<String,Object>();
	}
}
