package com.tonghang.manage.admin.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tonghang.manage.admin.pojo.Admin;
import com.tonghang.manage.admin.service.AdminService;
import com.tonghang.manage.admin.util.AdminToMapConverter;
import com.tonghang.manage.common.controller.BaseController;
import com.tonghang.manage.common.exception.EmailAndPhoneExistException;
import com.tonghang.manage.common.exception.EmailExistException;
import com.tonghang.manage.common.exception.PhoneExistException;
import com.tonghang.manage.common.pojo.SystemConfig;
import com.tonghang.manage.common.service.SystemService;
import com.tonghang.manage.common.util.CommonMapUtil;
import com.tonghang.manage.common.util.Constant;
import com.tonghang.manage.common.util.SecurityUtil;
/**
 * 
 * notic:  每个页面必备index方法
 * 后期将写入BaseController中
 * index方法中需要读取systemconfig信息,并去掉存在所有页面的session中的notification提示
 * @author Administrator
 *
 */
@Controller("adminController")
@RequestMapping("admin")
public class AdminController extends BaseController{
	@Resource(name="adminService")
	private AdminService adminService;

	@Resource(name="systemService")
	private SystemService systemService;
	/**
	 * 业务功能：restful风格请求url，转发到login.jsp
	 * @param session
	 * @return
	 */
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String login(HttpSession session){
		session.setAttribute("notification", "");
		return "login";
	}
	/**
	 * 业务功能：restful风格请求url，转发到index.jsp
	 * @param session
	 * @return
	 */
	@RequestMapping(value="index",method=RequestMethod.GET)
	public String index(HttpSession session){
		SystemConfig config = systemService.getConfig();
		session.setAttribute("sys_cfg", config);
		session.setAttribute("pwd_notification", "");
		session.setAttribute("cfg_notification","");
		return "index";
	}
	@RequestMapping("addAdmin")
	public String addAdmin(HttpSession session){
		session.setAttribute("pwd_notification", "");
		session.setAttribute("cfg_notification","");
		return "addAdmin";
	}
	/**
	 * 业务功能：restful风格请求url，转发到setting.jsp
	 * @param session
	 * @return
	 */
	@RequestMapping(value="setting",method=RequestMethod.GET)
	public String updatePassword(HttpSession session){
		session.setAttribute("pwd_notification", "");
		session.setAttribute("cfg_notification","");
		return "setting";
	}
	
	@RequestMapping(value="checkAdmin",method=RequestMethod.GET)
	public String checkAdmin(){
		return "checkAdmin";
	}
	
