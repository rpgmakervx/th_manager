package com.tonghang.manage.app.service;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tonghang.manage.app.dao.ApkMapper;
import com.tonghang.manage.app.pojo.Apk;
import com.tonghang.manage.app.util.ApkToMapConverter;
import com.tonghang.manage.app.util.AppConfigReader;
import com.tonghang.manage.common.pojo.SystemConfig;
import com.tonghang.manage.common.service.SystemService;
import com.tonghang.manage.common.util.CommonMapUtil;
import com.tonghang.manage.common.util.Constant;
@Service("apkService")
public class ApkService {

	@Autowired
	private ApkMapper apkMapper;
	@Resource(name="configReader")
	private AppConfigReader configReader;
	@Resource(name="apkToConverter")
	private ApkToMapConverter apkConverter;
	@Resource(name="systemService")
	private SystemService systemService;
	/**
	 * 业务功能：保存apk包的信息
	 * @param apk
	 */
	public void addApk(Apk apk){
		apkMapper.save(apk);
	}
	/**
	 * update:2015-10-03
	 * update:2015-10-02
	 * 业务功能：调用shell解压apk，并获取其信息封装成对象后返回。
	 * @param request
	 * @param apkname
	 * @return
	 * notice:每增加一个新apk元组都要更新system_config表
	 * 			删除解压后的apk文件部分尚没做
	 */
	public boolean apkUnPack(HttpServletRequest request,String apkname){
		boolean result = false;
		try {
			Runtime.getRuntime().exec(Constant.CMD_HEAD+Constant.WIN_UNPACK_SHELL+Constant.WIN_APK_PATH+apkname+" "+ request.getSession().getServletContext().getRealPath(Constant.APK_UNPACK_PATH));
			result = true;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 从配置文件中把apk信息保存在数据库，并更新系统参数
	 * @param request
	 * @param context
	 * @return
	 */
	public Apk getApkFromConfig(HttpServletRequest request,String context){
		Apk apk = configReader.getApkMessage(request,context);
		if(apk!=null){
			apkConverter.apkConverter(apk);
			addApk(apk);
			SystemConfig config = systemService.getConfig();
			config.setApp_code(apk.getApp_code());
			systemService.updateConfig(config);
		} 
		return apk;
	}
	/**
	 * update:2015-10-02
	 * 业务功能：返回所有上传apk的记录
	 * @return
	 */
	public Map<String,Object> findAllApk(){
		Map<String,Object> result = CommonMapUtil.baseMsgToMapConvertor("server normal", 200);
		result.putAll(apkConverter.apksConverter(apkMapper.findAllApk()));
		return result;
	}
	/**
	 * update:2015-10-03
	 * 业务功能：获得当前系统正在使用的apk对象
	 * @return
	 */
	public Map<String,Object> getCurrentApk(){
		Map<String,Object> result = CommonMapUtil.baseMsgToMapConvertor("server normal", 200);
		result.putAll(apkConverter.apkConverter(apkMapper.findCurrentApk()));
		return result;
	}
}
