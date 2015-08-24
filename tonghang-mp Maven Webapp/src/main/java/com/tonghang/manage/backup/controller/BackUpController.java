package com.tonghang.manage.backup.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tonghang.manage.backup.service.BackUpService;
import com.tonghang.manage.common.controller.BaseController;
import com.tonghang.manage.common.exception.BackupException;
import com.tonghang.manage.common.util.TimeUtil;

@Controller("backupController")
@RequestMapping("backup")
public class BackUpController extends BaseController{

	@Resource(name="backupService")
	private BackUpService backupService;
	
	@RequestMapping("index")
	public String backup(){
		return "backup";	
	}
	
	@RequestMapping(value="backupData",method=RequestMethod.POST)
	@ResponseBody public ResponseEntity<Map<String,Object>> backupData() throws BackupException{
		Map<String,Object> result = new HashMap<String, Object>();
		Map<String,String> msg = new HashMap<String, String>();
		backupService.backupDB("tonghang_"+TimeUtil.getFormatDateString(new Date())+".sql");
		msg.put("message", "备份成功！操作时间："+TimeUtil.getFormatString(new Date()));
		msg.put("code", "200");
		result.put("result", msg);
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
	
	@RequestMapping(value="recoverData",method=RequestMethod.POST)
	@ResponseBody public ResponseEntity<Map<String,Object>> recoverData(@RequestBody Map map) throws BackupException{
		Map<String,Object> result = new HashMap<String, Object>();
		Map<String,String> msg = new HashMap<String, String>();
		backupService.recoverDB((String)map.get("date"));
		msg.put("message", "还原成功！数据较大时可能需要一点时间，请稍等。操作时间："+TimeUtil.getFormatString(new Date()));
		msg.put("code", "200");
		result.put("result", msg);
		return new ResponseEntity<Map<String,Object>>(result,HttpStatus.OK);
	}
}
