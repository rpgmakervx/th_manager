package com.tonghang.manage.user.dao;

import java.util.List;
import java.util.Map;

import com.tonghang.manage.user.pojo.User;
/**
 * 分页在service完成，使用PageHelper插件
 * @author Administrator
 *
 */
public interface UserMapper {

	//按照ID查询用户
	public User findUserById(String client_id);
	//按照用户属性 分页查询用户
	public List<User> findUserByAttribute(Map<String,Object> user);
	//分页查询所有用户
	public List<User> findAllUser();
	//根据标签名查询用户
	public List<User> finUserByLabelName(String label_name);
	//获取总用户量
	public int userNumbers();
	//获取按条件搜索到的用户的总用户量
	public int userNumbersByAttribute(Map<String,Object> user);
	//管理员对用户进行封号和解封
	public void isolate(User user);
	
}
