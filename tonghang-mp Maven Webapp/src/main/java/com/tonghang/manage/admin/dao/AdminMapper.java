package com.tonghang.manage.admin.dao;

import java.util.List;

import com.tonghang.manage.admin.pojo.Admin;

public interface AdminMapper {
	//插入单个管理员
	public void add(Admin admin);
	
	//按主键查找
	public Admin findAdminById(String admin_id);
	//按邮箱查找（检查邮箱重复），建议单一条件使用
	public Admin findAdminByEmail(String email);
	//按手机号查找（检查手机号重复），建议单一条件使用
	public Admin findAdminByPhone(String phone);
	//按通用属性查找，建议多条件查询使用，按主键查找则不建议用这个方法
	public List<Admin> findAdmin(Admin admin);
	public int adminNumbers();
	
	public int adminNumbersByAttribute(Admin admin);
	//查询数据库中所有数据（分页）
	public List<Admin> findAllAdmin();
	//按条件更新某个管理员的信息
	public void update(Admin admin);
	//删除管理员
	public void delete(String admin_id);
}
