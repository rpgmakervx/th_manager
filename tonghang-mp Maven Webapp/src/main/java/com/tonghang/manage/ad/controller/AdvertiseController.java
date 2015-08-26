package com.tonghang.manage.ad.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.tonghang.manage.ad.service.AdvertiseService;
import com.tonghang.manage.common.service.SystemService;
import com.tonghang.manage.common.util.RequestUtil;

@Controller("advertiseController")
@RequestMapping("advertise")
public class AdvertiseController {
	
	@Resource(name="systemService")
	private SystemService systemService;
	
	@RequestMapping(value="index",method=RequestMethod.GET)
	public String index(){
		return "advertise";
	}

	@RequestMapping(value="adv",method=RequestMethod.POST)
	public String advUpload(HttpServletRequest request,@RequestParam String url,@RequestParam CommonsMultipartFile file){
		RequestUtil.advertiseImageUpload(request,file,url);
		systemService.updateAdvUrl(url);
		return "redirect:index";
	}
}
