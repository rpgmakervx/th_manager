package com.tonghang.manage.app.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.tonghang.manage.app.service.ApkService;
import com.tonghang.manage.common.util.RequestUtil;

@Controller("apkController")
@RequestMapping("app")
public class ApkController {

	@Resource(name="apkService")
	private ApkService apkService;
	
	@RequestMapping("upload")
	public String index(){
		return "appUpload";
	}
	
	@RequestMapping(value="uploadApk",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> uploadApk(HttpServletRequest request,@RequestParam CommonsMultipartFile apk){
		Map<String,Object> result = new HashMap<String, Object>();
		RequestUtil.apkUpload(request, apk);
		result.put("result", apkService.apkUnCompression(request, apk.getName()));
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
	@RequestMapping(value = "record",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> findAllRecord(){
		return null;
	}
}
