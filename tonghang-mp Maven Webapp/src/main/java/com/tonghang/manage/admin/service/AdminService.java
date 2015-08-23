package com.tonghang.manage.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tonghang.manage.admin.dao.AdminMapper;
import com.tonghang.manage.admin.pojo.Admin;
import com.tonghang.manage.common.util.Constant;
import com.tonghang.manage.common.util.EmailUtil;
import com.tonghang.manage.common.util.StringUtil;

@Service("adminService")
public class AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	/**
	 * 业务功能：添加管理员
	 * @param admin
	 * 方法被调用：com.tonghang.manage.admin.controller.AdminController.addAdmin(HttpSession, Map)
	 */
	public void addAdmin(Admin admin){
		adminMapper.add(admin);
	}
	/**
	 * 业务功能：通过ID查找管理员
	 * @param admin_id
	 * @return
	 * 方法被调用：
	 */
	public Admin findAdminById(String admin_id){
		return adminMapper.findAdminById(admin_id);
	}
	
	/**
	 * 业务功能：通过手机号查询管理员
	 * @param email
	 * @return
	 * 方法被调用:com.tonghang.manage.admin.controller.AdminController.addAdmin(HttpSession, Map)
	 */
	public Admin findAdminByPhone(String phone){
		return adminMapper.findAdminByPhone(phone);
	}
	/**
	 * 业务功能：通邮箱号查询管理员
	 * @param email
	 * @return
	 * 方法被调用:com.tonghang.manage.admin.controller.AdminController.addAdmin(HttpSession, Map)
	 */
	public Admin findAdminByEmail(String email){
		return adminMapper.findAdminByEmail(email);
	}
	/**
	 * 
	 * 业务功能：计算一共有多少管理员
	 * @return
	 *	方法被调用： com.tonghang.manage.admin.controller.AdminController.checkAllAdmin(Integer)
	 */
	public int getAdminNumber(){
		return adminMapper.adminNumbers();
	}
	/**
	 * 
	 * 业务功能：计算一共有多少管理员
	 * @return
	 *	方法被调用：com.tonghang.manage.admin.controller.AdminController.checkAdmin(Map,Integer)
	 */
	public int getAdminNumberByAttribute(Admin admin){
		return adminMapper.adminNumbersByAttribute(admin);
	}
	/**
	 * 业务功能：获取所有管理员
	 * @return
	 * 方法被调用：:com.tonghang.manage.admin.controller.AdminController.checkAllAdmin(Integer)
	 */
	public List<Admin> findAllAdmin(int pageindex){
		PageHelper.startPage(pageindex, Constant.PAGESIZE);
		List<Admin> admins = adminMapper.findAllAdmin();
		return admins;
	}
	/**
	 * 业务功能：通过用户名密码验证管理员
	 * @param name
	 * @param password
	 * @return
	 * 方法被调用：com.tonghang.manage.admin.controller.AdminController.login(HttpSession,String,String)
	 */
	public Admin validateAdmin(String email,String password){
		Admin admin = adminMapper.findAdminByEmail(email);
		if(admin!=null&&password.equals(admin.getPassword())){
			return admin;
		}else return null;
	}

	/**
	 * 业务功能：管理员修改密码
	 * @param admin_id
	 * @param newpassword
	 * @param oldpassword
	 * @return
	 * 方法被调用：com.tonghang.manage.admin.controller.AdminController.changePassword(HttpSession,String,String)
	 */
	public boolean updatePassword(String admin_id,String newpassword,String oldpassword){
		Admin admin = adminMapper.findAdminById(admin_id);
		if(oldpassword.equals(admin.getPassword())){
			admin.setPassword(newpassword);
			System.out.println(admin);
			adminMapper.update(admin);
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 业务功能：通过管理员属性查找管理员
	 * @param admin
	 * @return
	 * 方法被调用：com.tonghang.manage.admin.controller.AdminController.forget(HttpSession,String,String)
	 * 				com.tonghang.manage.admin.controller.AdminController.checkAdmin(Map,Integer)
	 */
	public List<Admin> findAdminByAttribute(Admin admin,int pageindex){
		PageHelper.startPage(pageindex, Constant.PAGESIZE,false);
		List<Admin> admins = adminMapper.findAdmin(admin);
		return admins;
	}
	/**
	 * 业务功能：删除指定管理员
	 * @param admin_id
	 * 方法被调用：
	 */
	public void deleteAdminById(String admin_id){
		adminMapper.delete(admin_id);
	}
	/**
	 * 业务功能：忘记密码的邮箱号通过验证后，发送邮箱
	 * @param admin
	 * 注意：发送邮箱前先生成8位随机数
	 * 方法被调用：com.tonghang.manage.admin.controller.AdminController.forget(HttpSession,String,String)
	 */
	public void forgetPassword(Admin admin){
		admin.setPassword(StringUtil.randomCode(8));
		//调修改密码方法
		EmailUtil.sendEmail(admin);
		adminMapper.update(admin);
	}
	public void updateAdmin(){
		
	}
}
