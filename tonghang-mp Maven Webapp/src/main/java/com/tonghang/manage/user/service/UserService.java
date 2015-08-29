package com.tonghang.manage.user.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.tonghang.manage.common.util.Constant;
import com.tonghang.manage.common.util.EmailUtil;
import com.tonghang.manage.common.util.JPushUtil;
import com.tonghang.manage.common.util.StringUtil;
import com.tonghang.manage.common.util.TimeUtil;
import com.tonghang.manage.isolate.pojo.IsolateLog;
import com.tonghang.manage.isolate.service.IsolateService;
import com.tonghang.manage.user.dao.UserMapper;
import com.tonghang.manage.user.pojo.User;

@Service("userService")
public class UserService{

	@Autowired
	private UserMapper userMapper;
	@Resource(name="isolateService")
	public  IsolateService isolateService;
	/**
	 * 业务功能：按条件分页查询用户
	 * @param user
	 * @param pageindex
	 * @return
	 * 方法被调用：com.tonghang.manage.user.controller.UerController.checkUser()
	 */
	public List<User> findUserByAttribute(User user,String label_name,int pageindex){
		PageHelper.startPage(pageindex, Constant.PAGESIZE);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("username", user.getUsername());
		map.put("id_card", user.getIsonline());
		map.put("sex", user.getSex());
		map.put("phone", user.getPhone());
		map.put("email", user.getEmail());
		map.put("label_name",label_name);
		return userMapper.findUserByAttribute(map);
	}
	/**
	 *业务功能：分页查询所有用户
	 * @param pageindex
	 * @return
	 * 方法被调用：com.tonghang.manage.user.controller.UerController.checkAllUser()
	 */
	public List<User> findAllUser(int pageindex){
		PageHelper.startPage(pageindex, Constant.PAGESIZE);
		return userMapper.findAllUser();
	}
	/**
	 * 业务功能：通过ID查询用户
	 * @param client_id
	 * @return
	 * 方法被调用：com.tonghang.manage.user.controller.UerController.detail()
	 */
	public User findUserById(String client_id){
		return userMapper.findUserById(client_id);
	}
	/**
	 * 业务功能：按标签名模糊查询用户
	 * @param label_name
	 * @return
	 * 方法被调用：
	 */
	public List<User> findUserByLabelName(String label_name){
		return userMapper.finUserByLabelName(label_name);
	}
	/**
	 * 业务功能：获得所有的用户量
	 * @return
	 * 方法被调用：com.tonghang.manage.user.controller.UerController.checkAllUser()
	 */
	public int getAllUserNumber(){
		return userMapper.userNumbers();
	}
	/**
	 * 业务功能：获得条件查询的用户量
	 * @param user
	 * @return
	 * 方法被调用：com.tonghang.manage.user.controller.UerController.checkUser()
	 */
	public int getUserNumberByAttribute(User user,String label_name){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("username", user.getUsername());
		map.put("id_card", user.getIsonline());
		map.put("sex", user.getSex());
		map.put("phone", user.getPhone());
		map.put("label_name",label_name);
		return userMapper.userNumbersByAttribute(map);
	}
	/**
	 * 业务功能：管理员对用户进行封号或解封的操作
	 * @param status
	 * @param client_id
	 * 方法被调用：com.tonghang.manage.user.controller.UerController.
	 */
	public void isolateUser(String status,final IsolateLog log){
		User user = findUserById(log.getClient_id());
		user.setStatus(status);
		final Timer timer = new Timer();
		if("0".equals(status)){
			System.out.println("封号结束时间："+log.getEnd_time());
			timer.schedule(new TimerTask() {
				@Override
				public void run() {
					// TODO Auto-generated method stub
					User user = findUserById(log.getClient_id());
					if("0".equals(user.getStatus())){
						log.setReason("封号时间到，解除封号");
						isolateService.saveLog(log);
						user.setStatus("1");
						userMapper.isolate(user);
						//加推送
						EmailUtil.sendEmailToUser(user);
					}
				}
			}, log.getEnd_time());
			JPushUtil.push(user.getClient_id(), user.getClient_id(), user.getUsername(), Constant.ISOLATE, Constant.ISOLATE_MSG);
		}else{
			//加推送
			EmailUtil.sendEmailToUser(user);
		}
		System.out.println("当前用户状态："+user.getStatus());
		isolateService.saveLog(log);
		userMapper.isolate(user);
	}
}