	/**
	 * 业务功能：管理员登录
	 * @param session
	 * @param username	管理员名
	 * @param password		管理员密码
	 * @return
	 * key: notification(String)	表示登录页面的消息提示(登录业务)
	 * 		 login_admin(com.tonghang.manage.admin.pojo.Admin) 表示管理员信息
	 * 
	 * notic:只接受POST请求，validateAdmin方法返回要验证的用户。
	 * 登录失败返回错误信息，成功返回正确信息
	 * 登陆后获得系统参数并显示在界面
	 */
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(HttpSession session,@RequestParam String email,@RequestParam String password){
		Admin admin = adminService.validateAdmin(email, password);
		if(admin==null){
			session.setAttribute("notification", "<font color='red'>用户名或密码错误！</font>");
			return "login";
		}else {
			session.setAttribute("notification","");
			session.setAttribute("login_admin", admin);
			SystemConfig config = systemService.getConfig();
			session.setAttribute("sys_cfg", config);
			return "index";
		}
	}
	/**
	 * 业务功能：管理员修改密码
	 * @param session
	 * @param admin_id			管理员id
	 * @param oldpassword		原密码
	 * @param newpassword	新密码
	 * @return
	 * key: pwd_notification(String)	表示修改密码后的提示信息
	 * 
	 * notic:updatePaasword方法直接校验id对应的管理员的密码和旧密码是否一致，反馈前台布尔值表示修改是否成功
	 * 修改失败返回错误信息，成功返回正确信息
	 */
	@RequestMapping(value="update_password/{admin_id}",method=RequestMethod.POST)
	public String updatePassword(HttpSession session,@PathVariable String admin_id,@RequestParam String oldpassword,@RequestParam String newpassword){
		if(adminService.updatePassword(admin_id, newpassword, oldpassword)){
			session.setAttribute("pwd_notification", "<strong class='green'>修改成功！</strong>");
		}else session.setAttribute("pwd_notification", "<strong class='red'>修改失败！旧密码和原密码不匹配。</strong>");
		return "setting";
	}
	/**
	 * 
	 * 业务功能：管理员忘记密码找回
	 * @param session	
	 * @param username	管理员名
	 * @param email			管理员邮箱
	 * @return
	 * key: notification(String)	表示登录页面的消息提示(忘记密码找回业务)
	 * 
	 * notic: 现根据邮箱找到管理员，找到后根据管理员提供的名称和查出来的管理员信息进行比对校验。
	 * 其中过程中校验失败都将返回错误提示，发送成功返回正确提示。
	 */
	@RequestMapping(value="forget",method=RequestMethod.POST)
	public String forgetPassword(HttpSession session,@RequestParam String username,@RequestParam String email){
		Admin admin = new Admin();
		admin.setEmail(email);
		List<Admin> admins = adminService.findAdminByAttribute(admin,1);
		if(admins.size()==0){
			session.setAttribute("notification", "<font color='red'>该邮箱不存在</font>");
		}else if(!admins.get(0).getName().equals(username)){
			session.setAttribute("notification", "<font color='red'>邮箱与用户名不匹配</font>");			
		}else{
			adminService.forgetPassword(admins.get(0));
			session.setAttribute("notification", "<font color='green'>邮箱已发送，请及时查收</font>");	
		}
		return "login";
	}
	/**
	 * 业务功能：添加管理员
	 * @param session
	 * @param name			管理员姓名
	 * @param password		管理员账号密码
	 * @param email			管理员邮箱
	 * @param id_card		管理员身份证号
	 * @param province		管理员省份（和city用 - 连接符链接作为一条数据存到服务器）
	 * @param city			管理员城市（和province用 - 连接符链接存到服务器）
	 * @param phone		管理员联系方式
	 * @param power		管理员权限
	 * @return
	 * @throws PhoneExistException 
	 * @throws EmailExistException 
	 * @throws EmailAndPhoneExistException 
	 *  notice: 添加前检查添加者的邮箱是否重复，手机号是否重复。
	 */
	//@RequestParam String name,@RequestParam String password,@RequestParam String email,@RequestParam String id_card,
	//@RequestParam String province,@RequestParam String city,@RequestParam String phone,@RequestParam Integer power)
	@RequestMapping(value="addAdmin",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> addAdmin(HttpSession session, @RequestBody Map request)throws PhoneExistException, EmailExistException, EmailAndPhoneExistException{
		Map<String,Object> result = new HashMap<String,Object>();
		String email = (String) request.get("email");
		String name = (String) request.get("name");
		String phone = (String) request.get("phone");
		String province = (String) request.get("province");
		String city = (String) request.get("city");
		String id_card = (String) request.get("id_card");
		String password = (String) request.get("password");
		String power = (String)request.get("power");
		System.out.println("email:"+email+" name:"+name+" phone:"+phone+" province:"+province+" city:"+city+" id_card:"+id_card+" password:"+password+" power:"+power);
		Admin admin_mail = adminService.findAdminByEmail(email);
		Admin admin_phone = adminService.findAdminByPhone(phone);
		if(admin_mail==null&&admin_phone==null){
			Map<String,Object> map = CommonMapUtil.baseMsgToMapConvertor(Constant.ADDSUCCESS,200);
			Admin admin = new Admin();
			admin.setName(name);
			admin.setPhone(phone);
			admin.setAdmin_id(SecurityUtil.getUUID());
			admin.setCity(city);
			admin.setProvince(province);
			admin.setCreated_at(new Date());
			admin.setEmail(email);
			admin.setId_card(id_card);
			admin.setPassword(password);
			admin.setPower(Integer.parseInt(power));
			adminService.addAdmin(admin);
			result.put("result",map);
		}else{
			if(admin_phone!=null){
				if(admin_mail!=null)
					throw new EmailAndPhoneExistException();
				else throw new PhoneExistException();
			}
			if(admin_mail!=null){
				throw new EmailExistException();
			}
		}
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
	/**
	 * 业务功能：搜索管理员（按姓名）
	 * @param request	前台的搜索条件（name）封装在其中
	 * @param pageindex	分页查询当前页码
	 * @return
	 * notice:该功能只有超级管理员才有。前台ajax异步请求，后台返回数据JSON格式，
	 * struct:
	 * 			result{
	 * 				code:
	 * 				message:
	 * 				admins:[
	 * 					admin_id:'5d8f96s99d8256v8fgd8f6df9v',
	 * 					name:'lucy',
	 * 					id_card:'659846199203095468',
	 * 					email:'springframework@163.com',
	 * 					phone:'13622032169',
	 * 					power:2,
	 * 					province:'山东',
	 * 					city:'济南'
	 * 				],
	 *	 			account:5
	 * 			}
	 * 返回map则格式可以自定义，而返回对象则管理员密码会被人窃取
	 */
	@RequestMapping(value="checkAdmin",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> checkAdmin(@RequestBody Map request,@RequestParam int pageindex){
		Map<String,Object> result = new HashMap<String, Object>();
		Admin admin = new Admin();
		System.out.println("查询的name: "+(String) request.get("name"));
		admin.setName((String) request.get("name"));
		Map<String,Object> map = CommonMapUtil.baseMsgToMapConvertor(Constant.ADDSUCCESS,200);
		List<Admin> admins = adminService.findAdminByAttribute(admin,pageindex);
		int account = adminService.getAdminNumberByAttribute(admin);
		map.put("account", account);
		map.putAll(AdminToMapConverter.adminsConvert(admins));
		result.put("result", map);
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
	/**
	 * 业务功能：查询所有管理员
	 * @param pageindex 分页查询当前页码
	 * @return
	 * notice:该功能只有超级管理员才有。前台ajax异步请求，后台返回数据JSON格式，
	 * struct:
	 * 			result{
	 * 				code:,
	 * 				message:,
	 * 				account:,
	 * 				admins:[
	 * 					admin_id:'5d8f96s99d8256v8fgd8f6df9v',
	 * 					name:'lucy',
	 * 					id_card:'659846199203095468',
	 * 					email:'springframework@163.com',
	 * 					phone:'13622032169',
	 * 					power:2,
	 * 					province:'山东',
	 * 					city:'济南'
	 * 				]
	 * 			}
	 * 返回map则格式可以自定义，而返回对象则管理员密码会被人窃取
	 */
	@RequestMapping(value="checkAllAdmin",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> checkAllAdmin(@RequestParam Integer pageindex){
		Map<String,Object> result = new HashMap<String, Object>();
		Map<String,Object> map = CommonMapUtil.baseMsgToMapConvertor("server normal",200);
		List<Admin> admins = adminService.findAllAdmin(pageindex);
		int account = adminService.getAdminNumber();
		map.put("account", account);
		map.putAll(AdminToMapConverter.adminsConvert(admins));
		result.put("result", map);
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
	
	/**
	 * 业务功能：删除指定管理员
	 * @param request
	 * @return
	 * notice:该功能只有超级管理员才有。前台ajax异步请求，后台返回数据JSON格式，
	 */
	@RequestMapping(value="deleteAdmin",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> deleteAdmin(@RequestBody Map request){
		Map<String,Object> result = new HashMap<String, Object>();
		Map<String,Object> map = CommonMapUtil.baseMsgToMapConvertor(Constant.ADDSUCCESS,200);
		adminService.deleteAdminById((String)request.get("admin_id"));
		map.put("admin_id", (String)request.get("admin_id"));
		result.put("result", map);
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
	
	/**
	 * 业务功能：管理员退出
	 * @param session
	 * @return
	 * key: login_admin(com.tonghang.manage.admin.pojo.Admin) 表示管理员信息
	 * 
	 * notic:管理员退出通过服务器session去除响应键的值，从而使过滤器得不到值而拦截进入主页面等请求
	 */
	@RequestMapping(value="logout")
	public String logout(HttpSession session){
		session.removeAttribute("login_admin");
		return "login";
	}
}
