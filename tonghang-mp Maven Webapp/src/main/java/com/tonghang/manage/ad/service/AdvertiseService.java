package com.tonghang.manage.ad.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.tonghang.manage.common.service.SystemService;
import com.tonghang.manage.common.util.FileUtil;

@Service("advertiseService")
public class AdvertiseService {

	@Resource(name="systemService")
	private SystemService sysService;
	@Resource(name="fileUtil")
	private FileUtil fileUtil;
	/**
	 * 修改系统参数中，自己广告的url
	 * @param url
	 */
	public void addAdvertise(String url){
		sysService.updateAdvUrl(url);
	}
	
	public List<String> getAdvertiseUrl(HttpServletRequest request){
		String advRealPathDir = request.getSession().getServletContext().getRealPath("resources");
		File advertiseDir = new File(advRealPathDir);
		fileUtil.setAdv_names(new ArrayList<String>());
		fileUtil.gatherAdv_names(advertiseDir);
		return fileUtil.getAdv_names();
	}
	
}
