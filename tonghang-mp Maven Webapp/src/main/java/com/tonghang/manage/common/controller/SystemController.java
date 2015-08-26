package com.tonghang.manage.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tonghang.manage.ad.service.AdvertiseService;
import com.tonghang.manage.common.pojo.SystemConfig;
import com.tonghang.manage.common.service.SystemService;
/**
 * 
 * 每个页面必备index方法
 * 后期将写入BaseController中
 * index方法中需要读取systemconfig信息
 * @author Administrator
 *
 */
@Controller("systemController")
@RequestMapping("system")
public class SystemController {

	@Resource(name="systemService")
	private SystemService systemService;
	@Resource(name="advertiseService")
	private AdvertiseService advertiseService;
	/**
	 * 业务功能：restful风格请求url，转发到index.jsp
	 * @param session
	 * @return
	 * key: pwd_notification(String)	表示修改密码后的提示信息
	 * 		cfg_notification(String)		表示修改系统参数后的提示信息
	 * 		system_config_message(com.tonghang.manage.common.pojo.SystemConfig)	表示系统参数对象
	 * notic: 
	 */
	@RequestMapping(value="config",method=RequestMethod.GET)
	public String config(HttpSession session,HttpServletRequest request){
		SystemConfig config = systemService.getConfig();
		System.out.println("system:"+config);
		session.setAttribute("sys_cfg", config);
		session.setAttribute("pwd_notification", "");
		session.setAttribute("cfg_notification","");
		return "index";
	}
	/**
	 * 业务功能：restful风格请求url，转发到index.jsp
	 * @param session
	 * @return
	 * key: pwd_notification(String)	表示修改密码后的提示信息
	 * 		cfg_notification(String)		表示修改系统参数后的提示信息
	 * 		system_config_message(com.tonghang.manage.common.pojo.SystemConfig)	表示系统参数对象
	 * notic: 
	 */
	@RequestMapping(value="index",method=RequestMethod.GET)
	public String index(HttpSession session){
		SystemConfig config = systemService.getConfig();
		System.out.println("system:"+config);
		session.setAttribute("sys_cfg", config);
		session.setAttribute("pwd_notification", "");
		session.setAttribute("cfg_notification","");
		return "index";
	}
	/**
	 * 业务功能：修改系统参数
	 * @param session
	 * @param can_regist
	 * @param can_login
	 * @param upgrade
	 * @return
	 * key: cfg_notification(String)  表示修改完系统参数后的提示信息
	 * notice: 注意由于前台的switch控件在没选中时不传相应的参数(参数键不存在)，
	 * @RequestParam(required=false) 注解改参数可能不存在，不存在时为null.
	 * 
	 */
	@RequestMapping(value="config",method=RequestMethod.POST)
	public String changeSystemConfig(HttpSession session,@RequestParam(required=false) String can_regist ,@RequestParam(required=false) String can_login,@RequestParam(required=false) String use_adv,
								@RequestParam(required=false) String upgrade,@RequestParam(required=false) String third_adv,@RequestParam(required=false) String url){
		SystemConfig config = systemService.updateConfig(can_login, can_regist, upgrade, use_adv,third_adv, url);
		session.setAttribute("cfg_notification", "<strong class='green'>修改成功！</strong>");
		session.setAttribute("sys_cfg", config);
		return "index";
	}
	
	@RequestMapping(value="adv_url",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> showUrl(HttpServletRequest request){
		Map<String,Object> result = new HashMap<String, Object>();
		Map<String,Object> msg = new HashMap<String, Object>();
		List<String> advertise_urls = advertiseService.getAdvertiseUrl(request);
		SystemConfig config = systemService.getConfig();
		msg.put("now_url", config.getSelf_adv_url());
		msg.put("advertise_urls", advertise_urls);
		result.put("result", msg);
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
}
