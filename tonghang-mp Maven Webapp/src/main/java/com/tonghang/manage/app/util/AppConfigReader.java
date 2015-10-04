package com.tonghang.manage.app.util;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.stereotype.Component;

import com.tonghang.manage.app.pojo.Apk;
import com.tonghang.manage.common.util.Constant;
@Component("configReader")
public class AppConfigReader {

	private SAXReader reader ;
	
	public Apk getApkMessage(HttpServletRequest request,String context){
		reader = new SAXReader();
		File f = new File(request.getSession().getServletContext().getRealPath(Constant.ANDROID_MANIFAST_PATH));
		while(true){
			if(f.exists())
				break;
		}
		Apk apk = null;
		try {
			Document   document = reader.read(f);
			Element root = document.getRootElement();
			Attribute code_attr = root.attribute("versionCode"); 
			Attribute version_attr = root.attribute("versionName"); 
			String code = code_attr.getText();
			String version = version_attr.getText();
			apk = new Apk();
			apk.setApp_code(code);
			apk.setApp_version(version);
			apk.setUpload_at(new Date());
			apk.setContext(context);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return apk;
	}
}
