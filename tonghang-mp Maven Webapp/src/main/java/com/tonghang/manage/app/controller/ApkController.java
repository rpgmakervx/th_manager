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
	/**
	 * update:2015-10-03
	 * update:2015-10-02
	 * @param request
	 * @return
	 */
	@RequestMapping(value="upload",method=RequestMethod.POST)
	public String index(HttpServletRequest request){
		request.getSession().removeAttribute("apk_upload_msg");
		return "appUpload";
	}
	/**
	 * update:2015-10-03
	 * @param request
	 * @return
	 */
	@RequestMapping(value="uploadApk",method=RequestMethod.POST)
	public String uploadApk(HttpServletRequest request){
		request.getSession().removeAttribute("apk_upload_msg");
		return "appUpload";
	}
	/**
	 * update:2015-10-03
	 * update:2015-10-02
	 * 业务功能：上传apk包
	 * @param request
	 * @param apk
	 * @param context
	 * @return
	 * notice:上传apk后在自定义的一个文件夹下解压包，读取apk信息，
	 * 			然后删除解压后的所有文件，修改系统及参数表（system_config）
	 */
	@RequestMapping(value="uploadApk",method=RequestMethod.POST)
	public String uploadApk(HttpServletRequest request,@RequestParam CommonsMultipartFile apk,@RequestParam String context){
		RequestUtil.apkUpload(request, apk);
		if(apkService.apkUnPack(request, apk.getName(),context)){
			request.getSession().setAttribute("apk_upload_msg", "apk上传成功");
		}else{
			request.getSession().setAttribute("apk_upload_msg", "apk上传中出现错误");
		}
		return "appUpload";
	}
	/**
	 * update:2015-10-02
	 * 业务功能：获取所有apk上传记录
	 * @return
	 * notice:暂不分页
	 */
	@RequestMapping(value = "record",method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> findAllRecord(){
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("result", apkService.findAllApk());
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
	/**
	 * update:2015-10-03
	 * 业务功能：获取当前系统参数中设置的apk记录
	 * @return
	 */
	@RequestMapping(value="current",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> getCurrentApk(){
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("result", apkService.getCurrentApk());
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
}
