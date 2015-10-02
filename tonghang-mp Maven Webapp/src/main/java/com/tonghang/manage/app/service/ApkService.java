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
	/**
	 * 业务功能：保存apk包的信息
	 * @param apk
	 */
	public void addApk(Apk apk){
		apkMapper.save(apk);
	}
	/**
	 * 业务功能：
	 * @param request
	 * @param apkname
	 * @return
	 */
	public Map<String,Object> apkUnCompression(HttpServletRequest request,String apkname){
		Map<String,Object> result = null;
		try {
			Runtime.getRuntime().exec(Constant.SHELL_HEAD+Constant.WIN_UNPACK_SHELL+Constant.WIN_APK_PATH+apkname+Constant.WIN_UNPACK_PATH);
			Apk apk = configReader.getApkMessage(request);
			if(apk!=null){
				result = CommonMapUtil.baseMsgToMapConvertor("app上传成功",200);
				result.putAll(apkConverter.apkConverter(apk));
			}else{
				result = CommonMapUtil.baseMsgToMapConvertor("app上传失败",500);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
